package com.javalec.project_zagoga.services;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.AjaxMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class AjaxService {
    private final AjaxMapper mapper;
    public int infoService(String nick){

        return mapper.ajaxTest1(nick);
    }

}
