package com.javalec.project_zagoga.services;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.javalec.project_zagoga.dto.GhouseRoom;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.mapper.AuthMapper;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.security.PrincipalUser;
import com.javalec.project_zagoga.vo.UsersVO;
import com.javalec.project_zagoga.mapper.UsersMapper;

import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@AllArgsConstructor
@Service
public class UsersService {

    private final UsersMapper usersMapper;
    private final AuthMapper authMapper;
    private final PasswordEncoder passwordEncoder;

    public void insertUser(AuthValue authValue, Users user) {
        String mail = authValue.getUsername().replace(",", "");
        String encPwd = passwordEncoder.encode(authValue.getPassword());
        authValue.setUsername(mail);
        authValue.setPassword(encPwd);
        authValue.setRole("USER");
        authMapper.insertAuthValue(authValue);

        String jumin = user.getU_jumin().replace(",", "");
        String phone = user.getU_phone().replace(",", "");
        user.setU_jumin(jumin);
        user.setU_phone(phone);
        usersMapper.insertUser(authValue, user);
    }

    public int userDelete(UsersVO user) {
        // 유저가 삭제되면 무엇은 지우고 무엇은 유지 할 것 인지 정해야 함

        return  usersMapper.delete(user.getU_no());

    }

    public int nickCheck(String u_nick){
        // 닉네임 중복체크
        return usersMapper.nickCheck(u_nick);
    }
    public String pw_check(String no) {
    	return usersMapper.pw_check(no);
    }

    public String findID(String name, String jumin){
        return usersMapper.findID(name,jumin);
    }
    public List<Users> userList(){
		return usersMapper.userList();
	}

    public void updateUserInfo(PrincipalUser principalUser, Users user) {
        UsersVO orginUser = (UsersVO) principalUser.getAuthInfo();
        String phone = user.getU_phone().replace(",", "");
        user.setU_no(String.valueOf(orginUser.getU_no()));
        user.setU_phone(phone);
        int isSuccess = usersMapper.updateUserNickPhone(user);
        System.out.println("isSuccess"+isSuccess);
        if (isSuccess != 0){
            orginUser.setU_nick(user.getU_nick());
            orginUser.setU_phone(phone);
        }
    }
}
