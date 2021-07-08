package com.javalec.project_zagoga.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/host")
public class HostController {

    @RequestMapping("/mypage_host_info")
    public String mypage_host_info( ) {
        return "/mypage/mypage_host_info";
    }

    @RequestMapping("/mypage_host")
    public String mypage_host(){
        return"/mypage/mypage_host";
    }

}
