<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.BookProductDAO" %>
<%@ page import="dto.BookProductDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BookProductDAO bookProductDAO = new BookProductDAO();
    try {
        BookProductDTO book = bookProductDAO.select(request.getParameter("code"));
        pageContext.setAttribute("book", book);
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <td>제목</td><td><input type="text" name="name" value="${book.name}"></td><td>이미지(소스) : <input type="text" name="originImage" value="${book.image}" readonly></td>
        </tr>
        <tr>
            <td>코드</td><td><input type="text" name="code" value="${book.code}"></td><td rowspan="5"><img width="320px" height="400px" src="${book.image}" alt="${book.image}"/></td>
        </tr>
        <tr>
            <td>저자</td><td><input type="text" name="author" value="${book.author}"></td>
        </tr>
        <tr>
            <td>출판사</td><td><input type="text" name="publisher" value="${book.publisher}"></td>
        </tr>
        <tr>
            <td>가격</td><td><input type="text" name="price" value="${book.price}"></td>
        </tr>
        <tr>
            <td>상품설명</td><td><textarea cols="22" rows="4" name="info">${book.info}</textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" formaction="updateQuery" value="변경"><input type="submit" formaction="deleteQuery?delCode=${book.code}" value="삭제"></td><td>이미지 변경 : <input type="file" name="changeImage"></td>
        </tr>
    </table>
</form>
</body>
</html>
