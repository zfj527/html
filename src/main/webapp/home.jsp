<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-ch">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link rel="shortcut icon" href="img/touxiang.png" type="image/x-icon">
    <title>${my_name}的通道</title>
</head>
<body>
    
    <div class="bg">
        <div class="proflieCard">
            <div class="logo1">
                <img src="img/touxiang.png" alt="" class="logo2">
            </div>
            <p class="name">${my_name}</p>
            
            <div class="slogan" id="slogan">
                <p class="slogan2" id="slogan2">欢迎${my_name}回家，这是属于我们的时代！</p>
            </div>
            <div class="buttons">
                <button class="button1" onclick="window.open('my_home.jsp')">关于我自己</button>
                <button class="button1" onclick="window.open('talk.jsp')">进入聊天室</button>
                <button class="button1" onclick="window.open('comment.jsp')">进入评论区精选</button>
            </div>
            <footer class="footer">
                <p class="footer2">@2021 要好好吃饭呦~</p>
            </footer>

        </div>

        
    </div>

    

    <img src="img/lihui1.png" class="lihui" id="lihui" alt="">
    <div class="background" id="background"></div>
    <div class="yinghua" id="yinghua"></div>
    <div class="background2" id="background2"></div>

    <script src="main.js"></script>
    <script>
        window.onload=load2D_bg();
        window.onload=load2D_bg2();
        window.onload=load2D_bg2_2();//不写注释一时爽，写完再看火葬场
        window.onload=load2D_lihui();
        window.onload=load2D_yinghua();
        
        
    </script>
    
</body>
</html>
