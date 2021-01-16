package com.greeting.demo;

import lombok.*;

@Getter
@Setter
//@NoArgsConstructor
@RequiredArgsConstructor
//@AllArgsConstructor
public class Greeting {

//    Variable may not have been initialized
//    https://projectlombok.org/features/constructor
//    I think this is ok because it runs and Postman works
    private final long id;
    private final @NonNull String content;

}
