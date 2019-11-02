package io.leres.bigdata6.kafka;

import io.leres.bigdata6.deserializers.UserJsonDeserializer;
import io.leres.bigdata6.model.User;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.IntegerDeserializer;

import java.util.Properties;

public class UserConsumer extends KafkaConsumer<Integer, User> {
    public UserConsumer(Properties properties) {
        super(properties, new IntegerDeserializer(), new UserJsonDeserializer());
    }
}
