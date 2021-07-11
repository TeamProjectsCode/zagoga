package com.javalec.project_zagoga.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reviews {
    private int rv_no; // 리뷰번호 x
    private String rv_content; // 내용 o
    private int rv_star; // 별갯수 o
//    private int rv_uno; // 유저 번호 o
    private String u_nick;
//    private int rv_ghno; // 게스트 하우스 번호 o
//    private Timestamp rv_join; // 작성일 x
}