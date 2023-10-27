package com.java.demo.service;

import com.java.demo.dto.MemberDto;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {

    MemberDto selectLogin(MemberDto memberDto);
}
