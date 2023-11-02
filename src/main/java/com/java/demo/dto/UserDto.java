package com.java.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UserDto {
    private String status;
    private int statusCode;
    private MemberDto userInfo;

    public UserDto(String status, int statusCode, MemberDto userInfo) {
        this.status = status;
        this.statusCode = statusCode;
        this.userInfo = userInfo;
    }

}