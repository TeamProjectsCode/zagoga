package com.javalec.project_zagoga.services;

import com.javalec.project_zagoga.dto.Ghouse;
import com.javalec.project_zagoga.dto.GhouseRoom;
import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.dto.RoomImages;
import com.javalec.project_zagoga.mapper.AuthMapper;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.mapper.HostMapper;
import com.javalec.project_zagoga.security.PrincipalUser;
import com.javalec.project_zagoga.vo.HostVO;
import lombok.AllArgsConstructor;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@AllArgsConstructor
@Service
public class HostService {

    private final HostMapper hostMapper;
    private final AuthMapper authMapper;
    private final PasswordEncoder passwordEncoder;

    public void insertHost(AuthValue authValue, Host host) {
        String mail = authValue.getUsername().replace(",", "");
        String encPwd = passwordEncoder.encode(authValue.getPassword());
        authValue.setUsername(mail);
        authValue.setPassword(encPwd);
        authValue.setRole("HOST");
        authMapper.insertAuthValue(authValue);

        String bizno = host.getH_bizno().replace(",", "");
        host.setH_bizno(bizno);
        String jumin = host.getH_jumin().replace(",", "");
        String phone = host.getH_phone().replace(",", "");
        host.setH_jumin(jumin);
        host.setH_phone(phone);
        String bank = host.getH_bank().replace(",","");
        host.setH_bank(bank);

        hostMapper.insertHost(authValue, host);
    }

    public int updateInfo(Host host){
        String phone = host.getH_phone().replace(",", "");
        host.setH_phone(phone);
        return hostMapper.updateInfo(host);
    }

    public HostVO getOneHost(int h_no) { return hostMapper.getOneHost(h_no);}

    public String findID(String name, String jumin){
        return hostMapper.findID(name,jumin);
    }
/*    public String pw_check(String no) {
    	return hostMapper.pw_check(no);
    }*/
    public List<HostVO> hostList() {
    	return hostMapper.hostList();
    }
    public HostVO hostInfo(String h_bizno){
    	return hostMapper.hostInfo(h_bizno);
    }
    public Ghouse myGhouse(int h_no){return hostMapper.myGhouse(h_no);}
//    public Ghouse myPageGhouseInfo(String h_no){return hostMapper.myPageGhouseInfo(h_no);}
    public void HostGhouseDelete(int gh_no, int h_no){ hostMapper.HostGhouseDelete(gh_no, h_no);}

    public List<GhouseRoom> roomAndGhouse(String h_no){
        return hostMapper.roomAndGhouse(h_no);
    }

    public List<RoomImages> mypageRoomInfo(int r_no){
        return hostMapper.mypageRoomInfo(r_no);
    }

    public int ImagesDelete(int r_no){
        return hostMapper.ImagesDelete(r_no);
    }
    public int RoomDelete(int r_no){
        return hostMapper.RoomDelete(r_no);
    }
}
