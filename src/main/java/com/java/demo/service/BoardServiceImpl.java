package com.java.demo.service;

import com.java.demo.dto.BoardDto;
import com.java.demo.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    BoardMapper boardMapper;

    @Override
    public HashMap<String, Object> selectAll(String category,String word){
        HashMap<String, Object> map = new HashMap<>();
        ArrayList<BoardDto> list = boardMapper.selectAll(category,word);

        map.put("list",list);
        map.put("category",category);
        map.put("word",word);
        return map;
    }

    @Override
    public HashMap<String, Object> selectOne(int bno){
        HashMap<String, Object> map = new HashMap<>();

        BoardDto bdto = boardMapper.selectOne(bno);
        map.put("bdto", bdto);
        return map;
    }

    @Override
    public void insertOne(BoardDto bdto) {
        boardMapper.insertOne(bdto);
    }
}
