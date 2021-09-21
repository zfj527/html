function goto_register(){
    window.open("register.jsp");
}
function check_void(){
    var x=document.getElementsByName("username");
    var y=document.getElementsByName("password");
    if(x==null||y==null){
        return false;
    }
    else
        return true;
}
