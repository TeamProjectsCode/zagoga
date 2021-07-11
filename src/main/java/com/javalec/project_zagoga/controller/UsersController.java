package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Booking;
import com.javalec.project_zagoga.dto.BookingRoomGhouseUsers;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.UsersMapper;
import com.javalec.project_zagoga.security.PrincipalUser;
import com.javalec.project_zagoga.services.*;

import com.javalec.project_zagoga.vo.AuthInfo;
import com.javalec.project_zagoga.vo.UsersVO;
import lombok.AllArgsConstructor;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
    private final AuthService authService;
	private final MailService mailService;
	private final BookService bookService;

	@RequestMapping(value = "/mypage_user/{u_no}", method = RequestMethod.GET)
	public String mypage_user(@PathVariable("u_no")String u_no, Model model) {
		BookingRoomGhouseUsers info = this.userService.getBook(u_no);

		System.out.println(info);
		model.addAttribute("info", info);
		return "/mypage/mypage_user";
	}

	//user: 유저 마이페이지 예약히스토리
	@RequestMapping(value = "/mypage_user_booking_list/{u_no}", method = RequestMethod.GET)
	public String mypage_user_booking_list(@PathVariable("u_no")String u_no, Model model) {
		List<BookingRoomGhouseUsers> myBookList = this.userService.getMyBookList(u_no);

		model.addAttribute("myBookList", myBookList);
		System.out.println(myBookList);
		return "/mypage/mypage_user_booking_list";
	}

	//user: 유저 마이페이지 히스토리에서 예약상세
	@RequestMapping("/mypage_user_booking_detail/{b_no},{u_no}")
	public String mypage_user_booking_detail(@PathVariable("b_no")String b_no, @PathVariable("u_no")String u_no, Model model) {
		BookingRoomGhouseUsers myBookSelectOneDetail = this.userService.myBookSelectOneDetail(b_no, u_no);
		System.out.println(myBookSelectOneDetail);
		model.addAttribute("mbs", myBookSelectOneDetail);
		return "/mypage/mypage_user_booking_detail";
	}

	//user : 마이페이지 유저 회원정보 변경
	@GetMapping("/mypage_user_info")
	public String mypage_user_info() {
		return "/mypage/mypage_user_info";
	}

	@GetMapping("/bookingCancel/{b_no}")
	public String bookingCancel(@AuthenticationPrincipal PrincipalUser principalUser, @PathVariable("b_no") int b_no){
		UsersVO user = (UsersVO) principalUser.getAuthInfo();
		bookService.updateBookingState(b_no, 3);
		return "redirect:/user/mypage_user_booking_list/"+user.getU_no();
	}

//	 opener: pw_modify.jsp
	@GetMapping("/pw_modify")
	public String openerPWModify() {
		return "/mypage/pw_modify";
	}

	@ResponseBody
	@PostMapping("/checkMail")
	public boolean checkEmail(HttpServletRequest request, @Param("email") String email){
		HttpSession session = request.getSession();
		return mailService.mailSend(session, email);
	}

//	change password at mypage_user_info.jsp
	@PostMapping("/updatUserPWD")
	@ResponseBody
	public int updateUserPWD(HttpServletRequest request, @AuthenticationPrincipal PrincipalUser principalUser, String inputCode, String new_password) {
		HttpSession session = request.getSession();
		if(mailService.certification(session, Integer.parseInt(inputCode))){
			AuthInfo authInfo = (AuthInfo) principalUser.getAuthInfo();
			int sc_no = authInfo.getAuthValue().getSc_no();
			authService.updatePW(sc_no,  new_password);
			return 1;
		}
		return -1;
	}

//	 duplicate nickname checking  at mypage_user_info.jsp
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
