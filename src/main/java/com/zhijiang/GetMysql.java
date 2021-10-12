package com.zhijiang;
import java.sql.*;

public class GetMysql {
    private static final String driver = "com.mysql.jdbc.Driver"; //数据库驱动
    //连接数据库的URL地址
    private static final String url="jdbc:mysql://localhost:3306/shop_data?useSSL=false&serverTimezone=UTC";
    private static final String username="root";//数据库的用户名
    private static final String password="yhj8616096";//数据库的密码

    private static Connection conn = null;

    //静态代码块负责加载驱动
    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //单例模式返回数据库连接对象
    public static Connection getConnection() throws Exception{
        if(conn == null){
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        }

        return conn;
    }

}
