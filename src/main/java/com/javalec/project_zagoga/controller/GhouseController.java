package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Ghouse;
import com.javalec.project_zagoga.dto.GhouseRoom;
import com.javalec.project_zagoga.dto.GhouseRoomImages;
import com.javalec.project_zagoga.services.GhouseService;
import com.javalec.project_zagoga.services.RoomService;
import lombok.SneakyThrows;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/ghouse")
//@RestController �뒗 酉고럹�씠吏� 諛섑솚 �끂�끂 �뜲�씠�꽣留�! �꽕
public class GhouseController {
	private final GhouseService ghouseService;
	private final RoomService roomService;
	private ByteArrayInputStream files;

	public GhouseController(GhouseService ghouseService, RoomService roomService) {
		this.ghouseService = ghouseService;
		this.roomService = roomService;
	}

	// 210704 04:03 �솗�씤
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	public String getList(HttpServletRequest request, Model model) {
		String local = request.getParameter("local");
		List<GhouseRoom> show = this.ghouseService.getList(local);
		System.out.println(show);
		model.addAttribute("list", show);
		return "/room/gHouse_list";
	}

	@RequestMapping(value = "/localList", method = RequestMethod.GET)
	public String localList(HttpServletRequest request, Model model) {
		String local = request.getParameter("local");
		List<GhouseRoom> show = this.ghouseService.localList(local);
		model.addAttribute("list", show);
		return "/room/gHouse_list";
	}

	@RequestMapping("/write")
	public String write() {
		return "/host/gHouse_write";
	}

	// 210704 01:05 �솗�씤 (g_hno �샇�뒪�듃踰덊샇 �뿰寃고빐以섏빞�븿)
	@SneakyThrows
	@PostMapping("/insert/{h_no}")
	public String insert(Ghouse ghouse, @RequestParam("files") MultipartFile file, @PathVariable("h_no") int h_no)
			throws IOException {
		String fileAddr = "C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\gh_image\\";

		String imageName = String.valueOf(System.currentTimeMillis());
		String OriginName = file.getOriginalFilename();
		String transfer = fileAddr + imageName + "_" + OriginName;
		String safeDb = imageName + "_" + OriginName;

//		System.out.println("ghouse.toString() : " + ghouse.toString());
//		String filePath = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//		String Path = "/resources/gh_image/";
//		System.out.println("filePath : " + filePath);
		try {
			ghouse.setGh_image(imageName + "_" + OriginName);
			File transfers = new File(transfer);
			file.transferTo(transfers);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ghouse.setGh_hno(h_no);
		ghouse.setGh_image(safeDb);
		ghouseService.insert(ghouse);
		return "main";
//		return "redirect:/room/write/"+h_no;
	}

	//// room�씠 fk�옟���엳�뼱�꽌 �궘�젣�븞�맖
	@PostMapping("/delete/{gh_no},{gh_hno}")
	public String delete(@PathVariable("gh_no") int gh_no, @PathVariable("gh_hno") int gh_hno) {
		ghouseService.delete(gh_no, gh_hno);
		return "main";
	}

	// gHouse_detail view 20210704 00:53 �젙�긽�옉�룞
	// 20210705 蹂몄껜1媛�, 猷�2媛�, �씠誘몄�媛곴컖3�옣�뵫 珥� 6以� 異쒕젰 / �씠誘몄�留� 諛섎났�떆�궎怨� r_no
	// 諛붾�붾븣留� 異쒕젰 2以묐컲蹂듬Ц�븘�슂
	@RequestMapping(value = "/detail/{h_no}", method = RequestMethod.GET)
	public String ghouseDetail(@PathVariable("h_no") int h_no, Model model) {
		List<GhouseRoomImages> ghouseRoomImages = this.ghouseService.ghouseDetail(h_no);
		model.addAttribute("griList", ghouseRoomImages);
//		System.out.println("ghouseRoomImages.get(0).toString() : "+ghouseRoomImages);
//		System.out.println(ghouseRoomImages.toString());
		return "/room/gHouse_detail";
	}

	// mypage_house_info.jsp �뾽�뜲�씠�듃 �럹�씠吏� 酉곗슜!!! �젙�긽�옉�룞
	@RequestMapping("/host_myPageHouseInfo/{gh_no}")
	public String updateViewAll(@PathVariable("gh_no") int gh_no, Model model) {
		List<GhouseRoom> ghouseRoom = this.ghouseService.roomAndGhouse(gh_no);
		model.addAttribute("grList", ghouseRoom);
//		System.out.println(ghouseRoom.toString());
		return "/mypage/mypage_house_info";
	}

	@PostMapping("/update")
	public String update(Ghouse ghouse) {
		ghouseService.update(ghouse);
		return "main";
	}

	@RequestMapping("/mypageRoomInfo2") // 諛⑸벑濡앺쁽�솴, �닔�젙�럹�씠吏� (�쉶�썝�깉�눜�뒗)
	public String mypageRoomInfo2() {
		return "/mypage/mypage_room_info";
	}

	@RequestMapping("/mypage_host") // 媛쒖씤�젙蹂� �궗�뾽�옄�젙蹂� 酉�, �닔�젙�럹�씠吏�
	public String mypage_host() {
		return "/mypage/mypage_host";
	}

	@RequestMapping("/mypage_host_info") // �궗�뾽�옄 �쉶�썝�젙蹂� 蹂�寃�
	public String mypage_host_info() {
		return "/mypage/mypage_host_info";
	}

	@RequestMapping("/room_cancel") // �삁�빟 痍⑥냼 �븞�궡
	public String room_cancel() {
		return "/room/room_cancel";
	}

	@RequestMapping("/booking_confirm") // �삁�빟�떊泥��썑 �솗�씤�럹�씠吏�, �삁�빟�븯湲� 踰꾪듉 �늻瑜대㈃ �삁�빟�맖 (booking_confirm �쑝濡� �씠�룞)
	public String booking_confirm() {
		return "/room/booking_confirm";
	}

	@RequestMapping("/mypage_user") // user mypage �젙蹂댁닔�젙, �삁�빟�쁽�솴 諛� 紐⑸줉(踰꾪듉 �늻瑜대㈃ mypage_user_booking �쑝濡� �씠�룞)
	public String mypage_user() {
		return "/mypage/mypage_user";
	}

}
