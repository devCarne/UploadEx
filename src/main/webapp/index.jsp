<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<style>
    #loginFrame {
        width: 40%;
        margin: 0 auto;
    }
</style>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<jsp:include page="frame/header.jsp"/>
<section>
    <div id="pageTitle">
        <h2>로그인</h2>
    </div>
    <table id="loginFrame">
        <tr>
            <td>
                <form method="post">
                    <table id="adminTable" border="1">
                        <tr>
                            <td colspan="2">관리자 로그인</td><td rowspan="3"><input type="submit" formaction="adminLogin" value="로그인"></td>
                        </tr>
                        <tr>
                            <td>아이디</td><td><input type="text" name="adminID"></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td><td><input type="password" name="adminPW"></td>
                        </tr>
                    </table>
                </form>
            </td>
            <td width="100px">
            </td>
            <td>
                <form method="post">
                    <table id="memberTable" border="1">
                        <tr>
                            <td colspan="2">회원 로그인</td><td rowspan="2"><input type="submit" formaction="memberLogin" value="로그인"></td>
                        </tr>
                        <tr>
                            <td>아이디</td><td><input type="text" name="memberID"></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td><td><input type="password" name="memberPW"></td><td><input type="submit" formaction="memberSignIn.jsp" value="회원가입"></td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</section>
<jsp:include page="frame/footer.jsp"/>
</body>
</html>