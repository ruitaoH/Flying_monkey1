//判断某区域是否为空
function checkIsEmpty(feild, warnText){
    if(feild.value == null || feild.value.replace(/\s*/, '') == ''){
        warn(warnText);
        feild.focus();
        return true;
    }else {
        return false
    }
}
//警告框
function warn(text){
    var warnWrap = document.createElement('div');
    warnWrap.className = 'warn-wrap';
    warnWrap.innerHTML = '<div class="warn"><p>'+text+'</p ><a onclick="closeWarn(this.parentNode.parentNode);">好</a ></div>';
    document.body.appendChild(warnWrap);
    var all = document.body.children;
    for(var i=0;i<all.length;i++){
        all[i].className += ' blur';
    }
    warnWrap.className = warnWrap.className.replace(/\s*blur\s*/, '');
}
//关闭警告框
function closeWarn(warn){
    document.body.removeChild(warn);
    var all = document.body.children;
    for(var i=0;i<all.length;i++) {
        all[i].className = all[i].className.replace(/\s*blur\s*/, '');
    }
}

//返回一个XMLHTTPRequest
function getXmlHttp() {
    var xmlHttp = null;
    if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    } else {
        xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
    }
    return xmlHttp;
}