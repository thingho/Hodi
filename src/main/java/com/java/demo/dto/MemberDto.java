package com.java.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {

    private int user_no;
    private String name;
    private String id;
    private String pw;
    private String phone;
    private Date date;
    private int group_number;
}
