window.onload = function () {
    getData();
}
function getData() {
    var xmlHttp = getXmlHttp();
    try {
        xmlHttp.open('GET', 'personalData/applyData', true);//要改动
        xmlHttp.send();
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                var json = JSON.parse(xmlHttp.responseText);

                console.log(json);

                addContent(json);//要改动
            }
        }
    } catch (error) {
        warn(error.message);
    }
}
function addContent(data) {
    var myapply = document.getElementById('myapply');
    var frag = document.createDocumentFragment();
    for (var i = 0; i < data.success.length; i++) {
        var li = document.createElement('li');
        li.className = 'something';
        li.innerHTML = '<div class="img"><img src="' + data.success[i].image + '"></div>\
            <div class="desc">\
            <span class="type">' + data.success[i].type + '</span>\
            <p class="name">' + data.success[i].name + '</p>\
            <span class="contact" onclick="contact(\'' + data.success[i].phone + '\',\'' + data.success[i].qq + '\',\'' + data.success[i].weixin + '\');"><span></span>联系物主</span>\
            </div>\
            <span class="status success">预约成功</span>\
            <a class="cancel" onclick="window.location.href=\'change/apply?image=' + data.success[i].image + '\'">取消</a>';
        frag.appendChild(li);
    }
    for (var i = 0; i < data.wait.length; i++) {
        var li = document.createElement('li');
        li.className = 'something';
        li.innerHTML = '<div class="img"><img src="' + data.wait[i].image + '"></div>\
            <div class="desc">\
            <span class="type">' + data.wait[i].type + '</span>\
            <p class="name">' + data.wait[i].name + '</p>\
            </div>\
            <span class="status">待回复</span>\
            <a class="cancel" onclick="window.location.href=\'change/apply?image=' + data.wait[i].image + '\'">取消</a>';
        frag.appendChild(li);
    }
    for (var i = 0; i < data.fail.length; i++) {
        var li = document.createElement('li');
        li.className = 'something';
        li.innerHTML = '<div class="img"><img src="' + data.fail[i].image + '"></div>\
            <div class="desc">\
            <span class="type">' + data.fail[i].type + '</span>\
            <p class="name">' + data.fail[i].name + '</p>\
            </div>\
            <span class="status fail">预约失败</span>\
            <a class="cancel" onclick="window.location.href=\'change/apply?image=' + data.fail[i].image +'\'">取消</a>';
        frag.appendChild(li);
    }
    myapply.appendChild(frag);
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


