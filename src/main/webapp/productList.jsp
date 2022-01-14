<%@ page import="dao.BookProductDAO" %>
<%@ page import="dto.BookProductDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="paging.ProductPaging" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    BookProductDAO bookProductDAO = new BookProductDAO();
    ArrayList<BookProductDTO> list = bookProductDAO.getList();
    pageContext.setAttribute("list", list);

    ProductPaging paging = new ProductPaging();
    pageContext.setAttribute("bookQuantity", paging.getObjectQuantity());
    pageContext.setAttribute("pageQuantity", paging.getPageQuantity());

    pageContext.setAttribute("currentPage", request.getParameter("page"));
%>
<html>
<jsp:include page="frame/header.jsp"/>
<style>
    #listTable {
        width: 40%;
        border: solid gray 1px;
        margin: 0 30%;
        text-align: center;
    }

    #pageSelect {
        text-align: center;
        font-size: 1.2em;
    }

    #quantityInfo {
        text-align: center;
    }

    section {
        height: 1100px;
    }
</style>
<head>
    <title>Title</title>
</head>
<body>

<section>
    <div id="pageTitle">
        <h2>상품 목록</h2>
    </div>
    <div id="quantityInfo">
        등록된 책 수 : ${bookQuantity}
    </div>
    <table id="listTable" border="1">
        <tr>
            <th>코드</th><th>제목</th><th>가격</th><th>저자</th><th>출판사</th><th>이미지</th>
        </tr>
            <c:forEach var="i" items="${list}" begin="${currentPage * 5 - 4}" end="${currentPage * 5 }">
                <tr>
                    <td><a href="productUpdate.jsp?code=${i.code}">${i.code}</a></td><td>${i.name}</td><td>${i.price}</td><td>${i.author}</td><td>${i.publisher}</td><td><img width="80px" height="100px" src="${i.image}" alt="${i.image}"/></td>
                </tr>
            </c:forEach>
    </table>
    <div id="pageSelect">
        <c:forEach begin="1" end="${pageQuantity - 1}" varStatus="v">
            <a href="productList.jsp?page=${v.count}">${v.count}</a>
        </c:forEach>
    </div>
<jsp:include page="productInsert.jsp"/>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
</html>
