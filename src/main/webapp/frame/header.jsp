<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    #headline {
        height: 60px;
        line-height: 60px;
        text-align: center;
        background-color: skyblue;
    }

    #adminNav {
        height: 40px;
        line-height: 40px;
        text-align: right;
        background-color: lightskyblue;
    }

    #memberNav {
        height: 40px;
        line-height: 40px;
        text-align: right;
        background-color: lightskyblue;
    }

    a {
        text-decoration: none;
        font-weight: bold;
    }

    a:link {color: black;}

    a:visited {color: black;}

    li {
        margin: 0 20px;
        list-style: none;
        float: left;
    }

    #pageTitle {
        text-align: center;
        height: 100px;
        line-height: 100px;
    }
    section {
        height: 800px;
    }
</style>
<head>
    <title>Title</title>
</head>
<body>
<div id="headline">
    <h1><a href="adminMain.jsp">NO 24 서점</a></h1>
</div>
<c:if test="${sessionScope.grade eq '관리자'}">
<div id="adminNav">
    <ul>
        <li><a href="productInsert.jsp">상품등록</a></li>
        <li><a href="productList.jsp">상품조회</a></li>
        <li><a href="adminSignIn.jsp">관리자 가입</a></li>
        <li><a href="adminMain.jsp">홈으로</a></li>
    </ul>
    <p>${sessionScope.grade} ${sessionScope.userName}님 안녕하세요
        <button type="button" onclick="location.href='logout.jsp'">로그아웃</button></p>
</div>
</c:if>
<c:if test="${sessionScope.grade eq '회원'}">
    <div id="memberNav">
        <ul>
            <li><a href="memberProductList.jsp">상품조회</a></li>
            <li><a href="memberUpdate.jsp">내 정보</a></li>
            <li><a href="memberMain.jsp">홈으로</a></li>
        </ul>
        <p>${sessionScope.grade} ${sessionScope.userName}님 안녕하세요
            <button type="button" onclick="location.href='logout.jsp'">로그아웃</button></p>
    </div>
</c:if>
</body>
</html>
