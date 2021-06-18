package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.services.RegisterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/regist")
public class RegisterController {

    private RegisterService registerService;
    public RegisterController(RegisterService registerService) { this.registerService=registerService; }

    @GetMapping("")
    public String registerPage() { return "signup_user"; }

    @PostMapping("/user")
    public String insertUser(Users user) {
        registerService.userInsert(user);
        return "main";
    }

}
