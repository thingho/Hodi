package com.java.demo.controller;

import com.java.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    //게시글 전체
    @RequestMapping("/board/boardlist")
    public String boardlist(String category, String word, Model model) {

        HashMap<String, Object>map = boardService.selectAll(category,word);

        model.addAttribute("list",map.get("list"));
        model.addAttribute("category",map.get("category"));
        model.addAttribute("word",map.get("word"));
        return "/board/boardlist";
    }

    // 게시글 1개
    @RequestMapping("/board/boardview")
    public String boardview(@RequestParam(defaultValue = "1")int bno,
                            String category,String word, Model model){
        HashMap<String,Object> map = boardService.selectOne(bno);
        model.addAttribute("bdto", map.get("bdto"));
        model.addAttribute("category",category);
        model.addAttribute("word",word);
        return "/board/boardview";
    }

    @RequestMapping("/board/boardwrite")
    public String boardwrite() {
        return "/board/boardwrite";
    }

}
