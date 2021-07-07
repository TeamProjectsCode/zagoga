package com.javalec.project_zagoga.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping("")
    public String loginPage() { return "login"; }

//    @PostMapping("/user")
//    public String loginUser(AuthInfo authInfo, Model model) {
//        System.out.println(authInfo.toString());
////        authService.getAuthInfo();
////        Users u = usersService.checkUserMailAndPwd(user);
//        model.addAttribute("user", u);
//        if (u == null){
//            return "login";
//        }
//        System.out.println(u.toString());
//        return "main";
//    }
//
//    @PostMapping("/host")
//    public void loginHost(){
//        // 사업자 로그인
//
//    }

}
