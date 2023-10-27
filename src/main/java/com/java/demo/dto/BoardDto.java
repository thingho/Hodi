package com.java.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardDto {

    private int bno;
    private String name;
    private String btitle;
    private String bcontent;
    private String bfile;
    private int group_number;
}
