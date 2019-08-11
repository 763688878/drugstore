<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>支付宝电脑网站支付</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>

<body>
<div class="container">
<div id="main">
    <%--<div id="tabhead" class="tab-head">--%>
        <%--<h2 id="tab1" style="font-size: 20px; margin-left: 600px; width: 200px; font-size: 80px; color: #87CBE9;"--%>
            <%--class="selected" name="tab">付 款</h2>--%>
    <%--</div>--%>
    <form style="margin-top: 200px; " name=alipayment action=alipay.trade.page.pay.jsp method=post target="_blank">
        <div id="body1" class="show" name="divcontent">
            <dl class="content">
                <dt style="font-size: 30px;width: 200px;">商户订单号 ：</dt>
                <dd>
                    <input id="WIDout_trade_no" name="WIDout_trade_no" readonly/>
                </dd>
                <hr class="one_line">
                <dt style="font-size: 30px;width: 200px;" >订单名称 ：</dt>
                <dd>
                    <input id="WIDsubject" name="WIDsubject" readonly/>
                </dd>
                <hr class="one_line">
                <dt style="font-size: 30px; width: 200px;">付款金额 ：</dt>
                <dd>
                    <input id="WIDtotal_amount" name="WIDtotal_amount" />
                </dd>
                <hr class="one_line">
                <!--<dt  style="font-size: 30px; width: 200px;">商品描述：</dt>-->
                <dd style="display: none">
                    <input id="WIDbody" name="WIDbody"/>
                </dd>
                <!--<hr class="one_line">-->
                <dt></dt>
                <dd id="btn-dd">
							<span class="new-btn-login-sp">
							<button style="font-size: 30px;" class="btn btn-success" type="submit"
                                    style="text-align: center;">付 款</button>
						</span> <span class="note-help"></span>
                </dd>
            </dl>
        </div>
    </form>
</div>
</div>
</body>
<script language="javascript">
    var tabs = document.getElementsByName('tab');
    var contents = document.getElementsByName('divcontent');

    (function changeTab(tab) {
        for (var i = 0, len = tabs.length; i < len; i++) {
            tabs[i].onmouseover = showTab;
        }
    })();

    function showTab() {
        for (var i = 0, len = tabs.length; i < len; i++) {
            if (tabs[i] === this) {
                tabs[i].className = 'selected';
                contents[i].className = 'show';
            } else {
                tabs[i].className = '';
                contents[i].className = 'tab-content';
            }
        }
    }

    function GetDateNow() {
        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        document.getElementById("WIDout_trade_no").value = sNow;
        document.getElementById("WIDsubject").value = "药必达支付";
        document.getElementById("WIDtotal_amount").value = "1";
    }

    GetDateNow();
</script>

</html>