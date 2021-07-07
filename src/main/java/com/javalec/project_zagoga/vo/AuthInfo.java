package com.javalec.project_zagoga.vo;

import com.javalec.project_zagoga.security.AuthValue;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthInfo {
    private AuthValue authValue;
}
