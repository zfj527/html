package com.zhijiang;

public class User {
    private String User_Id;
    private String Password;
    private String Phone;
    private String Email;

    public void setEmail(String email) {
        Email = email;
    }

    public String getEmail() {
        return Email;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getPassword() {
        return Password;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getPhone() {
        return Phone;
    }

    public String getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(String user_Id) {
        User_Id = user_Id;
    }
    public User() {
    }
    public User(String x,String y,String z,String m){
        User_Id=x;
        Password=y;
        Phone=z;
        Email=m;
    }
}
