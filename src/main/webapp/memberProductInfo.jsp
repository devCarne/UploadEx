<%@ page import="dao.BookProductDAO" %>
<%@ page import="dto.BookProductDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BookProductDAO bookProductDAO = new BookProductDAO();
    BookProductDTO book = bookProductDAO.select(request.getParameter("code"));
    pageContext.setAttribute("book", book);
%>
<html>
<style>
    #productInfoTable {
        width: 40%;
        margin: 0 auto;
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
        <h2>상세정보</h2>
    </div>
    <table id="productInfoTable" border="1">
        <tr>
            <td>제목</td><td>${book.name}</td><td rowspan="7"><img width="320px" height="400px" src="${book.image}" alt="${book.image}"/></td>
        </tr>
        <tr>
            <td>코드</td><td>${book.code}</td>
        </tr>
        <tr>
            <td>저자</td><td>${book.author}</td>
        </tr>
        <tr>
            <td>출판사</td><td>${book.publisher}</td>
        </tr>
        <tr>
            <td>가격</td><td>${book.price}</td>
        </tr>
        <tr>
            <td>상품설명</td><td width="400px">${book.info}</td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" formaction="saleInsert.jsp" value="구매"><input type="submit" formaction="memberProductList.jsp" value="목록으로"></td>
        </tr>
    </table>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
</html>
