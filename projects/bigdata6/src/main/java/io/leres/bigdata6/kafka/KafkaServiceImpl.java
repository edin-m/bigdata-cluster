package io.leres.bigdata6.kafka;

import io.leres.bigdata6.model.User;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.springframework.stereotype.Service;

@Service
public class KafkaServiceImpl implements KafkaService {

    private UserProducer userProducer;

    public KafkaServiceImpl(UserProducer userProducer) {
        this.userProducer = userProducer;
    }

    @Override
    public void send(String topic, User user) {
        ProducerRecord<Integer, User> record = new ProducerRecord<>(topic, user.getUserId(), user);
        userProducer.send(record, (meta, ex) -> System.out.println("sent to topic!"));
    }
}
