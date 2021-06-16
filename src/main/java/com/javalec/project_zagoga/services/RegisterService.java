package com.javalec.project_zagoga.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.UsersMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@AllArgsConstructor
@Service
public class RegisterService {

    private UsersMapper usersMapper;

//    int userInsert(Users user){
//        ObjectMapper objectMapper = new ObjectMapper();
//        Map user_map = objectMapper.convertValue(user, HashMap.class);
//        System.out.println(user_map.toString());
//        return usersMapper.insert(user_map);
//    }
}
