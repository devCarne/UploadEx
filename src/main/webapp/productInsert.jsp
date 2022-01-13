<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    #productInsertTable {
        width: 20%;
        height: 40%;
        border: solid gray 1px;
        margin: 0 40%;
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
        <h2>상품 등록</h2>
    </div>
    <form method="post" enctype="multipart/form-data">
        <table id="productInsertTable">
            <tr>
                <td>제목</td><td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>코드</td><td><input type="text" name="code"></td>
            </tr>
            <tr>
                <td>저자</td><td><input type="text" name="author"></td>
            </tr>
            <tr>
                <td>출판사</td><td><input type="text" name="publisher"></td>
            </tr>
            <tr>
                <td>가격</td><td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>상품설명</td><td><textarea cols="22" rows="4" name="info"></textarea></td>
            </tr>
            <tr>
                <td>이미지</td><td><input type="file" name="image"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" formaction="insertQuery" value="등록"> <input type="submit" formaction="select.jsp" value="목록조회"></td>
            </tr>
        </table>
    </form>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
</html>
