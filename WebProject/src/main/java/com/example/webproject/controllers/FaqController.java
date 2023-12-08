package com.example.webproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {

    @GetMapping("/faq.ftlh")
    public String showFaqPage() {
        return "faq";
    }
}
