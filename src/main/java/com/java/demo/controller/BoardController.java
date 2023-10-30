package com.java.demo.controller;

import com.java.demo.dto.BoardDto;
import com.java.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    //게시글 전체
    @RequestMapping("/board/boardlist")
    public String boardlist(String category, String word, Model model) {

        HashMap<String, Object> map = boardService.selectAll(category,word);

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

    @GetMapping("/board/boardwrite")
    public String boardwrite() {
        return "/board/boardwrite";
    }

    @PostMapping("/board/boardwrite")
    public String boardwrite(BoardDto bdto, @RequestPart MultipartFile file) throws Exception {

        String filename = "";
        if(!file.isEmpty()){
            String origin_filename = file.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            filename = uuid+" "+origin_filename;
            String uploadurl = "c://workspace/images/";
            File f = new File(uploadurl + filename);
            file.transferTo(f);
        }else{

        }
        bdto.setBfile(filename);
        boardService.insertOne(bdto);
        System.out.println("이름 : "+bdto.getName());
        System.out.println("내용 : "+bdto.getBcontent());
        System.out.println("파일 : "+bdto.getBfile());
        return "redirect:boardlist";
    }

}
