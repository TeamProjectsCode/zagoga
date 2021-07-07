package com.javalec.project_zagoga.controller;

import com.javalec.project_zagoga.mapper.AuthMapper;
import com.javalec.project_zagoga.services.AuthService;
import com.javalec.project_zagoga.services.HostService;
import com.javalec.project_zagoga.services.MailService;
import com.javalec.project_zagoga.services.UsersService;
import com.javalec.project_zagoga.vo.AuthInfo;
import com.javalec.project_zagoga.vo.UsersVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@AllArgsConstructor
@Controller
@RequestMapping("/login")
public class LoginController {

    private final AuthService authService;
    private final MailService mailService;

    // Auth로 이전헤야하는데에ㅔ~
    private final UsersService usersService;
    private final HostService hostService;

    @GetMapping("")
    public String loginPage() { return "login"; }

    @RequestMapping("/findID")
    public String findID(){
        return "/findID";
    }

    @RequestMapping("/findPW")
    public String findPW(){
        return "/findPW";
    }

    @ResponseBody
    @PostMapping("/Checkmail")
    public boolean findPWByEmail(HttpServletRequest request, String jumin, String username, String name) {
        // security 확인 후 sc_no로 해당 권한 테이블에서 유저 정보 조회
        int sc_no = authService.findPWByEmail(jumin, username, name);
        if(0 < sc_no) {
            HttpSession session = request.getSession(); // 세션얻어옴
            session.setAttribute("sc_no", sc_no);
            mailService.mailSend(session, username); // 메일보내기
            return true;
        }

        return false;
    }

    @PostMapping("/showID")
    public String showID(HttpServletRequest request, Model model){
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String jumin = request.getParameter("jumin");
        String mail = ""; //return 할 메일

        if (type.equals("USER")){ // 타입 비교해서 같은지 비교
            mail = usersService.findID(name, jumin);

        }else if(type.equals("HOST")){
            mail = hostService.findID(name,jumin);
        }

        model.addAttribute("name",name);
        model.addAttribute("mail",mail);
        return "/showID";
    }

    @PostMapping("/showPW")
    public String showPW(HttpServletRequest request, @RequestParam("password") String password) {
        int sc_no = (int) request.getSession().getAttribute("sc_no");
        authService.updatePW(sc_no, password);
        return "/showPW";
    }

}
