package com.javalec.project_zagoga.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class BookingForHost {
    private int b_no;
    private String b_in;
    private String b_out;
    private int b_state;
    private int b_pno;
    private String b_join;
    private int b_price;
    private String r_name;
    private String u_name;
    private String u_phone;
}
