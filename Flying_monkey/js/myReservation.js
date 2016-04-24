window.onload = function () {
    getData();
}
function getData() {
    var xmlHttp = getXmlHttp();
    try {
        xmlHttp.open('GET', 'personalData/receiveData', true);//要改动
        xmlHttp.send();
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                var json = JSON.parse(xmlHttp.responseText);

                console.log(json);

                addContent(json);
            }
        }
    }
    catch (error) {
        warn(error.message);
    }
}
function addContent(data) {
    var container = document.getElementsByClassName('container')[0];
    var ul = document.createElement('ul');
    var html = '';
    for (var i = 0; i < data.agree.length; i++) {
        html = '<li class="reserve-info">\
            <div class="someone">\
            <span class="user-logo"><img src="images/user-logo.png"></span>\
            <p class="user-info">' + data.agree[i].nickname + '<small>  ' + data.agree[i].major + '</small></p>\
            <span class="contact-btn" onclick="contact(\'' + data.agree[i].phone + '\',\'' + data.agree[i].qq + '\',\'' + data.agree[i].weixin + '\')"><span></span>联系他/她</span>\
            </div>\
            <div class="something">\
            <span class="type">' + data.agree[i].type + '</span>\
            <div class="img"><img src="' + data.agree[i].image + '"></div>\
            <div class="thing-info">\
            <p class="name">' + data.agree[i].name + '</p>\
            <p class="price">价值: ' + data.agree[i].value + '</p>\
        <p class="try_price">价格: ' + data.agree[i].price + '</p>\
        </div>\
        <a class="button agree">已同意</a>\
            </div>\
            <div class="apply-info">\
            <div class="switch"><span class="time">' + data.agree[i].time + '</span><span class="switch-btn" onclick="displayInfo(this);">预约信息<span></span></span></div>\
            <div class="infos">\
            <div class="caption">申请说明:' + data.agree[i].info + '</div>\
        </div>\
        </div>\
        </li>';
    }
    for (var i = 0; i < data.wait.length; i++) {
        html += '<li class="reserve-info">\
            <div class="someone">\
            <span class="user-logo"><img src="images/user-logo.png"></span>\
            <p class="user-info">' + data.wait[i].nickname + '<small>  ' + data.wait[i].major + '</small></p>\
            </div>\
            <div class="something">\
            <span class="type">' + data.wait[i].type + '</span>\
            <div class="img"><img src="' + data.wait[i].image + '"></div>\
            <div class="thing-info">\
            <p class="name">' + data.wait[i].name + '</p>\
            <p class="price">价值: ' + data.wait[i].value + '</p>\
        <p class="try_price">价格: ' + data.wait[i].price + '</p>\
        </div>\
        <a class="button agree" onclick="warn(\'同意\',\'' + data.wait[i].nickname + '\',\'' + data.wait[i].image + '\');">同意</a>\
            <a class="button reject" onclick="warn(\'拒绝\',\'' + data.wait[i].nickname + '\',\'' + data.wait[i].image + '\');">拒绝</a>\
            </div>\
            <div class="apply-info">\
            <div class="switch"><span class="time">' + data.wait[i].time + '</span><span class="switch-btn" onclick="displayInfo(this);">预约信息<span></span></span></div>\
            <div class="infos">\
            <div class="caption">申请说明:' + data.wait[i].info + '</div>\
        </div>\
        </div>\
        </li>';
    }
    for (var i = 0; i < data.refuse.length; i++) {
        html += '<li class="reserve-info">\
            <div class="someone">\
            <span class="user-logo"><img src="images/user-logo.png"></span>\
            <p class="user-info">' + data.refuse[i].nickname + '<small>  ' + data.refuse[i].major + '</small></p>\
            </div>\
            <div class="something">\
            <span class="type">' + data.refuse[i].type + '</span>\
            <div class="img"><img src="' + data.refuse[i].image + '"></div>\
            <div class="thing-info">\
            <p class="name">' + data.refuse[i].name + '</p>\
            <p class="price">价值: ' + data.refuse[i].value + '</p>\
        <p class="try_price">价格: ' + data.refuse[i].price + '</p>\
        </div>\
        <a class="button reject">已拒绝</a>\
            </div>\
            <div class="apply-info">\
            <div class="switch"><span class="time">' + data.refuse[i].time + '</span><span class="switch-btn" onclick="displayInfo(this);">预约信息<span></span></span></div>\
            <div class="infos">\
            <div class="caption">申请说明:' + data.refuse[i].info + '</div>\
            </div>\
        </div>\
        </li>';
    }
    ul.innerHTML = html;
    container.appendChild(ul);
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
function warn(text,nickname,image) {
    if(text == '同意') {
        var warn = document.createElement('div');
        warn.className = 'warn-mask';
        warn.innerHTML = '<div class="warn">\
    <p>你真的要' + text + '吗?</p>\
    <a class="button warn-agree" onclick="window.location.href=\'change/receive_agree?image=' + image + '&nickname=' + nickname + '\'">' + text + '</a>\
        <a class="button warn-reject" onclick="closeWarn();">取消</a>\
        </div>';
        document.body.appendChild(warn);
    }else if(text == '拒绝'){
        var warn = document.createElement('div');
        warn.className = 'warn-mask';
        warn.innerHTML = '<div class="warn">\
    <p>你真的要' + text + '吗?</p>\
    <a class="button warn-agree" onclick="window.location.href=\'change/receive_refuse?image=' + image + '&nickname=' + nickname + '\'">' + text + '</a>\
        <a class="button warn-reject" onclick="closeWarn();">取消</a>\
        </div>';
        document.body.appendChild(warn);
    }
}
function closeWarn() {
    document.body.removeChild(document.getElementsByClassName('warn-mask')[0]);
}