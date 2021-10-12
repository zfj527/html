<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/9/20
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="container">
</div>
<script>
    window.onload = function () {
        var sp=document.createElement('span');

        sp.innerHTML='<%=((String[])request.getAttribute("777"))[2]%>'
        var temp=document.getElementById('container');
        temp.appendChild(sp);

        var sp1=document.createElement('img');
        sp1.src='<%=((String[])request.getAttribute("777"))[1]%>'
        var temp1=document.getElementById('container');
        temp1.appendChild(sp1);


    }
</script>


</body>
</html>
