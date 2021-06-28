package com.javalec.project_zagoga;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
@Controller
public class ProjectZagogaApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProjectZagogaApplication.class, args);
    }

    @GetMapping("/main")
    public String main(){
        return "main";
    }

}
