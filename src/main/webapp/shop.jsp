<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/9/20
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.alibaba.fastjson.JSON"%>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.zhijiang.WaresRun" %>
<%@ page import="com.zhijiang.Wares" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>商品</title>
    <link href="shop.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>商品列表</h1>
<hr />

<table width="750" height="60" cellpadding="0" cellspacing="0" border="0" align="center">
    <tr>
        <td>
            <!-- 商品循环开始 -->
            <%
                WaresRun now = new WaresRun();
                ArrayList<Wares> list = now.GetAllGood();
                if (list != null && list.size() > 0) {
                    for(Wares t : list) {
            %>
            <div>
                <dl>
                    <dt>
                        <a href="products_details.jsp?id=<%=t.getId()%>">
                            <img src="images/<%=t.getPicture()%>" width="120" height="90" border="1"/>
                        </a>
                    </dt>
                    <dd class="dd_name"><%=t.getName()%></dd>
                    <dd class="dd_city">产地:<%=t.getCity() %>&nbsp;&nbsp;价格:¥<%=t.getPrice()%></dd>
                </dl>
            </div>
            <%
                    }
                }
            %>
        </td>
    </tr>
</table>
</body>
</html>
