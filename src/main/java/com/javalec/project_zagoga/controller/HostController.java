package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.dto.Ghouse;
import com.javalec.project_zagoga.services.GhouseService;
import com.javalec.project_zagoga.services.HostService;
import com.javalec.project_zagoga.services.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.util.List;

@Controller
@RequestMapping("/host")
public class HostController {
    private final HostService hostService;

    public HostController(HostService hostService) {
        this.hostService=hostService;
    }
    @RequestMapping(value = "/mypage_host_info")
    public String mypage_host_info( ) {
        return "/mypage/mypage_host_info";
    }

    @RequestMapping("/mypage_host")
    public String mypage_host(){
        return"/mypage/mypage_host";
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

    @RequestMapping(value = "/host_ghouseGetCheck/{h_no}")
    public String ghouseGetCheck(@RequestParam("h_no")int h_no){
        return "";
    }


    @RequestMapping(value = "/host_myGhouse/{h_no}", method = RequestMethod.GET)
    public String myGhosue(@RequestParam("h_no")int h_no, Model model){
        Ghouse ghouse = this.hostService.myGhouse(h_no);
        model.addAttribute("gh", ghouse);
        System.out.println("ghouse.toString : " + ghouse.toString());
        return "/mypage/mypage_host_info";
    }




}
