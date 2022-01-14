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
                <td>제목</td><td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>코드</td><td><input type="text" name="code" id="code"></td>
            </tr>
            <tr>
                <td>저자</td><td><input type="text" name="author" id="author"></td>
            </tr>
            <tr>
                <td>출판사</td><td><input type="text" name="publisher" id="publisher"></td>
            </tr>
            <tr>
                <td>가격</td><td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>상품설명</td><td><textarea cols="22" rows="4" name="info" id="info"></textarea></td>
            </tr>
            <tr>
                <td>이미지</td><td><input type="file" name="image" id="imabe"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" onclick="return checkInputData()" formaction="insertQuery" value="등록"> <input type="submit" formaction="select.jsp" value="목록조회"></td>
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
            alert("이름 입력해주세요.");
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
