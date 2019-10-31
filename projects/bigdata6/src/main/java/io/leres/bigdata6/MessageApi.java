package io.leres.bigdata6;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class MessageApi {
    private final SimpleProducer simpleProducer;

    public MessageApi(SimpleProducer simpleProducer) {
        this.simpleProducer = simpleProducer;
    }

    @PostMapping("/message")
    public ResponseEntity<String> message(@RequestBody String message) {
        simpleProducer.send(message);
        return ResponseEntity.ok("Message received: " + message);
    }

    @GetMapping("/hello")
    public String helloWorld() {
        return "hello world";
    }
}
