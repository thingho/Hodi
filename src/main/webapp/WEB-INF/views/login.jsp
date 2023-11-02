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
            alert("아이디 또는 패스워드가 틀리거나 등록되어 있지 않습니다.");
        }
    </script>
    <style>
        h1,form{text-align: center;}
    </style>
</head>
<body>
<h1>로그인</h1>
<hr>
<form action="/login" method="post" name="loginFrm">
    <label>아이디</label>
    <input type="text" name="id"><br>
    <label>패스워드</label>
    <input type="password" name="pw"><br><br>
    <button type="submit" onclick="loginBtn()">로그인</button>
    <button type="button" onclick="location.href='/board/boardlist'">취소</button>
</form>
</body>
</html>