<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>게시판 글쓰기</title>
        <style>
            h1{text-align: center;}
            li{list-style-type : none; padding : 0 25px 0 0; display : flex;}
            form{text-align: -webkit-center;}
            button,a{color: blue; cursor:pointer;}
            input{width: 400px; height: 30px;}
            textarea{width: 400px; height: 200px; resize: none;}
        </style>
        <%--제이쿼리 추가--%>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script>
            function writeBtn(){
                if("${sessionId}"== ""){
                    alert("로그인을 하셔야 게시글 작성이 가능합니다.");
                    location.href="../login";
                    return false;
                }
                if($("#btitle").val() == ""){
                    alert("제목을 입력해주세요.");
                    $("#btitle").focus();
                    return false;
                }
                if($("#bcontent").val() == ""){
                    alert("내용을 입력해주세요.");
                    $("#bcontent").focus();
                    return false;
                }
                writeFrm.submit();
            }
        </script>
    </head>
    <body>
    <%--로그인 부분--%>
    <%@ include file="../top.jsp" %>
        <hr>
        <h1>글쓰기</h1>
        <hr>
        <form action="/board/boardwrite" name="writeFrm" method="post" enctype="multipart/form-data">
            <table>
                <colgroup>
                    <col width="15%">
                    <col width="85%">
                </colgroup>
                <tr>
                    <th>작성자</th>
                    <td>${sessionName}
                        <input type="hidden" name="name" value="${sessionName}">
                    </td>
                </tr>
                <tr>
                    <th>그룹</th>
                    <td>${sessionGroup}
                        <input type="hidden" name="group_number" value="${sessionGroup}">
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="btitle" id="btitle" placeholder="제목을 작성해주세요.">
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="bcontent" id="bcontent" placeholder="내용을 작성해주세요."></textarea>
                    </td>
                </tr>
                <tr>
                    <th>이미지 등록</th>
                    <td>
                        <input type="file" name="file">
                    </td>
                </tr>
            </table>
            <hr>
            <button type="button" onclick="writeBtn()">작성완료</button>
            <button type="button" class="cancel" onclick="location.href='/board/boardlist'">취소</button>
        </form>
    </body>
</html>
