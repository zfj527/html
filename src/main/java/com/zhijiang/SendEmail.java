package com.zhijiang;
import com.sun.mail.util.MailSSLSocketFactory;
import java.security.GeneralSecurityException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail
{
    public SendEmail(){
    }
    public void send_email (String x,String y) throws GeneralSecurityException,MessagingException
    {
        Properties prop=new Properties();
        prop.setProperty("mail.host","smtp.qq.com");
        prop.setProperty("mail.transport.protocol","smtp"); //邮件发送协议
        prop.setProperty("mail.smtp.auth","true"); //需要验证用户密码

        //关于QQ邮箱，还需要设置SSL加密，加上下面代码即可，其他邮箱不需要
        MailSSLSocketFactory sf=new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable","true");
        prop.put("mail.smtp.ssl.socketFactory",sf);

        /*使用JavaMail发送邮件五个步骤
        1.创建定义整个应用程序所需的环境信息的Session对象
        2.通过Session得到transport对象
        3.使用邮箱的用户名和授权码连上邮件服务器
        4.创建邮件：写邮件【主体】
        5.发送邮件
        6.关闭连接
         */

        //1.创建定义整个应用程序所需的环境信息的Session对象
        //QQ邮箱才需在初始化Session时，需要授权new Authenticator()，其他邮箱不用
        Session session=Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                //发件人邮箱用户名，授权码
                return new PasswordAuthentication("1099028579@qq.com","ncvwudjuroqtjdic");

            }
        });

        //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
        session.setDebug(true);

        //2.通过Session得到transport对象
        Transport ts=session.getTransport();

        //3.使用邮箱的用户名和授权码连上邮件服务器
        ts.connect("smtp.qq.com","1099028579@qq.com","ncvwudjuroqtjdic");
        try {
            //4.创建邮件：写邮件
            //主要专递session
            MimeMessage message = new MimeMessage(session);

            //指明邮件的发件人
            message.setFrom(new InternetAddress("1099028579@qq.com"));
            //指明邮件收件人
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(x));
            //邮件的主题
            message.setSubject("完成枝江商城的注册");

            //********************只有邮件的内容发生了改变*******************
            //邮件的内容:文本+嵌入文本的图片
            //MimeBodyPart相当于是一层封装，文本、图片、附件各自有封装，最后再封装一次
            //1)准备图片，需要经过数据处理
            MimeBodyPart image = new MimeBodyPart();
            DataHandler dataHandler = new DataHandler(new FileDataSource("D:\\ava.jpg"));
            image.setDataHandler(dataHandler);
            image.setContentID("bz.jpg");

            //2）准备正文数据
            MimeBodyPart text = new MimeBodyPart();
            text.setContent("恭喜，邮件已经找到您了,验证码为："+y+"\n"+"<img src='cid:bz.jpg'>", "text/html;charset=UTF-8");

            //3)图片和文本封装在一起，描述数据关系
            MimeMultipart mm = new MimeMultipart();
            mm.addBodyPart(text);
            mm.addBodyPart(image);
            mm.setSubType("related");

            //4)设置到消息中，保存修改
            message.setContent(mm); //把最后编辑好的文件放到消息中去
            message.saveChanges(); //保存修改

            //***********************************************************

            //5.发送邮件
            ts.sendMessage(message, message.getAllRecipients());
            System.out.println("发送成功！");
        }catch (MessagingException mex){
            System.out.println("发送失败！");
        }
        //6.关闭连接
    }
}

