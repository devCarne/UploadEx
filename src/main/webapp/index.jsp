<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form>
    <table border="1">
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
<form>
    <table border="1">
        <tr>
            <td colspan="2">회원 로그인</td><td rowspan="3"><input type="submit" formaction="memberLogin" value="로그인"></td>
        </tr>
        <tr>
            <td>아이디</td><td><input type="text" name="memberID"></td>
        </tr>
        <tr>
            <td>비밀번호</td><td><input type="password" name="memberPW"></td>
        </tr>
    </table>
</form>
<a href="memberSignIn.jsp"></a>
<a href="adminSignIn.jsp"></a>
<a href="productInsert.jsp">상품등록</a>
<a href="productList.jsp">상품조회</a>
</body>
</html>