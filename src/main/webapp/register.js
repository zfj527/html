/*校验邮件地址是否合法 */
/*校验电话码格式 */
function IsEmail(str) {
    var reg=/^[1-9][0-9]{4,14}@qq.com$/;
    return reg.test(str);
}

function isTelCode(str) {
    var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    return reg.test(str);
}

function check_text(){
    if(!IsEmail(document.getElementById("em_num").value)){
        alert("邮箱地址格式错误！");
        document.getElementById("em_num").focus();
        return false;
    }
    if(!isTelCode(document.getElementById("ph_num").value)){
        alert("电话号码格式错误！");
        document.getElementById("ph_num").focus();
        return false;
    }
    return true;
}
function check_email(){
    if(!IsEmail(document.getElementById("em_num").value)){
        alert("邮箱地址格式错误！");
        document.getElementById("em_num").focus();
        return false;
    }
    else{
      return true;
    }
}
