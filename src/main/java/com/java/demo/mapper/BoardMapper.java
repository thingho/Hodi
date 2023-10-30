package com.java.demo.mapper;

import com.java.demo.dto.BoardDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface BoardMapper {

    ArrayList<BoardDto> selectAll(@Param("category") String category,@Param("word") String word);

    BoardDto selectOne(int bno);

    void insertOne(BoardDto bdto);
}
