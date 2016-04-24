window.onload = function () {
    getData(function(){
        var issue = document.getElementById('issue');
        var myapply = document.getElementsByClassName('myapply')[0];
        var myissue = document.getElementById('myissue');
        var something = myissue.children;
        issue.onclick = function (e) {
            e.preventDefault();
            if (issue.className == 'myissue') {
                issue.className += '-on';
                myissue.style.height = something.length * 100 + 'px';
                myapply.style.marginTop = something.length * 100 + 'px';
                for (var i = 0; i < something.length; i++) {
                    something[i].style.top = 100 * i + 'px';
                }
            } else {
                issue.className = 'myissue';
                myissue.style.height = '0';
                myapply.style.marginTop = '0';
                for (var i = 0; i < something.length; i++) {
                    something[i].style.top = '0';
                }
            }
        }
    });
};

function getData(callback) {
    var xmlHttp = getXmlHttp();
    try {
        xmlHttp.open('GET', 'personal/personal', true);//要改动
        xmlHttp.send();
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                var json = JSON.parse(xmlHttp.responseText);

                addContent(json);

                callback();
            }
        }
    }
    catch (error) {
        warn(error.message);
    }
}
function addContent(data) {
    var container = document.getElementsByClassName('container')[0];
    var html = '<div class="user">\
            <span class="logo"><img src="images/user-logo.png"></span>\
            <p class="name">' + data.nickname + '</p>\
            <a class="button quit" onclick="window.location.href=\'log/logout\'">退出登录</a>\
            </div>\
            <div class="mine">\
            <ul>\
            <li class="myissue" style="padding: 0;">\
            <div id="issue" class="myissue">\
            <span class="icon" style="transition: none;margin-bottom: 0px;"></span>\
            <p style="line-height: 70px;position:relative;">我发布的<i>' + data.publish_count + '</i></p>\
            </div>\
            <ul id="myissue" style="height: 0">';
    for (var j = 0; j < data.publish.length; j++) {
        html += '<li class="something">\
                <div class="img"><img src="' + data.publish[j].image + '"></div>\
                <div class="something-info">\
                <span class="type">' + data.publish[j].type + '</span>\
                <p class="name">' + data.publish[j].name + '</p>\
            </div>\
                <a class="button cancel" onclick="window.location.href=\'change/publish?image='+ data.publish[j].image + '\'">下架</a>\
                </li>';
    }
    html += '</ul>\
        </li>\
            <li class="myapply"><span class="icon"></span>\
            <p><a href="personal/apply">发出的申请</a><i>' + data.apply_count + '</i></p></li>\
            <li class="myreservation"><span class="icon"></span>\
            <p><a href="personal/receive">收到的预约</a><i>' + data.receive_count + '</i></p></li>\
            <li id="help"><span></span><a href="forword/toHelp">"试试" 使用帮助</a></li>\
        </ul>\
        </div>';
    container.innerHTML = html;
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