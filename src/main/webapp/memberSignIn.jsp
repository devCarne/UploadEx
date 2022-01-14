<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    #memberSignInTable {
        width: 20%;
        height: 20%;
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
        <h2>회원가입</h2>
    </div>
    <form method="post">
        <table id="memberSignInTable">
            <tr>
                <td>아이디</td><td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td><td><input type="password" name="pw" id="pw"></td>
            </tr>
            <tr>
                <td>이름</td><td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" onclick="return checkInputData()" formaction="memberInsert" value="등록"></td>
            </tr>
        </table>
    </form>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
<script>
    document.getElementById("id").focus();

    function checkInputData() {
        if(document.getElementById("id").value.length === 0) {
            alert("아이디를 입력해주세요.");
            document.getElementById("id").focus();
            return false;
        } else if(document.getElementById("pw").value.length === 0) {
            alert("비밀번호를 입력해주세요.");
            document.getElementById("pw").focus();
            return false;
        }
    }
</script>
</html>
