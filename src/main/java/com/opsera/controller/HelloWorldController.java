package com.opsera.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {


    @GetMapping
    public String hello() {
        return "Opsera EBS Testing with Domain and Zone id";
    }
}
