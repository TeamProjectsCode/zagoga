package com.javalec.project_zagoga.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reviews {
    private int rv_no;
    private String rv_content;
    private int rv_star;
    private int rv_uno;
    private int rv_ghno;
    private Timestamp rv_join;
}