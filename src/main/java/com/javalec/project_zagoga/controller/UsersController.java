package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.GhouseRoom;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.UsersMapper;
import com.javalec.project_zagoga.security.PrincipalUser;
import com.javalec.project_zagoga.services.UsersService;

import lombok.AllArgsConstructor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@AllArgsConstructor
@RequestMapping("/user")
public class UsersController {

    private final UsersMapper usersMapper;
    private final UsersService userService;
    //user : 마이페이지 유저 회원정보 변경
    @RequestMapping("/mypage_user_info")
    public String mypage_user_info(@AuthenticationPrincipal PrincipalUser user, Model model) {
         model.addAttribute("user", user.getAuthInfo());
        return "/mypage/mypage_user_info";
    }
    @PostMapping("/pw_check")
    @ResponseBody
	public String pw_check(HttpServletRequest request,@RequestParam(value = "pw") String pw , Model model) {
    	String no = request.getParameter("no");
    	String db_pw = userService.pw_check(no);
    	String result = "";
    	if(pw.equals(db_pw)){
    		result = "y";
    	}
    	else {
    		result = "n";
    	}
    	model.addAttribute("result",result);
    	
    	return "/mypage_check";
	}
}
