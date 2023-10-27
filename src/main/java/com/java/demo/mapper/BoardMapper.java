package com.java.demo.mapper;

import com.java.demo.dto.BoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BoardMapper {

    ArrayList<BoardDto> selectAll(String category, String word);

    BoardDto selectOne(int bno);

}
