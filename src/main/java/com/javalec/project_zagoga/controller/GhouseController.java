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

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

//@RestController("/board")
@Controller
@RequestMapping("/ghouse")
//@RestController 는 뷰페이지 반환 노노 데이터만! 네
public class GhouseController {
	private final GhouseService ghouseService;
	private final RoomService roomService;
	private ByteArrayInputStream files;

	public GhouseController(GhouseService ghouseService, RoomService roomService) {
		this.ghouseService = ghouseService;
		this.roomService = roomService;
	}
//  	!!자바 정독 필요
////	@GetMapping("/getList")
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String getList(Model model) {
//		//jsp로 넘기고 받아오는거 컨트롤러에서 받은 데이터 jsp에서 사용하기
////		System.out.println(this.boardService.getList().toString());
//		List<Ghouse> show = this.ghouseService.getList();
//		System.out.println(show.toString());
////		List<Board> list = boardService.list();
// 		model.addAttribute("list", show);
// 		//model.add (1이름!, 2어떤값을 넘겨줄건가)
//		System.out.println("list");
//		return "main";
//	}
//	@GetMapping("/getlist")
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	public String getList(Model model) {
		List<Ghouse> show = this.ghouseService.getList();
		System.out.println(show.toString());
		model.addAttribute("list",show);
		// ghouse 0 -
		System.out.println("list");
		return "/room/gHouse_list_test";
	}

////	@GetMapping("/lowFee")/
//	@RequestMapping(value = "/lowFee", method = RequestMethod.GET)
//	public String lowFee(Model model) {
//		int gh_no = 2;
//		Ghouse show = this.ghouseService.lowFee(gh_no);
//		System.out.println(show.toString());
//		model.addAttribute("lowfee", show);
//		System.out.println("lowfee");
//		return "/room/gHouse_list_test";
//	}


	//PostMapping insert 사용
//	@GetMapping("/insert/{gh_name},{gh_addr1},{gh_addr2},{gh_detail},{gh_hno}")
//	public String insert(@PathVariable("gh_name")String gh_name,@PathVariable("gh_addr1")String gh_addr1,@PathVariable("gh_addr2")String gh_addr2,@PathVariable("gh_detail")String gh_detail,@PathVariable("gh_hno")int gh_hno) {
//		this.ghouseService.insert(gh_name, gh_addr1, gh_addr2, gh_detail, Integer.toString(gh_hno));
//		return "main";
//	}

//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@SneakyThrows
	@PostMapping("/insert")
	public String insert(Ghouse ghouse, @RequestParam("files") MultipartFile file) throws IOException {
//		String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString();
//		String basePath = rootPath + "/" + "single";
//		String filePath0 = basePath + "/" + file.getOriginalFilename();
//		System.out.println("rootPath : " + rootPath + "\nbasePath : " + basePath + "\nfilePath0 : " + filePath0);
//		String imgAddr = new File("c:/gh_image/"+file.getOriginalFilename())
//		file.transferTo(new File("c:/gh_image/"+file.getOriginalFilename()));
////		ghouse.setGh_image();
//		ghouseService.insert(ghouse);
//		return "main";

		String filePath = "/" + file.getOriginalFilename();
		String Path = "/resources/gh_image/";
		System.out.println("filePath : " + filePath);
		try {
			file.transferTo(new File("C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\gh_image\\"+file.getOriginalFilename()));

		} catch (IllegalStateException e){
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		}
		ghouse.setGh_image(filePath);
		ghouseService.insert(ghouse);
		return "main";
	}




//	@PostMapping("/single")
//	public String uploadSingle(@RequestParam("files") MultipartFile   file) throws Exception {
//		String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString();
//		String basePath = rootPath + "/" + "single";
//		String filePath = basePath + "/" + file.getOriginalFilename();
//		File dest = new File(filePath);
//		files.transferTo(dest); // 파일 업로드 작업 수행
//		return "uploaded";
//	}

	@RequestMapping("/uploadMultipleFiles")
	public String fileupload(HttpServletRequest request, @RequestBody List<MultipartFile> files, Ghouse ghouse){
		try{
			for(int i=0;i<files.size();i++){
				System.out.println("files : " + files);
				files.get(i).transferTo(new File("C:\\Users\\yeon\\IdeaProjects\\project_zagoga\\src\\main\\resources\\static\\rooms_image\\"+files.get(i).getOriginalFilename()));
				System.out.println("files : " + files);
				System.out.println("\nfiles.get(i).getOriginalFilename() : " + files.get(i).getOriginalFilename());
			}
		}catch (IllegalStateException | IOException e){
			e.printStackTrace();
		}
		return "main";
	}



	@RequestMapping("/write")
	public String gHouse_write() {
		return "/host/gHouse_write_test";
	}
//

//	@GetMapping("/delete/{GH_NO}")
//	public String delete(@PathVariable("GH_NO")int GH_NO){
//		this.ghouseService.delete(GH_NO);
//		return "main";
//	}
	@PostMapping("/delete/{gh_no}, {gh_hno}")
	public String delete(@PathVariable("gh_no") int gh_no,@PathVariable("gh_hno") int gh_hno){
		ghouseService.delete(gh_no, gh_hno);
		return "main";
	}

	@PostMapping("/update")
	public String update(Ghouse ghouse){
		ghouseService.update(ghouse);
		return "main";
	}

//	@GetMapping("/getOne/{GH_NO}")
//	public String getOne(Model model, @PathVariable("GH_NO")int GH_NO){
//		List<Ghouse> showOne = this.ghouseService.getOne(GH_NO);
//		System.out.println(showOne.toString());
//		model.addAttribute("getOne", showOne);
//		System.out.println("getOne");
//		return "main";
//	}

	//gHouse_detail view 되던건데 지금 안됨
	@RequestMapping("/detail/{gh_no},{r_no}")
	public String selectOne(@PathVariable("gh_no")int gh_no, @PathVariable("r_no")int r_no, Model model){
		List<GhouseRoomImages> ghouseRoomImages=this.ghouseService.ghouseRoomImages(gh_no, r_no);
		model.addAttribute("griList", ghouseRoomImages);
		System.out.println(ghouseRoomImages.toString());
		return "/room/gHouse_detail";
	}

	//mypage_house_info.jsp 업데이트 페이지 뷰용!!! 되는거!!!!!
	@RequestMapping("/RoomAndGhouse/{gh_no}")
	public String updateViewAll(@PathVariable("gh_no")int gh_no, Model model){
		List<GhouseRoom> ghouseRoom=this.ghouseService.roomAndGhouse(gh_no);

		model.addAttribute("grList", ghouseRoom);
		System.out.println(ghouseRoom.toString());
		return "/mypage/mypage_house_info";
	}

	//mypage_room_info.jsp 서비스 맵퍼 sql 작성해야함
	@RequestMapping("/mypageRoomInfo/{r_no}")
	public String mypageRoomInfo(@PathVariable("r_no")int r_no, Model model){
		return "/mypage/mypage_room_info";
	}




}
