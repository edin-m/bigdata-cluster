package io.leres.bigdata6.config.kafka;

import io.leres.bigdata6.kafka.UserConsumer;
import io.leres.bigdata6.kafka.UserProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import java.util.Properties;

@Configuration
public class KafkaConfig {

    @Value("${kafka_brokers:localhost:9092}")
    private String kafkaBrokers;

    @Bean("kafkaProps")
    public Properties createKafkaProperties() {
        Properties props = new Properties();

        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, kafkaBrokers);

        return props;
    }

    @Bean(destroyMethod = "close")
    @DependsOn("kafkaProps")
    public UserProducer createKafkaProducer(@Qualifier("kafkaProps") Properties kafkaProps) {
        return new UserProducer(kafkaProps);
    }

    @Bean(destroyMethod = "close")
    @DependsOn("kafkaProps")
    public UserConsumer createKafkaConsumer(@Qualifier("kafkaProps") Properties kafkaProps) {
        Properties props = new Properties();
        props.putAll(kafkaProps);
        props.put("group.id", "test");
        return new UserConsumer(props);
    }
}
