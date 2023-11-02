package com.java.demo.service;

import com.java.demo.dto.MemberDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public interface MemberService {

    MemberDto selectLogin(MemberDto memberDto);
}
