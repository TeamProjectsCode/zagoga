package com.javalec.project_zagoga.services;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.mapper.AuthMapper;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.mapper.HostMapper;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class HostService {

    private final HostMapper hostMapper;
    private final AuthMapper authMapper;
    private final PasswordEncoder passwordEncoder;

    public void insertHost(AuthValue authValue, Host host) {
        System.out.println(host.toString());
        System.out.println(authValue.toString());
        String mail = authValue.getUsername().replace(",", "");
        String encPwd = passwordEncoder.encode(authValue.getPassword());
        authValue.setUsername(mail);
        authValue.setPassword(encPwd);
        authValue.setRole("HOST");
        authMapper.insertAuthValue(authValue);

        String bizno = host.getH_bizno().replace(",", "");
        host.setH_bizno(bizno);
//        String jumin = host.getH_jumin().replace(",", "");
        String phone = host.getH_phone().replace(",", "");
//        host.setH_jumin(jumin);
        host.setH_phone(phone);
        hostMapper.insertHost(authValue, host);
    }

    public String findID(String name, String jumin){
        return hostMapper.findID(name,jumin);
    }


    public String pw_check(String no) {
    	return hostMapper.pw_check(no);
    }
}
