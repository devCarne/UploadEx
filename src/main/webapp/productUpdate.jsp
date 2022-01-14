<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #productUpdateTable {
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
        <h2>상품 정보 변경</h2>
    </div>
    <form method="post" enctype="multipart/form-data">
        <table id="productUpdateTable" border="1">
            <tr>
                <td>제목</td><td><input type="text" name="name" value="${book.name}" id="name"></td><td>이미지(소스) : <input type="text" name="originImage" value="${book.image}" readonly></td>
            </tr>
            <tr>
                <td>코드</td><td><input type="text" name="code" value="${book.code}" id="code"></td><td rowspan="5"><img width="320px" height="400px" src="${book.image}" alt="${book.image}"/></td>
            </tr>
            <tr>
                <td>저자</td><td><input type="text" name="author" value="${book.author}" id="author"></td>
            </tr>
            <tr>
                <td>출판사</td><td><input type="text" name="publisher" value="${book.publisher}" id="publisher"></td>
            </tr>
            <tr>
                <td>가격</td><td><input type="text" name="price" value="${book.price}" id="price"></td>
            </tr>
            <tr>
                <td>상품설명</td><td><textarea cols="22" rows="4" name="info" id="info">${book.info}</textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" onclick="return checkInputData()" formaction="updateQuery" value="변경"><input type="submit" formaction="deleteQuery?delCode=${book.code}" value="삭제"></td><td>이미지 변경 : <input type="file" name="changeImage"></td>
            </tr>
        </table>
    </form>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
<script>
    document.getElementById("name").focus();

    function checkInputData() {
        if(document.getElementById("name").value.length === 0) {
            alert("이름을 입력해주세요.");
            document.getElementById("name").focus();
            return false;
        } else if(document.getElementById("code").value.length === 0) {
            alert("상품코드를 입력해주세요.");
            document.getElementById("code").focus();
            return false;
        } else if(document.getElementById("author").value.length === 0) {
            alert("저자를 입력해주세요.");
            document.getElementById("author").focus();
            return false;
        } else if(document.getElementById("publisher").value.length === 0) {
            alert("출판사를 입력해주세요.");
            document.getElementById("publisher").focus();
            return false;
        } else if(document.getElementById("price").value.length === 0) {
            alert("가격을 입력해주세요.");
            document.getElementById("price").focus();
            return false;
        } else if(document.getElementById("info").value.length === 0) {
            alert("상품설명을 입력해주세요.");
            document.getElementById("info").focus();
            return false;
        } else if(document.getElementById("image").value.length === 0) {
            alert("상품사진을 넣어주세요.");
            document.getElementById("image").focus();
            return false;
        }
    }
</script>
</html>
