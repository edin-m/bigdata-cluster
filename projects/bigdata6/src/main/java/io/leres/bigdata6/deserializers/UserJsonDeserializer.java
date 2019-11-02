package io.leres.bigdata6.deserializers;

import io.leres.bigdata6.model.User;
import io.leres.bigdata6.util.serializers.CustomObjectMapper;
import org.apache.kafka.common.serialization.Deserializer;

import java.io.IOException;

public class UserJsonDeserializer implements Deserializer<User> {
    @Override
    public User deserialize(String topic, byte[] data) {
        User user = null;

        try {
            user = CustomObjectMapper.MAPPER.readValue(data, User.class);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return user;
    }
}
