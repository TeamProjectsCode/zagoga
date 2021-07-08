package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.AdminMapper;
import com.javalec.project_zagoga.services.HostService;
import com.javalec.project_zagoga.services.UsersService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@AllArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final UsersService usersService;
    private final HostService hostService;

    @GetMapping("/user_list")
    public String user_list(Model model) {
        List<Users> userList = this.usersService.userList();
        model.addAttribute("userList",userList);
        return "/admin/user_list";
    }





    // ADMIN: 사업자 정보 디테일 ( 사업 승인 /거절 )
    @GetMapping("/host_reading")
    public String host_reading() {
        return "/admin/host_reading";
    }

    // ADMIN: 사업자 리스트
    @RequestMapping("/host_list")
    public String hostlist(Model model) {
        List<Host> host = hostService.hostlist();
        System.out.println("host.toString : " + host.toString());
        model.addAttribute("hList", host);
        return "/admin/host_list";
    }

}
