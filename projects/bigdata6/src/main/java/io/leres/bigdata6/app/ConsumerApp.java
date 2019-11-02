package io.leres.bigdata6.app;


import io.leres.bigdata6.kafka.UserConsumer;
import io.leres.bigdata6.model.User;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Arrays;
import java.util.Iterator;

@Profile("consumer")
@Component
public class ConsumerApp implements CommandLineRunner {

    @Autowired
    private UserConsumer userConsumer;

    @Override
    public void run(String... args) throws Exception {
        userConsumer.subscribe(Arrays.asList("simple-message"));

        while(true) {
            System.out.println("polling");

            ConsumerRecords<Integer, User> records = userConsumer.poll(Duration.ofSeconds(15));

            System.out.println("got " + records.count() + " records");

            Iterator<ConsumerRecord<Integer, User>> it = records.iterator();
            while (it.hasNext()) {
                ConsumerRecord<Integer, User> record = it.next();

                User user = record.value();

                if (user != null) {
                    System.out.println("got user " + record.key() + " with username " + record.value().getUserName());
                } else {
                    System.out.println("user null");
                }
            }
        }
    }
}
