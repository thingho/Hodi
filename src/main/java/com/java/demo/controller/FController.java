package com.java.demo.controller;

import javax.servlet.http.HttpSession;

import com.java.demo.dto.MemberDto;
import com.java.demo.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FController {

    @Autowired
    MemberService memberService;

    @Autowired
    HttpSession session;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/login")
    public String login(MemberDto memberDto, Model model) {
        MemberDto mdto = memberService.selectLogin(memberDto);

        if (mdto != null) {
            session.setAttribute("sessionId", mdto.getId());
            session.setAttribute("sessionName", mdto.getName());
            session.setAttribute("sessionGroup",mdto.getGroup_number());

        } else {
            model.addAttribute("loginCheck", "fail");
            return "/login";
        }
        return "redirect:/board/boardlist";
    }

    @RequestMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/board/boardlist";
    }

}
