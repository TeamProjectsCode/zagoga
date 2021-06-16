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

	@RequestMapping("/header")
	public String header() {
		return "header";
	}

	@RequestMapping("/footer")
	public String footer() {
		return "footer";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@RequestMapping("admin/host_list")
	public String host_list() {
		return "admin/host_list";
	}

	@RequestMapping("admin/host_reading")
	public String host_reading() {
		return "admin/host_reading";
	}
	@RequestMapping("user/booking_confirm")
	public String booking_confirm() {
		return "user/booking_confirm";
	}
	@RequestMapping("user/booking_detail")
	public String booking_detail() {
		return "user/booking_detail";
	}
	@RequestMapping("user/booking_list")
	public String booking_list() {
		return "user/booking_list";
	}
	@RequestMapping("user/user_list")
	public String user_list() {
		return "user/user_list";
	}
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("host/host_join")
	public String host_join() {
		return "host/host_join";
	}
	@RequestMapping("user/room_detail")
	public String room_detail() {
		return "user/room_detail";
	}
	@RequestMapping("user/roomcancel")
	public String roomcancel() {
		return "user/roomcancel";
	}
	@RequestMapping("user/user_join")
	public String user_join() {
		return "user/user_join";
	}
	@RequestMapping("host/gh_write")
	public String gh_write() {
		return "host/gh_write";
	}
	@RequestMapping("host/mypage_host_fix")
	public String mypage_host_fix() {
		return "host/mypage_host_fix";
	}
	@RequestMapping("host/mypage_house_fix")
	public String mypage_house_fix() {
		return "host/mypage_house_fix";
	}
	@RequestMapping("host/mypage_room_fix")
	public String mypage_room_fix() {
		return "host/mypage_room_fix";
	}
//	@RequestMapping("mypage_booking")
//	public String mypage_booking() {
//		return "mypage_booking";
//	}
	@RequestMapping("user/user_mypage")
	public String user_mypage() {
		return "user/user_mypage";
	}
	@RequestMapping("user/user_fix")
	public String user_fix() {
		return "user/user_fix";
	}
	@RequestMapping("user/review")
	public String review() {
		return "user/review";
	}
	@RequestMapping("join_check")
	public String join_check() {
		return "join_check";
	}
}
