<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function loginBtn(){
        location.href="../login";
    }

    function logoutBtn(){
        alert("로그아웃이 되었습니다.");
        location.href="../logout";
    }
</script>
<header>
    <div style="display: flex; margin-left:1300px;">
        <c:if test="${sessionId == null }">
            <li><a onclick="loginBtn()">로그인</a></li>
        </c:if>
        <c:if test="${sessionId != null }">
            <li><a>${sessionName}님 환영합니다!</a></li>
            <li><a onclick="logoutBtn()">로그아웃</a></li>
        </c:if>
    </div>
</header>