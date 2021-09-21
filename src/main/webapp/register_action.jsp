<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/7/24
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*"%>
<%   /*jsp的最前面*/
    request.setCharacterEncoding("UTF-8");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String driverClass = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/shop_data?useSSL=false&serverTimezone=UTC";
    String urn = "root";
    String psw = "yhj8616096";
    Class.forName(driverClass);//加载驱动
    Connection con = DriverManager.getConnection(url,urn,psw);//得到连接
    String username1=request.getParameter("username1");

    String sql_user = "select * from user_data where username=?";// 预编译语句，“？”代表参数
    PreparedStatement pre_user = con.prepareStatement(sql_user);// 实例化预编译语句
    pre_user.setString(1, username1);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引
    ResultSet rs1 = pre_user.executeQuery();// 执行查询，注意括号中不需要再加参数


    String password1=request.getParameter("password1");

    String phone=request.getParameter("phone");
    String sql_ph = "select * from user_data where phone=?";// 预编译语句，“？”代表参数
    PreparedStatement pre_ph = con.prepareStatement(sql_ph);// 实例化预编译语句
    pre_ph.setString(1, phone);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引
    ResultSet rs2 = pre_ph.executeQuery();// 执行查询，注意括号中不需要再加参数
    String get_checkma2=request.getParameter("check_name");
    String email= (String) session.getAttribute("email_temp2");
    String get_checkma1= (String) session.getAttribute("now_checkma");

    if(rs1.next())
    {
        request.setAttribute("phrs_label","");
        request.setAttribute("idrs_label","❌用户名已经存在，换个再试试吧~");
        request.setAttribute("emrs_label","");
        request.setAttribute("checkma_label","");
        request.setAttribute("user_temp",username1);
        request.setAttribute("phone_temp",phone);
        request.setAttribute("checkma_temp",get_checkma2);
        request.setAttribute("email_temp",email);
        request.setAttribute("password_temp",password1);
        request.getRequestDispatcher("register.jsp").forward(request,response);
        return ;
    }

    if(rs2.next())
    {
        request.setAttribute("emrs_label","");
        request.setAttribute("idrs_label","");
        request.setAttribute("checkma_label","");
        request.setAttribute("phrs_label","❌号码已经绑定，换个再试试吧~");
        request.setAttribute("email_temp",email);
        request.setAttribute("phone_temp",phone);
        request.setAttribute("checkma_temp",get_checkma2);
        request.setAttribute("user_temp",username1);
        request.setAttribute("password_temp",password1);
        request.getRequestDispatcher("register.jsp").forward(request,response);
        return ;
    }

    if(get_checkma1.equals(get_checkma2)==false)
    {
        request.setAttribute("emrs_label","");
        request.setAttribute("idrs_label","");
        request.setAttribute("checkma_label","❌验证码错误，请仔细检查~");
        request.setAttribute("phrs_label","");
        request.setAttribute("email_temp",email);
        request.setAttribute("phone_temp",phone);
        request.setAttribute("checkma_temp",get_checkma2);
        request.setAttribute("user_temp",username1);
        request.setAttribute("password_temp",password1);
        request.getRequestDispatcher("register.jsp").forward(request,response);
        return;
    }

    PreparedStatement pre= con.prepareStatement("INSERT INTO user_data VALUES (?,?,?,?)");
    pre.setString(1,username1);
    pre.setString(2,password1);
    pre.setString(3,phone);
    pre.setString(4,email);
    pre.executeUpdate();
    con.close();
    pre.close();
    request.setAttribute("give_user",username1);
    request.setAttribute("give_ps",password1);
    request.getRequestDispatcher("login.jsp").forward(request,response);
    return ;
%>