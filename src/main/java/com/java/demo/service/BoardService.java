package com.java.demo.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public interface BoardService {

    HashMap<String,Object> selectAll(String category, String word);

    HashMap<String,Object> selectOne(int bno);

}
