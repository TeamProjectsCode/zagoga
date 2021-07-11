package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.*;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.security.PrincipalUser;
import com.javalec.project_zagoga.services.*;
import com.javalec.project_zagoga.vo.AuthInfo;
import com.javalec.project_zagoga.vo.HostVO;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/host")
public class HostController {

    private final HostService hostService;
    private final AuthService authService;
    private final BookService bookService;

    @RequestMapping("/mypage_host/{h_no}")
    public String mypage_host(@PathVariable("h_no")int h_no,Model model){
        Ghouse ghouse = this.hostService.myPageHostGhouse(h_no);
        model.addAttribute("gh", ghouse);
        return"/mypage/mypage_host";
    }

    @PostMapping("/updateInfo")
    public String updateHostInfo(@AuthenticationPrincipal PrincipalUser principalUser, Host host, HttpServletRequest request) {
        HostVO hostInfo = (HostVO) principalUser.getAuthInfo();

        // 계정 정보 변경 필요
//        System.out.println("host: "+host.toString());
        host.setH_no(hostInfo.getH_no());
         hostService.updateInfo(host);

        String password = request.getParameter("pw");
        if(password != null){
            AuthValue authValue = ((AuthInfo) principalUser.getAuthInfo()).getAuthValue();
            authService.updatePW(authValue.getSc_no(), password);
        }
        return "redirect:/host/host_myGhouse/"+hostInfo.getH_no();
    }

    @ResponseBody
    @PostMapping("/pw_check")
    public boolean pwCheck(@AuthenticationPrincipal PrincipalUser principalUser, @RequestParam("pw") String new_pwd){
        return authService.pwCheck(principalUser, new_pwd);
    }

    @PostMapping("/pw_check.do")
    @ResponseBody
    public int hostPW_check(@RequestParam("pw01") String pw01,@RequestParam("pw02") String pw02){
        int num = 0;
        if(pw01.equals(pw02)){
            num =1;
        }else{
            num = 0;
        }
        return num;
    }

    @RequestMapping(value = "/host_myGhouse/{h_no}", method = RequestMethod.GET)
    public String myGhosue(@PathVariable("h_no") String h_no, Model model){
//        Ghouse ghouse = this.hostService.myGhouse(Integer.parseInt(h_no));
//        model.addAttribute("gh", ghouse);
        HostVO hostInfo = hostService.getOneHost(Integer.parseInt(h_no));
        model.addAttribute("hostInfo", hostInfo);
        // 호스트 정보 조회 해서 넣을까?
        return "/mypage/mypage_host_info";
    }

/*    @RequestMapping(value = "/host_myGhouse2/{h_no}", method = RequestMethod.GET)
    public String myGhosue2(@PathVariable("h_no") String h_no, Model model){
        Ghouse ghouse = this.hostService.myGhouse(Integer.parseInt(h_no));
        model.addAttribute("gh", ghouse);
//        System.out.println("ghouse.toString : " + ghouse.toString());
        return "/mypage/mypage_house_info";
    }*/

    //host : 마이페이지 게스트 하우스 예약자 리스트 (승인/거절)
    @RequestMapping("/mypage_host_customerList")
    public String mypage_host_customerList(@AuthenticationPrincipal PrincipalUser principalUser,  Model model) {
        int h_no = ((HostVO) principalUser.getAuthInfo()).getH_no();
        List<BookingForHost> hostList = bookService.bookingListForHost(h_no);
        model.addAttribute("bookList", hostList);
        return "/mypage/mypage_host_customerList";
    }

    //host : 게스트 하우스 글 작성
    @RequestMapping("/gHouse_write")
    public String gh_write() {
        return "/host/gHouse_write";
    }

    @RequestMapping("/mypage_house_info/{h_no}") // �궗�뾽�옄 �벑濡앺쁽�솴, �벑濡앸맂 諛⑺쁽�솴(�궗�뾽�옄 �젙蹂대�寃�)
    public String mypage_house_info(@PathVariable("h_no") String h_no, Model model) {
        // Ghouse 정보
        Ghouse ghouse = this.hostService.myPageHostGhouse(Integer.parseInt(h_no));
        model.addAttribute("ghInfo", ghouse);

        // 룸 정 보
        List<GhouseRoom> ghouseRoom = this.hostService.roomAndGhouse(h_no);
//        model.addAttribute("grList", ghouseRoom);
        model.addAttribute("roomList", ghouseRoom);
//		System.out.println(ghouseRoom.toString());
        return "/mypage/mypage_house_info";
    }

    @ResponseBody
    @PostMapping("/updateBookingState")
    public int updateBookingState(@RequestParam("b_no") int b_no, @RequestParam("b_state") int b_state) {
        return bookService.updateBookingState(b_no, b_state);
    }

//    // for ghouse del
//    @RequestMapping(value = "/HostGhouseDelete/{h_no},{gh_no}", method = RequestMethod.GET)
//    public String HostGhouseDelete(@PathVariable("h_no")String h_no, @PathVariable("gh_no")String gh_no){
//        hostService.HostGhouseDelete(h_no);
//        return "redirect:/host/HostGhouseDelete2/"+h_no+','+gh_no;
//    }
//    @RequestMapping(value = "/HostGhouseDelete2/{h_no},{gh_no}", method = RequestMethod.GET)
//    public String HostGhouseDelete2(@PathVariable("h_no")String h_no, @PathVariable("gh_no")String gh_no){
//        hostService.HostGhouseDelete2(gh_no);
//        return "redirect:/host/HostGhouseDelete3/"+h_no+','+gh_no;
//    }
//    @RequestMapping(value = "/HostGhouseDelete3/{h_no},{gh_no}", method = RequestMethod.GET)
//    public String HostGhouseDelete3(@PathVariable("h_no")String h_no, @PathVariable("gh_no")String gh_no){
//        hostService.HostGhouseDelete3(h_no);
//        return "redirect:/host/mypage_host";
//    }

//    @RequestMapping(value = "/host_myPageHouseInfo/{h_no}", method = RequestMethod.GET)
//    public String host_myPageHouseInfo(@PathVariable("h_no")String h_no, Model model){
//        Ghouse ghouse = this.hostService.myPageGhouseInfo(h_no);
//        model.addAttribute("gh", ghouse);
//        return "/mypage/mypage_house_info";
//    }

    //0704 03:37 확인
    @RequestMapping(value = "/mypageRoomInfo/{r_no}", method = RequestMethod.GET)
    public String mypageRoomInfo(@PathVariable("r_no")int r_no, Model model){
        List<RoomImages> roomImages = hostService.mypageRoomInfo(r_no);
    //        System.out.println("roomImages.toString() : "+roomImages.toString());
    //        System.out.println(roomImages.get(0).toString());
        model.addAttribute("room", roomImages);
        return "/mypage/mypage_room_info";
    }

    //확인
    @RequestMapping("/ImagesDelete/{r_no},{h_no}")    // 9, 3 테스트
    public String ImagesDelete(@PathVariable("r_no") int r_no, @PathVariable("h_no") int h_no){
        hostService.ImagesDelete(r_no);
        return "redirect:/host/RoomDelete/"+r_no+','+h_no;
    }

    @RequestMapping("/RoomDelete/{r_no},{h_no}")
    public String RoomDelete(@PathVariable("r_no") int r_no, @PathVariable("h_no")int h_no){
//        System.out.println("roomDel r_no : " + r_no);
        hostService.RoomDelete(r_no);
        return "redirect:/host/mypage_house_info/"+h_no;
    }

    //  20210706 15:47 확인
    @RequestMapping("/RoomUpdate/{h_no}")
    public String RoomUpdate(Room room, @PathVariable("h_no")int h_no){
//        System.out.println("room.toString : " + room.toString());
        hostService.RoomUpdate(room);
        return "redirect:/host/mypage_house_info/"+h_no;
    }

    @PostMapping("/GhouseUpdate/{h_no}")
    public String GhouseUpdate(Ghouse ghouse, @PathVariable("h_no")int h_no){
//        System.out.println(ghouse.toString());
        hostService.GhouseUpdate(ghouse);
        return "redirect:/host/mypage_host/"+h_no;
    }

}
