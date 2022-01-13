<%@ page import="dao.BookProductDAO" %>
<%@ page import="dto.BookProductDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    BookProductDAO bookProductDAO = new BookProductDAO();
    ArrayList<BookProductDTO> list = bookProductDAO.getList();
    pageContext.setAttribute("list", list);
%>
<html>
<style>
    #listTable {
        width: 40%;
        border: solid gray 1px;
        margin: 0 30%;
        text-align: center;
    }
</style>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="frame/header.jsp"/>
<section>
    <div id="pageTitle">
        <h2>상품 목록</h2>
    </div>
    <table id="listTable" border="1">
        <tr>
            <th>코드</th><th>제목</th><th>가격</th><th>저자</th><th>출판사</th><th>이미지</th>
        </tr>
            <c:forEach var="i" items="${list}">
                <tr>
                    <td><a href="productUpdate.jsp?code=${i.code}">${i.code}</a></td><td>${i.name}</td><td>${i.price}</td><td>${i.author}</td><td>${i.publisher}</td><td><img width="80px" height="100px" src="${i.image}" alt="${i.image}"/></td>
                </tr>
            </c:forEach>
    </table>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
</html>
