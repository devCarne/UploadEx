<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("userID");
    session.removeAttribute("userName");
    session.removeAttribute("grade");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
