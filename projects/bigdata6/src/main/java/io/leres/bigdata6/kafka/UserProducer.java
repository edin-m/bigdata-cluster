package io.leres.bigdata6.kafka;

import io.leres.bigdata6.model.User;
import io.leres.bigdata6.serializers.UserJsonSerializer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.common.serialization.IntegerSerializer;

import java.util.Properties;

public class UserProducer extends KafkaProducer<Integer, User> {
    public UserProducer(Properties properties) {
        super(properties, new IntegerSerializer(), new UserJsonSerializer());
    }
}
