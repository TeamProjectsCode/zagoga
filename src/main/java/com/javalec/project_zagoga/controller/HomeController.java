package com.javalec.project_zagoga.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	 @RequestMapping("/header") public String header() { return "header"; }
	/* 
	 * @RequestMapping("/footer") public String footer() { return "footer"; }
	 * 
	 * @RequestMapping("/main") public String main() { return "main"; }
	 */
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/host_list")
	public String host_list() {
		return "admin/host_list";
	}
	@RequestMapping("/host_reading")
	public String host_reading() {
		return "admin/host_reading";
	}
	@RequestMapping("/mypage_host_customerList")
	public String mypage_host_customerList() {
		return "mypage/mypage_host_customerList";
	}
	@RequestMapping("/mypage_host_info")
	public String mypage_host_info() {
		return "mypage/mypage_host_info";
	}
	@RequestMapping("/mypage_house_info")
	public String mypage_house_info() {
		return "mypage/mypage_house_info";
	}
	@RequestMapping("/mypage_user_booking")
	public String mypage_user_booking() {
		return "mypage/mypage_user_booking";
	}
	@RequestMapping("/mypage_user_info")
	public String mypage_user_info() {
		return "mypage/mypage_user_info";
	}
	@RequestMapping("/mypage_user")
	public String mypage_user() {
		return "mypage/mypage_user";
	}
	@RequestMapping("/mypage_host")
	public String mypage_host() {
		return "mypage/mypage_host";
	}
	@RequestMapping("/booking_confirm")
	public String booking_confirm() {
		return "room/booking_confirm";
	}
	@RequestMapping("/gHouse_detail")
	public String gHouse_detail() {
		return "room/gHouse_detail";
	}
	@RequestMapping("/gHouse_list")
	public String gHouse_list() {
		return "room/gHouse_list";
	}
	@RequestMapping("/review_write")
	public String review_write() {
		return "room/review_write";
	}
	@RequestMapping("/room_cancel")
	public String room_cancel() {
		return "room/room_cancel";
	}
	@RequestMapping("/room_detail")
	public String room_detail() {
		return "room/room_detail";
	}
	@RequestMapping("/user_join")
	public String user_join() {
		return "user/user_join";
	}
//	@RequestMapping("mypage_booking")
//	public String mypage_booking() {
//		return "mypage_booking";
//	}
	@RequestMapping("join_check")
	public String join_check() {
		return "join_check";
	}
}
