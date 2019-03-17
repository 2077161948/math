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
    <title>注册</title>
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/login.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
</head>
<body>
    <div class="header layui-hide-xs"> 
        <div class="tops">
            <div class="layui-container">
                <div class="layui-row">
                    <a href="${path}/" class="f-left toindex"><i class="layui-icon layui-icon-home" style="font-size:14px;margin-right:.5rem"></i>乙墨数学官方网站</a>
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
                    <div class="logo f-left"><img src="${path}/img/index/logo.png" alt="乙墨教学" title="乙墨教学"></div>
                    <span class="f-left split">|</span>
                    <h3 class="welcome f-left">欢迎注册</h3>
                    <a href="${path}/" class="tohome">返回首页</a>
                </div>
            </div>
        </div>
    </div>
    <div class="xs_header layui-show-xs-block layui-hide-sm">
        <img src="img/index/logo.png" alt="乙墨教学" class="xs_logo">
        <button class="layui-icon layui-icon-spread-left" id="drop"></button>
    </div>
    <div id="xs_option">
        <ul>
            <li>
                <a href="index.html">首页</a>
            </li>
            <li>
                <a href="newexam.html">最新试题</a>
            </li>
            <li>
                <a href="combination.html">智能组卷</a>  
            </li>
            <li>
                <a href="handal.html">手动组卷</a>  
            </li>
            <li>
                <a href="login.html">登录</a>
            </li>
        </ul>
    </div>
    <div class="layui-container log_bd" style="margin-top: 150px">
        <div class="layui-row">
            <div class="layui-col-sm8">
                <div class="layui-clear bggroup">
                    <img src="${path}/img/login/bg1.png" alt="">
                    <img src="${path}/img/login/bg2.png" alt="">
                    <img src="${path}/img/login/bg3.png" alt="">
                    <img src="${path}/img/login/bg4.png" alt="">
                </div>
                <p class="login_desc">输入邮箱即可轻松注册使用</p>
                <p class="login_desc">乙墨数学是为老师和学生打造的专属在线教育平台</p>
                <p class="login_desc">我们只提供科学、方便、有用的学习产品!</p>
            </div>
            <div class="layui-col-sm4 log_block">
            <form action="${path}/student/add" onsubmit="add()" method="post">
            <h3 class="title">账号注册</h3>
                <input type="text" name="studentid" id="studentid" required  lay-verify="username" placeholder="邮箱账号，便于您以后重置密码" autocomplete="off" class="layui-input">
                <input type="password" name="studentpwd" id="studentpwd" required  lay-verify="pass" placeholder="登录密码 ，6到12位字母加数字" autocomplete="off" class="layui-input">
                <input type="password" id="pwds" required  lay-verify="pass" placeholder="再次输入密码" autocomplete="off" class="layui-input">
                	<p style="text-align: center; color: red;">${msg.msg}</p>
				<button class="layui-btn layui-btn-fluid login_btn" id="register">注册</button>
            </form>
   </div>
        </div>
    </div>
   <div class="footer layui-hide-xs">
        <div class="layui-container">
            <div class="layui-row">
                <ul class="foot_list layui-col-sm2">
                    <li>
                        <a href="newexam.html">最新试题</a>
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
                <p class="text-center color-g">2018  蜀ICP备5971531号</p>
            </div>
        </div>
    </div>
  <div class="xs_footer layui-hide-sm">
        <p class="text-center">
            电话：000-0000000 客服QQ：00000000
        </p>
        <p class="text-center">
            传真：0000000000 邮箱：abc@yimo.com
        </p>
        <p class="text-center">地址：成都市金牛区胡同街电子大厦15F07室2018 蜀ICP备5971531号</p>
    </div>
</body>
<script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path}/layui/layui.js"></script>
<script type="text/javascript" src="${path}/js/public.js"></script>
<script type="text/javascript" src="${path}/js/login.js"></script>
<script type="text/javascript">
$(function(){
	function add(){
		pwd = $('#studentpwd').val();
		pwds = $('#pwds').val();
		if(pwd!==pwds){
			alert("两次密码不一致!")
			return false;
		}
	}
})
</script>
</html>