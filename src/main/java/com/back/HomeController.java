package com.back;

import lombok.SneakyThrows;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;

@RestController
public class HomeController {
    @SneakyThrows
    @GetMapping("/")
    public String home() {
        return "V14 : " + InetAddress.getLocalHost().getHostName();
    }
}
