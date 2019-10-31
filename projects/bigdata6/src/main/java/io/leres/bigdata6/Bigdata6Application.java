package io.leres.bigdata6;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@EnableKafka
@SpringBootApplication
public class Bigdata6Application {

    public static void main(String[] args) {
        SpringApplication.run(Bigdata6Application.class, args);
    }

}
