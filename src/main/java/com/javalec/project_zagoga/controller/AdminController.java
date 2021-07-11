package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.AdminMapper;
import com.javalec.project_zagoga.services.HostService;
import com.javalec.project_zagoga.services.UsersService;
import com.javalec.project_zagoga.vo.HostVO;
import com.javalec.project_zagoga.vo.UsersVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        System.out.println(userList);
        model.addAttribute("userList",userList);
        return "/admin/user_list";
    }

    // user detail page: load one user information.
    @GetMapping("/user_detail")
    public String getOneUserInfo(@RequestParam("u_no") int u_no, Model model) {
        UsersVO user = usersService.getUserByUNo(u_no);
        model.addAttribute("userInfo", user);
        return "/admin/user_detail";
    }

    // ADMIN: 사업자 정보 디테일 ( 사업 승인 /거절 )
    @GetMapping("/host_reading")
    public String host_reading() {
        return "/admin/host_reading";
    }

    // ADMIN: 사업자 리스트
    @RequestMapping("/host_list")
    public String hostList(Model model) {
        List<HostVO> host = hostService.hostList();
        System.out.println("host.toString : " + host.toString());
        model.addAttribute("hList", host);
        return "/admin/host_list";
    }

}
