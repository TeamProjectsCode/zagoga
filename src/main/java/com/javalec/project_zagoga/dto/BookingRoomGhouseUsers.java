package com.javalec.project_zagoga.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookingRoomGhouseUsers {

    private int b_no;
    private Date b_in;
    private Date b_out;
    private int b_state;
    private int b_pno;
    private Timestamp b_join;
    private int b_rno;
    private int b_uno;

    private int r_no;
    private String r_name;
    private int r_pmin;
    private int r_pmax;
    private int r_fee;
    private String r_detail;
    private int r_ghno;

    private int gh_no;
    private String gh_name;
    private String gh_image;
    private String gh_addr1;
    private String gh_addr2;
    private String gh_detail;
    private int gh_hno;

    private int u_no;
    private String u_mail;
    private String u_pwd;
    private String u_name;
    private String u_nick;
    private String u_gender;
    private String u_jumin;
    private String u_phone;
    private String u_join;



    private String h_bizno;
    private String h_mail;
    private String h_brand;
    private String h_name;
    private String h_jumin;
    private String h_phone;
    private String h_bank;
    private Timestamp h_join;
}
