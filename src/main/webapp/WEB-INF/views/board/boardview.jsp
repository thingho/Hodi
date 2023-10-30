<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>게시글 상세페이지</title>
        <style>
            h1{text-align: center;}
            table{width:900px; margin-left:auto;margin-right:auto;}
            table,th,td{border: 1px solid black; border-collapse: collapse;}
            th,td{height:40px;}
            li{list-style-type : none; padding : 0 25px 0 0; display : flex;}
            a{color: blue; cursor:pointer;}
            img{width: 400px; height: 500px;}
        </style>
    </head>
    <body>
    <%--로그인 부분--%>
    <%@ include file="../top.jsp" %>
    <hr>
    <h1>게시글 상세페이지</h1>
    <table>
        <colgroup>
            <col width="20%">
            <col width="80%">
        </colgroup>
        <tr>
            <th>No.</th>
            <td>${bdto.bno} </td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${bdto.name}</td>
        </tr>
        <tr>
            <th>그룹</th>
            <td>${bdto.group_number}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${bdto.btitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${bdto.bcontent}</td>
        </tr>
        <c:if test="${bdto.bfile != null}">
        <tr>
            <th>이미지</th>
            <td><img src="../images/${bdto.bfile}"></td>
        </tr>
        </c:if>
    </table>
    <br>
    <div style="margin-left:1300px;">
        <button type="button" onclick="location.href='/board/boardlist'">게시판 목록</button>
    </div>
    </body>
</html>
