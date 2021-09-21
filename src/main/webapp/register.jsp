<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/7/24
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>枝江账号注册</title>
    <link rel="stylesheet" type="text/css" href="./register.css" />
    <script src="register.js"></script>
</head>
<body>
<div class="login-box">
    <h2>注册界面</h2>
    <form action="send_email.jsp" id="form1" onsubmit="return check_email()" method="post">
        <div class="login-field">
            <input type="text" id="em_num" value="${requestScope.email_temp}" name="email"  maxlength="25" required="" />
            <label>绑定邮箱(QQ邮箱)</label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${emrs_label}</label>
            <button type="submit">获取验证码</button>
        </div>
    </form>
    <form action="register_action.jsp" id="form2" onsubmit="return check_text()" method="post">
        <br>
        <div class="login-field">
            <input type="text"  id="check_id" name="check_name" value="${requestScope.checkma_temp}" required="" maxlength="10"/>
            <label>验证码</label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${checkma_label}</label>
        </div>
        <div class="login-field">
            <input type="text" id="user_num" value="${requestScope.user_temp}" name="username1" required="" maxlength="15" />
            <label>用户id</label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${idrs_label}</label>
        </div>

        <div class="login-field">
            <input type="text" id="ph_num" value="${requestScope.phone_temp}" name="phone" maxlength="11" required="" />
            <label>绑定手机号码</label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${phrs_label}</label>
        </div>
        <div class="login-field">
            <input type="password" value="${requestScope.password_temp}" name="password1" required="" maxlength="25"/>
            <label>登录密码</label>
        </div>
        <button type="submit" onclick="">完成注册</button>
    </form>
</div>
</body>
</html>
