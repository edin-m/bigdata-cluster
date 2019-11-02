package io.leres.bigdata6;

import io.leres.bigdata6.kafka.KafkaService;
import io.leres.bigdata6.model.User;
import org.springframework.context.annotation.Profile;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Profile("producer")
@RestController
@RequestMapping("/api")
public class MessageApi {

    private SimpleProducer simpleProducer;
    private KafkaService kafkaService;

    public MessageApi(SimpleProducer simpleProducer, KafkaService kafkaService) {
        this.simpleProducer = simpleProducer;
        this.kafkaService = kafkaService;
    }

    @PostMapping("/message")
    public ResponseEntity<String> message(@RequestBody String message) {
        simpleProducer.send(message);
        return ResponseEntity.ok("Message received: " + message);
    }

    @PostMapping("/user")
    public ResponseEntity<User> kafka(@RequestBody User user) {
        kafkaService.send("simple-message", user);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/hello")
    public String helloWorld() {
        return "hello world";
    }
}
