package com.example.webproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfoController {

    @GetMapping("/info.ftlh")
    public String showInfoPage() {
        return "info";
    }
}
