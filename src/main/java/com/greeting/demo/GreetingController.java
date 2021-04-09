package com.greeting.demo;

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.*;

@RestController
public class GreetingController {

    private static final String template = "Hello, %s !!!  !!! ";
    private final AtomicLong counter = new AtomicLong();

        // // https://www.veracode.com/blog/secure-development/docker-and-javaopts
        // long heapSize = Runtime.getRuntime().totalMemory();
        // long heapMaxSize = Runtime.getRuntime().maxMemory();
        // long heapFreeSize = Runtime.getRuntime().freeMemory();
        // log.info("HeapSize : {}",heapSize);
        // log.info("heapMaxSize: {}",heapMaxSize);
        // log.info("heapFreeSize: {}",heapFreeSize);

//    These paths are case-sensitive it appears
    @GetMapping("/greeting")
    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {

        // https://www.veracode.com/blog/secure-development/docker-and-javaopts 
        // long heapSize = Runtime.getRuntime().totalMemory();
        // long heapMaxSize = Runtime.getRuntime().maxMemory();
        // long heapFreeSize = Runtime.getRuntime().freeMemory();
        // log.info("HeapSize : {}",heapSize);
        // log.info("heapMaxSize: {}",heapMaxSize);
        // log.info("heapFreeSize: {}",heapFreeSize);
        return new Greeting(counter.incrementAndGet(), String.format(template, name));

    }

}
