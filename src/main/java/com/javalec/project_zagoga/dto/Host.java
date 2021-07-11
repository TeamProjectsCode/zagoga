package com.javalec.project_zagoga.dto;

import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.vo.AuthInfo;
import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Host {
    private int h_no;
    private String h_bizno;
    private String h_mail;
    private String h_brand;
    private String h_name;
    private String h_jumin;
    private String h_phone;
    private String h_bank;
    private Timestamp h_join;

}
