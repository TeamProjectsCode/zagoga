package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.dto.Users;
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
    @GetMapping("/user_detail")
    public String user_detail(HttpServletRequest request , Model model) {
    	String u_no = request.getParameter("u_no");
    	List<Users> userInfo = this.usersService.userInfo(u_no);
    	model.addAttribute("userInfo",userInfo);
    	return "/admin/user_detail";
    }
	@GetMapping("/host_list")
	public String host_list(Model model) {
		List<Host> hostList = this.hostService.hostList();
		model.addAttribute("hostList",hostList);
		return "/admin/host_list";
	}
	@GetMapping("/host_reading")
	public String host_reading() {
		return "/admin/host_reading";
	}
}
