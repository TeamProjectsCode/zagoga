package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.services.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login")
public class LoginController {

    private final LoginService loginService;
    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping("")
    public String loginPage() { return "login"; }

    @PostMapping("/user")
    public String loginUser(Users user, Model model) {
        System.out.println(user.toString());
        Users u = loginService.checkUserMailAndPwd(user);
        model.addAttribute("user", u);
        if (u == null){
            return "login";
        }
        System.out.println(u.toString());
        return "main";
    }

    @PostMapping("/login/business")
    public void loginBusiness(){
        // 사업자 로그인

    }

}
