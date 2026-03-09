package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/layout")
    public String home(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/jsp/home.jsp");
        return "layout"; 
    }
}
