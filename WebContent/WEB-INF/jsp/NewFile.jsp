<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="page-header navbar navbar-fixed-top">
    <div class="page-header-inner">
        <div class="page-logo">
            <a href="<c:url value="/"/>"><img
                src="<c:url value="/img/logo.png"/>" style="height: 14px" alt="logo"
                class="logo-default" /></a>
            <div class="menu-toggler sidebar-toggler hide"></div>
        </div>
        <a href="javascript:;" class="menu-toggler responsive-toggler"
            data-toggle="collapse" data-target=".navbar-collapse"></a>
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown dropdown-alert"><a href="#"
                    class="dropdown-toggle" data-toggle="dropdown"
                    data-hover="dropdown" data-close-others="true"> <span
                        class="badge pull-left"></span><label class="hidden-sm">报警</label><i
                        class="fa fa-bell"></i>
                </a>
                    <ul class="dropdown-menu">
                    </ul></li>
                <li class="dropdown dropdown-user"><a href="#"
                    class="dropdown-toggle" data-toggle="dropdown"
                    data-hover="dropdown" data-close-others="true"> <span
                        class="username username-hide-on-mobile">你好，${sessionScope.username}</span>
                        <i class="fa fa-angle-down"></i>
                </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:;" id="updatePass"><i
                                class="icon-lock"></i>修改密码</a></li>
                        <li><a href="<c:url value="/logout"/> "><i
                                class="icon-key"></i>退出登录</a></li>
                    </ul></li>
            </ul>
        </div>
    </div>
</div>
 
<div class="clearfix"></div>
<script>
    //toastr.sos(num1)
</script>
<script type="text/javascript"
    src="http://cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
    src="http://cdn.bootcss.com/sockjs-client/1.1.1/sockjs.js"></script>
<script type="text/javascript">
    function wsPath() {
        return "/"
    }
    wsPath = wsPath();
    var websocket = null;
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://" + wsPath + "/websocket/socketServer");
    } else if ('MozWebSocket' in window) {
        websocket = new MozWebSocket("ws://" + wsPath
                + "/bison/websocket/socketServer");
    } else {
        websocket = new SockJS("http://" + wsPath
                + "/bison/sockjs/socketServer");
    }
    websocket.onmessage = onMessage;
    websocket.onope = onOpen;
    websocket.onerror = onError;
    websocket.onclose = onClose;
 
    function onOpen() {
    }
 
    function onMessage(evt) {
        var $uncheckedAlertMenuBtn = $("a.dropdown-toggle", $uncheckedAlertMenu);
        var $uncheckedAlertBadge = $("span.badge", $uncheckedAlertMenuBtn);
        var $uncheckedAlertMenu = $('li.dropdown-alert');
        var $uncheckedAlertList = $('ul', $uncheckedAlertMenu);
        var a = $uncheckedAlertBadge.html();
        $uncheckedAlertBadge.html(Number(a) + 1);
        //判断报警类型  如果是位置偏移，place+1
        if (evt.data == "1") {
            var count;
            var a = $("#number").html();
            if (a == null) {
                count = 1;
                $uncheckedAlertList
                        .prepend('<li class="place-alert"><a  href="alert?menuId=274"> <font color="red" id="place-alert">'
                                + "位置报警(<font id ='number'>"
                                + count
                                + "</font>)" + '</font></a></li>');
            } else {
                count = Number(a) + 1;
                $("#place-alert").html(
                        "位置偏移(<font id='number'>" + count + "</font>)");
            }
        }
        if (evt.data == "0") {
            var count;
            var a = $("#snum").html();
            if (a == null) {
                count = 1;
                $uncheckedAlertList
                        .prepend('<li class="sos-alert"> <a  href="alert?menuId=274"><font color="red" id="sos-alert">'
                                + "SOS报警(<font id='snum'>"
                                + count
                                + ")</font>"
                                + '</font></a></li>');
            } else {
                count = Number(a) + 1;
                $("#sos-alert").html(
                        "SOS报警(<font id='snum'>" + count + "</font>)");
            }
        }
    }
    
    function onError() {
        websocket.close();
    }
    
    function onClose() {
    }
    window.close = function() {
        websocket.onclose();
    }
</script>
