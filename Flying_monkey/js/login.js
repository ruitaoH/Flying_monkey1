function loginCheck(){

    var user = login.email;
    if (checkIsEmpty(user,'登录邮箱不能为空!')){
        return false;
    }else if(!/[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z]+/.test(user.value)){
        warn('请输入有效的邮箱名!');
        return false;
    }

    var pwdInput = document.getElementById('pwd-input');
    var pwdMd5 = login.password;
    if(checkIsEmpty(pwdInput,'密码不能为空!')){
        return false;
    }else if(pwdInput.value.length <6 || pwdInput.value.length >16){
        warn('密码长度不能大于16位,且不能小于6位!');
        return false;
    }
    else {
        pwdMd5.value = faultylabs.MD5(pwdInput.value);
    }

    login.submit();
}
