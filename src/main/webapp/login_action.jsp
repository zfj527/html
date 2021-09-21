<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/7/23
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*"%>
<%@ page import="java.util.Date"%>
<%   /*jsp的最前面*/
  request.setCharacterEncoding("UTF-8");
%>
<%
  //数据库路径，其中yiibaidb是我的数据库名称
  String url = "jdbc:mysql://localhost:3306/shop_data?serverTimezone=GMT%2B8";
  String urn = "root";
  String psw = "yhj8616096";
  String x = request.getParameter("username");
  String y = request.getParameter("password");
  String driverClass = "com.mysql.cj.jdbc.Driver";
  Class.forName(driverClass);//加载驱动
  Connection conn = DriverManager.getConnection(url,urn,psw);//得到连接
  if(conn != null){
    String sql = "select * from user_data where username='"+x+"' and password='"+ y + "'";	//验证账号密码
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    if(rs.next()){
      request.setAttribute("my_name",x);
      request.getRequestDispatcher("home.jsp").forward(request,response);
    }
    else{
      String sql1 = "select * from user_data where username=?";// 预编译语句，“？”代表参数
      PreparedStatement pre_em = conn.prepareStatement(sql1);// 实例化预编译语句
      pre_em.setString(1,x);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引
      ResultSet rs1 = pre_em.executeQuery();// 执行查询，注意括号中不需要再加参数
      if(!rs1.next())
      {request.setAttribute("id_label","用户不存在❌！");
        request.setAttribute("ps_label","");
      request.setAttribute("give_user",x);
      request.setAttribute("give_ps",y);
      request.getRequestDispatcher("login.jsp").forward(request,response);
      return;
      }
      else{
        request.setAttribute("ps_label","密码错误❌！");
        request.setAttribute("id_label","");
        request.setAttribute("give_user",x);
        request.setAttribute("give_ps",y);
        request.getRequestDispatcher("login.jsp").forward(request,response);
        return;
      }
    }
  }
  conn.close();

%>