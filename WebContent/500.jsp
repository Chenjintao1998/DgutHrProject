<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>505错误页面</title>
</head>
<body>
    <h1>500错误!</h1>
    <%-- 注意exception对象要在上面设置isErrorPage="true" --%>
    <h3 style="color: red;"><%=exception.getCause()%></h3>
</body>
</html>