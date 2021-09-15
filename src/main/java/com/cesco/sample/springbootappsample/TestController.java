package com.cesco.sample.springbootappsample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    
    @GetMapping("/health")
    @ResponseBody
    public Boolean health() {
        return true;
    }

    @GetMapping("/test")
    @ResponseBody
    public Object test(@RequestParam("test-value") Object testValue) {

        return testValue.toString() + " => OK!";
    }
}
