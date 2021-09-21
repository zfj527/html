<%@ page import="com.zhijiang.SendEmail" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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



    String email=request.getParameter("email");
    String sql_em = "select * from user_data where email=?";// 预编译语句，“？”代表参数
    PreparedStatement pre_em = con.prepareStatement(sql_em);// 实例化预编译语句
    pre_em.setString(1, email);// 设置参数，前面的1表示参数的索引，而不是表中列名的索引
    ResultSet rs3 = pre_em.executeQuery();// 执行查询，注意括号中不需要再加参数
    if(rs3.next())
    {
        request.setAttribute("emrs_label","❌邮箱已经绑定，换个再试试吧~");
        request.setAttribute("idrs_label","");
        request.setAttribute("phrs_label","");
        request.setAttribute("email_temp",email);
        request.getRequestDispatcher("register.jsp").forward(request,response);
        return;
    }
    else{
        String n=new String();
        String sql = "SELECT * FROM check_num ORDER BY RAND() LIMIT 1;";
        //通过PrepardStatement 准备sql语句
        PreparedStatement statement = con.prepareStatement(sql);
        //获取结果集
        ResultSet rs = statement.executeQuery();
        //对结果集进行遍历
        while(rs.next())
        {
            n=rs.getNString(1);
        }
        SendEmail now=new SendEmail();
        now.send_email(email,n);
        request.setAttribute("emrs_label","✔验证码已发送，注意查收~");
        request.setAttribute("idrs_label","");
        request.setAttribute("phrs_label","");
        request.setAttribute("email_temp",email);
        session.setAttribute("email_temp2",email);
        session.setAttribute("now_checkma",n);
        request.getRequestDispatcher("register.jsp").forward(request,response);
    }
%>
