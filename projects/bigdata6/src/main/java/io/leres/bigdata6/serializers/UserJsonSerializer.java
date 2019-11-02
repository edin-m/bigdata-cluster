package io.leres.bigdata6.serializers;

import com.fasterxml.jackson.core.JsonProcessingException;
import io.leres.bigdata6.model.User;
import io.leres.bigdata6.util.serializers.CustomObjectMapper;
import org.apache.kafka.common.serialization.Serializer;

public class UserJsonSerializer implements Serializer<User> {

    @Override
    public byte[] serialize(String topic, User data) {
        byte[] retVal = null;

        try {
            retVal = CustomObjectMapper.MAPPER.writeValueAsString(data).getBytes();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return retVal;
    }

}
