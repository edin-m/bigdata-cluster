package io.leres.bigdata6.kafka;

import io.leres.bigdata6.model.User;

public interface KafkaService {

    void send(String topic, User user);
}
