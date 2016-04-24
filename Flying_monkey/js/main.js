var COUNT = 0;
const UPDATE_LENGHT = 8;
window.onload = function () {
    getData();
}
window.addEventListener("scroll",function(){
    setTimeout(function(){
        if (checkIsBottom()) {
            getData();
        }
    },0);
});

function getData() {
    var xmlHttp = getXmlHttp();
    try {
        /*xmlHttp.open('GET', 'indexData', true);*/
        xmlHttp.open('GET', 'indexData', true);
        xmlHttp.send();
        xmlHttp.addEventListener("readystatechange",function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                var json = JSON.parse(xmlHttp.responseText);

                console.log(json);

                addContent(json.responseJson, waterfall);
            }
        });
    } catch (error) {
        warn(error.message);
    }
}
function addContent(data, callback) {
    var boxArr = [];
    for (var i = COUNT; i < COUNT + UPDATE_LENGHT; i++) {
        if (i < data.length) {
            var box = document.createElement('div');
            box.className = 'box-wrap';
            boxArr.push(box);

            (function (index) {
                box.onclick = function () {

                    //------------------------------------???
                    window.location.href = 'commodity/commodity?image=' + data[index].image;
                }
            })(i);
            box.innerHTML = '<figure class="box">\
            <div class="main-img">\
            <img height="150px" src="' + data[i].image + '">\
            <div class="img-desc"><p>' + data[i].value + '</p></div>\
            </div>\
            <figcaption class="info">\
            <div class="brief-desc">\
            <h2 class="name"><span class="category">' + data[i].type + '</span>' + data[i].name + '</h2>\
            <div class="caption">' + data[i].tip + '</div>\
            <p class="price">' + data[i].price + '元/次</p>\
            </div>\
            <div class="host">\
            <p class="host-name"><span><img src="images/user-logo.png" /></span>' + data[i].nickname + '</p>\
            <p class="host-info">' + data[i].major + '</p>\
            <span class="wantNum">' + data[i].trys + '人想试</span>\
            </div>\
            </figcaption>\
            </figure>';
        } else {
            if (document.getElementById("yijingdaodile") == undefined) {
                var p = document.createElement('p');
                p.innerHTML = '已经到底了...';
                p.id = "yijingdaodile";
                document.body.appendChild(p);
                boxArr.push(p);
                break;
            }
        }
    }
    COUNT += UPDATE_LENGHT;
    callback(boxArr);
}
function waterfall(box) {
    var col1 = document.getElementById('col-1');
    for (var i = 0; i < box.length; i++) {
        if (i == 0) {
            col1.appendChild(box[i]);
        } else {
            (function (i) {
                box[i - 1].getElementsByTagName('img')[0].onload = function () {
                    setTimeout(appendBox(box[i]), 0);
                }
            })(i);
        }
    }
}
function appendBox(box) {
    var col1 = document.getElementById('col-1');
    var col2 = document.getElementById('col-2');
    if (col1.clientHeight <= col2.clientHeight) {
        col1.appendChild(box);
    } else {
        col2.appendChild(box);
    }
}
//判断是否已经到了底部
function checkIsBottom() {
    var winHeight = window.innerHeight;
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    var box = document.getElementsByClassName('box-wrap');
    var lastBoxOffsetHeight = box[box.length - 1].offsetTop;
    if (lastBoxOffsetHeight < winHeight + scrollTop) {
        return true;
    } else {
        return false;
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