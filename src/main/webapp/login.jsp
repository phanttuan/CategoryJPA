<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <p style="color:red">${message}</p>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label>Username: <input type="text" name="username" required /></label><br/>
        <label>Password: <input type="password" name="password" required /></label><br/>
        <button type="submit">Login</button>
    </form>
</body>
</html>