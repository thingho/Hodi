<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>게시판 목록</title>
        <style>
            h1{text-align: center;}
            table{width:1000px; text-align: center; margin-left:auto;margin-right:auto;}
            table,th,td{border: 1px solid black; border-collapse: collapse;}
            th,td,input{width:200px; height:40px;}
            button{width:60px;}
            select{width: 100px;}
            li{list-style-type: none; padding: 0 25px 0 0; display : flex;}
            a{color: blue;}
            form{display:inline-flex; place-content: center;}
        </style>
    </head>
    <body>
    <script>
        function searchBtn(){
            if($("#word").val().length<2){
                alert("2글자 이상 입력하셔야 합니다.")
                $("#word").focus();
                return false;
            }
            search.submit();
        }

        function writeBtn(){
            location.href="/board/boardwrite";
        }
    </script>

        <%--로그인 부분--%>
        <%@ include file="../top.jsp" %>

        <hr>
        <h1>게시판</h1>
        <br>

        <div>
            <form action="/board/boardlist" name="search" method="post">
                <select name="category" id="category">
                    <option value="all">전체</option>
                    <option value="btitle">제목</option>
                    <option value="name">작성자</option>
                </select>
                <div class="title">
                    <input type="text" name="word" id="word" value="${word}" size="16" placeholder="검색어를 입력해주세요.">
                </div>
                <button type="button" onclick="searchBtn()">검색</button>
            </form>
        </div>

        <table>
            <colgroup>
                <col width="10%"/>
                <col width="50%"/>
                <col width="15%"/>
                <col width="10%"/>
                <col width="15%"/>
            </colgroup>
            <thead>
            <tr>
                <th>NO.</th>
                <th>제목</th>
                <th>작성자</th>
                <th>그룹</th>
                <th>파일첨부여부</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${list}">
            <tr>
                <td>${board.bno}</td>
                <c:if test="${board.group_number == sessionGroup || sessionId == 'admin'}">
                    <td><a href="boardview?bno=${board.bno}&category=${category}&word=${word}">${board.btitle}</a></td>
                </c:if>
                <c:if test="${board.group_number != sessionGroup || board.group_number == null}">
                    <td>${board.btitle}</td>
                </c:if>
                <td>${board.name}</td>
                <td>${board.group_number}</td>
                <c:if test="${board.bfile == null}">
                    <td>X</td>
                </c:if>
                <c:if test="${board.bfile != null}">
                    <td>O</td>
                </c:if>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <div style="margin-left:1300px;">
            <li><a onclick="writeBtn()" style="cursor:pointer;">글쓰기</a></li>
        </div>

    </body>
</html>
