package com.greeting.demo;

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.*;

@RestController
public class GreetingController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

//    These paths are case-sensitive it appears
    @GetMapping("/greeting")
    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
        return new Greeting(counter.incrementAndGet(), String.format(template, name));
    }

//    These paths are case-sensitive it appears
    @RequestMapping(value = "/currentdatetime", method = RequestMethod.GET)
    public String currentDate() {
        return java.time.LocalDateTime.now().toString();
    }
}