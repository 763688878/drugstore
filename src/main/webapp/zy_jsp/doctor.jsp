<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>医师</title>
    <link rel="stylesheet" href="/webjars/bootstrap/3.3.5/css/bootstrap.css">
    <link rel="stylesheet" href="/webjars/jquery-toast-plugin/1.3.2/demos/css/jquery.toast.css">
</head>
<body style="padding-top: 150px">
<div class="container">
    <div class="row">
        <strong>医师:</strong>
        <h1 style="text-align: center" class="username">${user}</h1>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h2 style="color: red; text-align: center">群聊</h2>
            <div id="manyMessage" style="height: 200px; width: 100%; overflow: auto; border: 2px black solid;">
                <table class="table table-hover">
                    <tbody>
                    </tbody>
                </table>
            </div>
            <input type="text" class="form-control">
            <button class="btn-success" id="btn1">群发</button>
        </div>
        <div class="col-md-6">
            <h2 style="color: violet; text-align: center">私聊</h2>
            <div id="oneMessage" style="height: 200px; width: 100%; overflow: auto; border: 2px black solid;">
                <table class="table table-hover">
                    <tbody>
                    </tbody>
                </table>
            </div>
            <select class="form-control" id="inputGroupSelect01">
                <option selected>选择患者...</option>
            </select>
            <input type="text" class="form-control">
            <button class="btn-info" id="btn2">单发</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <h3 class="count">
                当前在线人数:<span style="color: blue"></span>
            </h3>
        </div>
    </div>
</div>
<script type="text/javascript" src="/webjars/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/3.3.5/js/bootstrap.js"></script>
<script type="text/javascript" src="/webjars/jquery-toast-plugin/1.3.2/demos/js/jquery.toast.js"></script>
<script language=javascript>
    $(function () {
        var websocket;
        if ('WebSocket' in window) {
            console.log("WebSocket");
            websocket = new WebSocket("ws://localhost:8080/echo");
        } else if ('MozWebSocket' in window) {
            console.log("MozWebSocket");
            websocket = new MozWebSocket("ws://echo");
        } else {
            console.log("SockJS");
            websocket = new SockJS("http://127.0.0.1:8080/sockjs/echo");
        }
        websocket.onopen = function (evnt) {
            console.log("链接服务器成功!", evnt.data);
        };

        var username = $(".username").text();//当前用户
        var send;//发送消息
        var receive;//接收信息
        var receiveName;//对方姓名

        function sendOnline(count, users) {
            var object = {
                peos: users,
                msg: "上线",
                type: 1,
                sendUser: username,
                count: count
            };
            var js = JSON.stringify(object);
            websocket.send(js);
        }

        websocket.onmessage = function (evnt) {
            console.log('收到消息:', evnt.data);
            var json = JSON.parse(evnt.data);
            $(".count span").text(json.count);
            if (json.hasOwnProperty('users')) {
                var users = json.users;
                var s = '';
                for (var i = 0; i < users.length; i++) {
                    s += "_" + users[i];
                    if (users[i] != username) {
                        $("#inputGroupSelect01").append('<option value="' + users[i] + '">' + users[i] + '</option>');
                    }
                }
                //上线就将自己的信息共享出去
                sendOnline(json.count, s);
            } else {
                if (json.hasOwnProperty('peos')) {
                    $("#inputGroupSelect01").empty();
                    //将当前在线人数遍历出来
                    var peos = json.peos;
                    for (var i = 0; i < peos.length; i++) {
                        if (peos[i] != username) {
                            $("#inputGroupSelect01").append('<option value="' + peos[i] + '">' + peos[i] + '</option>');
                        }
                    }
                }
                //打印消息
                receive = json.msg;
                receiveName = json.sendUser;
                if (json.type == '1') {
                    //此处消息为对方上线后,修改总人数
                    if (json.count != '') {
                        $(".count span").text(json.count);
                    }
                    $("#manyMessage>table>tbody").append($("<tr></tr>").append($("<td></td>").append(receiveName + ":&nbsp;&nbsp;&nbsp;" + receive)));
                    toast(json.sendUser, json.msg, 'info');
                    //私聊记录显示
                } else {
                    $("#oneMessage>table>tbody").append($("<tr></tr>").append($("<td></td>").append(receiveName + ":&nbsp;&nbsp;&nbsp;" + receive)));
                    toast(json.sendUser, json.msg, 'info');
                }
            }
        };
        websocket.onerror = function (evnt) {
        };
        websocket.onclose = function (evnt) {
            alert("与服务器断开了链接!");
        }
        $('#btn2').bind('click', function () {
            if (websocket != null) {
                //根据勾选的人数确定是群聊还是单聊
                send = $(this).parent().find('input').val();
                //得到选择的用户
                var name = $("#inputGroupSelect01").find("option:selected").val();
                console.log('选中的用户', name);
                if (name === '选择患者...') {
                    toast('请选择一个用户', 'warning');
                } else {
                    var object = {
                        to: name,
                        msg: send,
                        type: 2,
                        sendUser: username
                    };
                    //将object转成json字符串发送给服务端
                    var json = JSON.stringify(object);
                    websocket.send(json);
                    //在群聊历史记录中显示
                    $("#oneMessage>table>tbody").append($("<tr></tr>").append($("<td></td>").append(username + ":&nbsp;&nbsp;&nbsp;" + send)));
                }
            } else {
                alert('未与服务器链接.');
            }
        });
        $('#btn1').bind('click', function () {
            if (websocket != null) {
                //根据勾选的人数确定是群聊还是单聊
                send = $(this).parent().parent().find('input').val();
                var object = {
                    msg: send,
                    type: 1,
                    sendUser: username
                };
                //将object转成json字符串发送给服务端
                var json = JSON.stringify(object);
                websocket.send(json);
                //在群聊历史记录中显示
                $("#manyMessage>table>tbody").append($("<tr></tr>").append($("<td></td>").append(username + ":&nbsp;&nbsp;&nbsp;" + send)));
            } else {
                alert('未与服务器链接.');
            }
        });
    })

    function toast(sendUser, text, icon) {
        $.toast({
            text: sendUser + ":" + text,
            heading: '新消息',
            icon: icon,
            showHideTransition: 'slide',
            allowToastClose: true,
            hideAfter: 3000,
            stack: 5,
            position: 'top-right',

            bgColor: '#444444',
            textColor: '#eeeeee',
            textAlign: 'left',
            loader: true,
            loaderBg: '#006eff'
        });
    }
</script>
</body>
</html>