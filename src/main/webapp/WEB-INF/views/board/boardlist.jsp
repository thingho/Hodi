<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>게시판 목록</title>
        <style>
            h1{text-align: center;}
            table{width:1000px; text-align: center; margin-left:auto;margin-right:auto;}
            table,th,td{border: 1px solid black; border-collapse: collapse;}
            th,td,input{width:500px; height:40px;}
            button{width:60px; height:40px;}
            select{width: 100px;}
            li{list-style-type: none; padding: 0 25px 0 0; display : flex;}
            button,a{color: blue; cursor:pointer;}
            form{display:inline-flex; place-content: center;}
            .searchbar{text-align: center;}
        </style>
        <%--제이쿼리 추가--%>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    </head>
    <body>
    <script>
        function searchBtn(){
            if($("#word").val() == ""){
                alert("검색어를 입력해주세요.")
                $("#word").focus();
                return false;
            }
            search.submit();
        }
    </script>

        <%--로그인 부분--%>
        <%@ include file="../top.jsp" %>

        <hr>
        <h1>게시판</h1>
        <br>
    <div class="searchbar">
        <form action="/board/boardlist" name="search" method="post">
            <select name="category">
                <option value="all">전체</option>
                <option value="btitle">제목</option>
                <option value="name">작성자</option>
            </select>
            <div>
                <input type="text" name="word" value="${word}" placeholder="검색어를 입력해주세요.">
            </div>
            <button type="button" onclick="searchBtn()">검색</button>
            <button type="button" onclick="location.href='/board/boardlist'">초기화</button>
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
                <c:if test="${sessionGroup == board.group_number || sessionGroup == 0 || board.group_number == 0}">
                    <td><a href="boardview?bno=${board.bno}&category=${category}&word=${word}">${board.btitle}</a></td>
                </c:if>
                <c:if test="${sessionGroup != 0 && sessionGroup != board.group_number && board.group_number != 0}">
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
            <button type="button" onclick="location.href='/board/boardwrite'">글쓰기</button>
        </div>
    <br>

    </body>
</html>
