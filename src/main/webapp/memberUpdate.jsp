<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO member = memberDAO.select((String) session.getAttribute("userID"));
    pageContext.setAttribute("m", member);
%>
<html>
<style>
    #memberUpdateTable {
        width: 20%;
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
        <h2>내 정보 변경</h2>
    </div>
    <form method="post">
        <table id="memberUpdateTable" border="1">
            <tr>
                <td>아이디</td><td><input type="text" name="id" value="${m.id}" id="id" readonly></td>
            </tr>
            <tr>
                <td>비밀번호</td><td><input type="password" name="password" id="password"></td>
            </tr>
            <tr>
                <td>이름</td><td><input type="text" name="name" value="${m.name}" id="name"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" onclick="return checkInputData()" formaction="memberUpdate" value="변경"><input type="submit" formaction="memberDelete?delId=${m.id}" value="회원탈퇴">
            </tr>
        </table>
    </form>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
<script>
    document.getElementById("password").focus();

    function checkInputData() {
        if(document.getElementById("password").value.length === 0) {
            alert("비밀번호를 입력해주세요.");
            document.getElementById("password").focus();
            return false;
        } else if(document.getElementById("name").value.length === 0) {
            alert("이름을 입력해주세요.");
            document.getElementById("name").focus();
            return false;
        }
    }
</script>
</html>
