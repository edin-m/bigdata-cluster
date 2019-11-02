package io.leres.bigdata6.util.serializers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.stereotype.Component;

@Component
public class CustomObjectMapper extends ObjectMapper {

    public static ObjectMapper MAPPER = new CustomObjectMapper();

    public CustomObjectMapper() {
        registerModule(new Jdk8Module());
        registerModule(new JavaTimeModule());
    }
}
