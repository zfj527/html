<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/7/23
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<title>枝江卖场</title>
<head>
    <link rel="stylesheet" type="text/css" href="./login.css" />
    <script src="login.js"></script>
</head>
<body>
<div class="login-box">
    <h2>登录界面</h2>
    <form action="login_action.jsp" onsubmit="return check_void()" method="post">
        <div class="login-field">
            <input type="text" name="username" required="" value="${requestScope.give_user}"/>
            <label>用户id</label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${id_label}</label>
        </div>
        <div class="login-field">
            <input type="password" name="password" required="" value="${requestScope.give_ps}" />
            <label>密码</label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ps_label}</label>
        </div>
        <button type="submit">登录</button>
        <button type="button" onclick="goto_register()">注册枝江账号</button>
    </form>
</div>
</body>

</html>
