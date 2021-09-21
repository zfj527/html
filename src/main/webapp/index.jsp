<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>枝江大卖场</title>
</head>
<body>


<%
    //数据库路径，其中yiibaidb是我的数据库名称
    String url = "jdbc:mysql://localhost:3306/shop_data?serverTimezone=GMT%2B8";
    //告诉连接你的账号密码
    String username = "root";
    String password = "yhj8616096";

    try {

    //反射加载jdbc的Driver类
    Class.forName("com.mysql.cj.jdbc.Driver");
    //通过DriverManager获取Connection对象
    Connection con = DriverManager.getConnection(url,username,password);

    String sql = "SELECT * FROM check_num ORDER BY RAND() LIMIT 1;";

    //通过PrepardStatement 准备sql语句
    PreparedStatement statement = con.prepareStatement(sql);

    //获取结果集
    ResultSet rs = statement.executeQuery();

    //声明结果集的结构
    ResultSetMetaData rsmd = rs.getMetaData();

    //获取结果集的列数
    int count = rsmd.getColumnCount();

    //对结果集进行遍历
    while(rs.next())
    {
    out.println(rs.getString(1));
    }

%>

//关闭我们的连接
<%	rs.close();

    statement.close();

    con.close();

    }catch(Exception e)
    {
    e.printStackTrace();
    }

%>

</body>
</html>
