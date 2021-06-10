package com.javalec.project_zagoga;

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

	@RequestMapping("/administration_list")
	public String administration_list() {
		return "administration_list";
	}

	@RequestMapping("/administration_reading")
	public String administration_reading() {
		return "administration_reading";
	}
	@RequestMapping("/reservation_confrim")
	public String reservation_confrim() {
		return "reservation_confrim";
	}

	@RequestMapping("booking_confirm")
	public String booking_confirm() {
		return "booking_confirm";
	}

	@RequestMapping("/booking_detail")
	public String booking_detail() {
		return "booking_detail";
	}

	@RequestMapping("booking_list")
	public String booking_list() {
		return "booking_list";
	}

	@RequestMapping("customer_list")
	public String customer_list() {
		return "customer_list";
	}

	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("regist_business")
	public String regist_business() {
		return "regist_business";
	}

	@RequestMapping("room_detail")
	public String room_detail() {
		return "room_detail";
	}

	@RequestMapping("roomcancel")
	public String roomcancel() {
		return "roomcancel";
	}

	@RequestMapping("signup_user")
	public String signup_user() {
		return "signup_user";
	}

	@RequestMapping("write")
	public String write() {
		return "write";
	}
	@RequestMapping("mypage_regist_business")
	public String mypage_regist_business() {
		return "mypage_regist_business";
	}
	@RequestMapping("mypage_house_fix")
	public String mypage_house_fix() {
		return "mypage_house_fix";
	}
	@RequestMapping("mypage_room_fix")
	public String mypage_room_fix() {
		return "mypage_room_fix";
	}
}
