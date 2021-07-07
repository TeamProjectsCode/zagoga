package com.javalec.project_zagoga.vo;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@EqualsAndHashCode(callSuper = true)
@Getter
@ToString
public class AdminVO extends AuthInfo{
    private int a_no;
    private String a_mail;
}
