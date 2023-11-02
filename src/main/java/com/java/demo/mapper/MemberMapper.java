package com.java.demo.mapper;

import com.java.demo.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {

    MemberDto selectLogin(MemberDto memberDto);
}
