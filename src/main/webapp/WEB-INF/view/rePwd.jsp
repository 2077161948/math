<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改密码</title>
    <link rel="stylesheet" href="${path }/layui/css/layui.css">
    <link rel="stylesheet" href="${path }/css/public.css">
    <link rel="stylesheet" href="${path }/css/login.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path }/img/index/shorticon.png">
    <style type="text/css">
    #forget a {
        font-size: 16px
    }

    .nextauto {
        font-size: 16px;
    }

    .content {
        width: 100%;
        height: 624px;
        background: url(img/repwdbg.png);
        background-repeat: no-repeat;
        background-size: 100% 100%;
        padding-top: 70px;
        margin-top: 143px;
    }

    .main {
        width: 1000px;
        height: 430px;
        margin: 0 auto
    }

    .title {
        border: 1px solid #8d8d8d;
        width: 180px;
        position: relative;
        border-bottom: 0;
    }

    .title::after {
        content: "";
        display: block;
        position: absolute;
        width: 180px;
        left: 0;
        bottom: -1px;
        height: 1px;
        background-color: #fff
    }

    .title>div {
        height: 4px;
        background-color: #00c9b8;
    }

    .title p {
        background-color: #fff;
        height: 25px;
        line-height: 25px;
        text-align: center;
    }

    .details {
        width: 100%;
        height: 400px;
        background-color: #fff;
        border: 1px solid #8d8d8d;
        padding-top: 80px;
    }

    .details ul {
        width: 864px;
        height: 43px;
        margin: 0 auto
    }

    .details ul li {
        float: left;
        width: 288px;
        height: 42px;
        line-height: 40px;
        text-align: center;
        color: #06b6a7;
        position: relative;
        background-color: #98fcf4;
    }

    .details ul li:after {
        position: absolute;
        right: 0;
        top: 0;
        content: url(img/icon2.png);
        width: 33px;
        height: 44px;
        display: block;
    }

    .details ul li.curr {
        background-color: #39dfd1;
        color: #fff;
    }

    .details ul li.curr:after {
        content: url(img/icon1.png);
        width: 33px;
        display: block;
        height: 44px;
    }

    .details ul li.prev:after {
        content: url(img/icon3.png);
        width: 33px;
        display: block;
        height: 44px;
    }

    .details ul li:last-child:after {
        content: ""
    }

    .clear:after {
        content: "";
        clear: both;
        display: block;
    }

    .tabType {
        width: 864px;
        padding-left: 200px;
        padding-top: 60px;
        margin: 0 auto
    }

    .tabType>div {
        display: none;
        margin-bottom: 40px
    }

    .tabType>div input {
        padding: 12px 0 12px 12px;
        display: inline-block;
        width: 320px;
        border: 1px solid #c9c9c9;
        margin-bottom: 10px
    }

    .tabType .curr {
        display: block;
    }
    </style>
</head>

<body>
    <div class="header">
        <div class="tops">
            <div class="layui-container">
                <div class="layui-row">
                    <a href="index.html" class="f-left toindex"><i class="layui-icon layui-icon-home" style="font-size:14px;margin-right:.5rem"></i>乙墨数学官方网站</a>
                    <ul class="option_list f-right">
                        <li>
                            <a href="${path}/login">登陆</a>
                        </li>
                        <li>|</li>
                        <li>
                            <a href="${path}/help">帮助中心</a>
                        </li>
                        <li>|</li>
                        <li>咨询热线：00-0000</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="head_main">
            <div class="layui-container">
                <div class="layui-row">
                    <div class="logo f-left"><img src="img/index/logo.png" alt="乙墨教学" title="乙墨教学"></div>
                        <span class="f-left split">|</span>
                        <h3 class="welcome f-left">密码重置</h3>
                        <a href="${path}/index" class="tohome">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-container block content" id="main">
            <div class="main">
                <div class="title">
                    <div></div>
                    <p>邮箱找回</p>
                </div>
                <div class="details">
                    <ul class="clear">
                        <li class="curr">1 填写账户信息</li>
                        <li>2 填写验证码</li>
                        <li>3 重置密码</li>
                    </ul>
                    <div class="tabType">
                        <div class="curr"><input type="text" placeholder="请输入邮箱" id="uname"></div>
                        <div>
                        <input id="yam" type="text" placeholder="请输入验证码">
                        
                        </div>
                        <div><input id="pwd" type="text" placeholder="请输入密码"><br />
                            <input type="text" placeholder="请再次输入"></div>
                        <button class="layui-btn" id="next">下一步</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="layui-container">
                <div class="layui-row">
                    <ul class="foot_list layui-col-sm2">
                        <li>
                            <a href="">最新试题</a>
                        </li>
                        <li>
                            <a href="">帮助中心</a>
                        </li>
                    </ul>
                    <div class="layui-col-sm6 web_desc">
                        <h3>网站介绍</h3>
                        <p>乙墨数学网，一个依托百万量级的高中在线题库创建的组卷系统，试卷涵盖全国各地高中学科教材版本，试题质量高、更新快，是深受广大高中教师喜爱的在线组卷平台</p>
                    </div>
                    <div class="layui-col-sm4 call">
                        <p class="hot_time">客服热线（工作日：9:00—18:00）</p>
                        <p class="hot_line">400-0000-000</p>
                        <button class="ask">
                            <i style="font-size:16px" class="layui-icon layui-icon-login-qq"></i>在线咨询
                        </button>
                    </div>
                </div>
                <div class="layui-row copy">
                    <p class="text-center color-g">
                        电话：000-0000000 客服QQ：00000000 传真：0000000000 邮箱：abc@yimo.com 地址：成都市金牛区胡同街电子大厦15F07室
                    </p>
                    <p class="text-center color-g">2018 蜀ICP备5971531号</p>
                </div>
            </div>
        </div>
</body>

</html>
<script type="text/javascript" src="${path }/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path }/layui/layui.js"></script>
<script type="text/javascript">



var email="";
var zt = 0;
layui.use('layer', function(){})
$("#next").click(function() {
    if (zt < 2) {
        var uname = $("#uname").val()
        if(!(emailReg(uname))){
            layer.msg('用户名不符合',{icon: 2});
            return false;
        }
        if(zt==0){
            $.ajax({
            	type:"POST",
            	url:"${path}/student/email/",
            	data:"email="+$("#uname").val(),
            	success:function(result){
            		if(result.status==200){
            			alert("邮件发送成功");
            			email=result.msg;
            		}
            	}
            })	
        }
        zt++
        var prev = zt - 1
        $(".details li").eq(prev).addClass("prev")
        if (prev == 1) {
            $(".details li").eq(0).removeClass("prev")
            var yam=$("#yam").val();
            if(yam!=email){
            	alert("验证码不正确")
            	zt--;
            	return false;
            }
        }
        $(".details li").removeClass("curr")
        $(".details li").eq(zt).addClass("curr")
        $(".tabType > div").removeClass("curr")
        $(".tabType > div").eq(zt).addClass("curr")
        if (zt == 2) {
            $(this).text("提交")
            $(this).click(function(){
                $.ajax({
                	type:"POST",
                	url:"${path}/student/change",
                	data:"studentid="+$("#uname").val()+"&studentpwd="+$("#pwd").val(),
                	success:function(result){
                		if(result.status==200){
                		alert("修改成功")
                		$("#main").empty();
                		}
                	}
                })
            })
        }
    }
})

function emailReg(email){
    var reg = /^\w+\w*@\w+\.(com|cn|net)$/;
    return reg.test(email);
}
</script>