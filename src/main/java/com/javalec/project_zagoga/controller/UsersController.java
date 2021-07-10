package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.BookingRoomGhouseUsers;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.UsersMapper;
import com.javalec.project_zagoga.security.PrincipalUser;
import com.javalec.project_zagoga.services.AjaxService;
import com.javalec.project_zagoga.services.UsersService;

import lombok.AllArgsConstructor;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/user")
public class UsersController {

    private final UsersMapper usersMapper;
    private final UsersService userService;

//	@RequestMapping("/mypage_user")
//	public String mypage_user() {
//		return "/mypage/mypage_user";
//	}

	@RequestMapping(value = "/mypage_user/{u_no}", method = RequestMethod.GET)
	public String mypage_user(@PathVariable("u_no")String u_no, Model model) {
		List<BookingRoomGhouseUsers> info = this.userService.getBook(u_no);
		System.out.println(info);
		model.addAttribute("info", info);
		return "/mypage/mypage_user";
	}

	//user : 마이페이지 유저 회원정보 변경
	@GetMapping("/mypage_user_info")
	public String mypage_user_info() {
		return "/mypage/mypage_user_info";
	}

	//user: 유저 마이페이지 예약히스토리
	@GetMapping("/mypage_user_booking_list")
	public String mypage_user_booking_list() {
		return "/mypage/mypage_user_booking_list";
	}

	//user: 유저 마이페이지 히스토리에서 예약상세
	@GetMapping("/mypage_user_booking_detail")
	public String mypage_user_booking_detail() {
		return "/mypage/mypage_user_booking_detail";
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

	//nick ajax ,,
	private final AjaxService service;
	@PostMapping("/updateNick")
	@ResponseBody
	public int user_modify(HttpServletRequest request, Model model ){
		String nick=request.getParameter("nick");
//		System.out.print("@@### nick"+nick);
		int result =  service.infoService(nick);
//		System.out.print("@@### result"+result);
		return result;
	}

	@PostMapping("/updateInfo")
	public String updateUserInfo(@AuthenticationPrincipal PrincipalUser principalUser, Users user){
		System.out.println(user.toString());
		userService.updateUserInfo(principalUser, user);
		return "redirect:/user/mypage_user_info";
	}

	@PostMapping("/delete.do")
	@ResponseBody
	public String deleteUser(HttpServletRequest request){ // 유저 삭제
		int uno = Integer.parseInt(request.getParameter("no"));
		System.out.println(uno);
		String str = "";
		int num = usersMapper.delete(uno);
		System.out.println(num);
		if (num == 1){
			str = "Y";
		}else{
			str = "N";
		}

		return str;
	}

}
