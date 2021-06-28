package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.services.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping("")
    public String loginPage() { return "login"; }

//    로그인 부분을 따로 담당할 필요가 없음
//    @PostMapping("/user")
//    public String loginUser(Users user, Model model) {
//        System.out.println(user.toString());
//        Users u = usersService.checkUserMailAndPwd(user);
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
