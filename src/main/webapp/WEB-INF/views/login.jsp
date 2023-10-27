<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>로그인 페이지</title>
        <script>
            function loginBtn(){
                loginFrm.submit();
            }
            if("${loginCheck}" == "fail"){
                alert("아이디 또는 패스워드가 틀리거나 가입되어 있지 않습니다.");
            }
        </script>
    </head>
    <body>
        <h2>로그인</h2>
        <form action="/login" method="post" name="loginFrm">
            <label>아이디</label>
            <input type="text" name="id" id="loginId"><br>
            <label>패스워드</label>
            <input type="password" name="pw" id="loginPw"><br>
            <button type="button" onclick="loginBtn()">로그인</button>
            <button type="button" onclick="location.href='/board/boardlist'">취소</button>
        </form>
    </body>
</html>