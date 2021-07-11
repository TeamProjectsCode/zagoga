package com.javalec.project_zagoga.controller;

//import com.javalec.project_zagoga.services.AjaxService;
import com.javalec.project_zagoga.services.HostService;
import com.javalec.project_zagoga.services.UsersService;

import lombok.AllArgsConstructor;
		import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.UsersMapper;
import com.javalec.project_zagoga.services.AjaxService;
import lombok.AllArgsConstructor;
		import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */

@Controller
@AllArgsConstructor
public class HomeController {

	// USER: user 예약확인페이지1
	@RequestMapping("/user/booking_confirm")
	public String booking_confirm() {
		return "/room/booking_confirm";
	}
	//USER: user 예약증페이지2
	@RequestMapping("/user/booking_completion")
	public String booking_completion() { return "/room/booking_completion"; }
	//USER: user 예약증페이지2

    //■■■ URL 변경
	// BOARD: 게스트하우스 디테일 페이지 ( 게스트하우스 정보 , 룸 목록 ,게스트 하우스 평점 ,  )
	@RequestMapping("/board/ghouse/{gh_no}/detail")
	public String booking_detail() {
		return "/user/booking_detail";
	}

    //	■■■ URL 변경
	// BOARD: 게스트 하루스 목록페이지
	@RequestMapping("/board/ghouse/list")
	public String booking_list() {
		return "/user/booking_list";
	}


    //	■■■ URL 변경
	// "":  룸 상세 정보페이지  ( 예약하기  )
	@RequestMapping("/board/ghouse/room/{r_no}")
	public String room_detail() {
		return "/room/room_detail";
	}

    //	■■■ URL 변경
	// "": 취소 규정
	@RequestMapping("/board/roomcancel")
	public String roomcancel() {
		return "/room/room_cancel";
	}

//	-----------------------------------------------------------------------------------------------------------------------------


	//user 댓글 기능
	@RequestMapping("/user/review")
	public String review() {
		return "/user/review";
	}
	//회원가입 호스트 유저 구분
	@RequestMapping("/join_check")
	public String join_check() {
		return "/join_check";
	}

	@RequestMapping("host/mypage_room_info")
	public String mypage_room_info() {
		return "mypage/mypage_room_info";
	}

	//board : 게스트 하우스 정보 디테일
	@RequestMapping("board/gHouse_detail")
	public String gHouse_detail() {
		return "room/gHouse_detail";
	}

	//user : 댓글 추가 기능
//	@RequestMapping("user/review_write")
//	public String review_write() {
//		return "room/review_write";
//	}
	//board : 게스트 하우스 예약 취소 페이지 
	@RequestMapping("board/room_cancel")
	public String room_cancel() {
		return "room/room_cancel";
	}

	@RequestMapping("/user/mypage_check")
	public String mypage_user_check(HttpServletRequest request , Model model) {
		String no = request.getParameter("no");
		model.addAttribute("no",no);
		return "mypage/mypage_check";
	}
	@RequestMapping("/host/mypage_check")
	public String mypage_host_check(HttpServletRequest request , Model model) {
		String no = request.getParameter("no");
		model.addAttribute("no",no);
		return "mypage/mypage_check";
	}

	//지도api..
	@RequestMapping("/api/naver_map")
	public String naver_map() {
		return "room/naver_map";
	}

	@RequestMapping("mypage_booking")
	public String mypage_booking() {
		return "mypage_booking";
	}
}

