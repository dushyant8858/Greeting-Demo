package com.greeting.demo;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Getter
public class MyBean {

    private final String serverPort;

    @Autowired
    public MyBean(@Value("${server.port}") String serverPort) {
        this.serverPort = serverPort;

        System.out.println("\n");
        System.out.println("================== " + serverPort + " ================== ");
        System.out.println("\n");
    }
}

