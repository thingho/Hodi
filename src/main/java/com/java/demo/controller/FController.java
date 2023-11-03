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

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


@Controller
public class FController {

    @Autowired
    MemberService memberService;

    @Autowired
    HttpSession session;

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }


    @PostMapping("/login")
    public String login(MemberDto memberDto, Model model){
        MemberDto mdto = memberService.selectLogin(memberDto);

        char[] buf = new char[512];
        StringBuffer sb = new StringBuffer();

        if (mdto != null) {

        try {
            URL url = new URL("http://192.168.0.53:8802/?id=test&pw=1111");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            if (conn != null) {
                conn.setConnectTimeout(2000);
                conn.setRequestMethod("GET");
                conn.addRequestProperty("Content-Type", "application/json; charset=UTF-8");
                conn.setUseCaches(false);

                System.out.println("request URL : " + url);
                conn.connect();

                int responseCode = conn.getResponseCode();
                System.out.println("response code : " + responseCode);

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    InputStream is = conn.getInputStream();
                    InputStreamReader reader = new InputStreamReader(is, "utf-8");
                    BufferedReader br = new BufferedReader(reader);
                    int cnt;
                    while ((cnt = br.read(buf)) != -1) {
                        sb.append(buf, 0, cnt);
                    }
                    System.out.println("데이터 가져오기 :" +sb);
                } else {
                    System.out.println("response 실패");
                    return null;
                }
            } else {
                System.out.println("conn Null");
                return null;
            }

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

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