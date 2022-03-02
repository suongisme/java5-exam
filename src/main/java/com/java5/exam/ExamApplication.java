package com.java5.exam;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
@Controller
public class ExamApplication {

    @Value("${view.default}")
    private String viewDefault;

    @GetMapping
    public String redirectToViewDefault() {
        return "redirect:"+this.viewDefault;
    }

    public static void main(String[] args) {
        SpringApplication.run(ExamApplication.class, args);
    }

}
