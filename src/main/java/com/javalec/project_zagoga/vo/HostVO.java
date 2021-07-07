package com.javalec.project_zagoga.vo;

import lombok.*;

@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public class HostVO extends AuthInfo{
    private int h_no;
    private String h_bizno;
    private String h_name;
    private String h_jumin;
    private String h_email;
    private String h_phone;
    private  String h_bank;
    private String h_join;
}
