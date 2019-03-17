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
    <title>登录</title>
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/login.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
    <style type="text/css">
    #forget a {
        font-size: 16px
    }

    .nextauto {
        font-size: 16px;
    }
    </style>
</head>

<body>
    <div class="header layui-hide-xs">
        <div class="tops">
            <div class="layui-container">
                <div class="layui-row">
                    <a href="index" class="f-left toindex"><i class="layui-icon layui-icon-home" style="font-size:14px;margin-right:.5rem"></i>乙墨数学官方网站</a>
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
                        <h3 class="welcome f-left">欢迎登录</h3>
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
                <a href="combination.html">手动组卷</a>  
            </li>
            <li>
                <a href="login.html">登录</a>
            </li>
        </ul>
    </div>
        <div class="layui-container log_bd" style="margin-top:150px">
            <div class="layui-row">
                <div class="layui-col-sm8">
                    <div class="layui-clear bggroup">
                        <img src="${path}/img/login/bg1.png" alt="">
                        <img src="${path}/img/login/bg2.png" alt="">
                        <img src="${path}/img/login/bg3.png" alt="">
                        <img src="${path}/img/login/bg4.png" alt="">
                </div>
                        <p class="login_desc">输入邮箱即可轻松登录使用</p>
                        <p class="login_desc">乙墨数学是为老师和学生打造的专属在线教育平台</p>
                        <p class="login_desc">我们只提供科学、方便、有用的学习产品!</p>
                    </div>
                    <form action="${path}/student/login" method="post" id="logform">
                        <div class="layui-col-sm4 log_block">
                            <h3 class="title">账号登录</h3>
                            <input type="text" name="studentid" id="uname" required lay-verify="username" placeholder="登录邮箱" autocomplete="off" class="layui-input">
                            <input type="password" name="studentpwd" id="pwd" required lay-verify="pass" placeholder="登录密码" autocomplete="off" class="layui-input">
                            <div>
                                <input type="radio" name="user" id="stu" checked="checked"><label for="stu">学生</label>
                                <input type="radio" name="user" id="tea"><label for="tea">教师</label>
                            </div>
                            <div class="layui-clear">
                                <span class="f-right color-g" id="forget">
                    <a href="${path}/rePwd" style="margin-right: 10px">忘记密码？</a>
                    <a href="${path}/register">注册</a>
                    </span>
                            </div>
                            <p style="text-align: center; color: red;">${msg}</p>
                            <button class="layui-btn layui-btn-fluid login_btn" type="submit" id="login">登录</button>
                            <!-- <p class="other_methods">使用其他方式登录</p> -->
                            <!-- <div class="clearfix">
                        <div class="method_group f-left">
                        <button class="layui-icon layui-icon-login-wechat">
                        </button>
                        <button class="layui-icon layui-icon-login-qq"></button>
                        <button class="layui-icon layui-icon-login-weibo"></button>
                        </div>
                    </div> -->
                        </div>
                    </form>
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
            <script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
            <script type="text/javascript" src="${path}/layui/layui.js"></script>
            <script type="text/javascript" src="${path}/js/public.js"></script>
            <script type="text/javascript" src="${path}/js/login.js"></script>
            <script type="text/javascript">
            $('#login').click(function() {
                var uname = $('#uname').val();
                pwd = $('#pwd').val();
                if (!(emailReg(uname) || phoneReg(uname))) {
                    layer.msg('用户名不符合', { icon: 2 });
                    return false;
                }
                if (!pwdReg(pwd)) {
                    layer.msg('密码不符合', { icon: 2 });
                    return false;
                }

                let t = $("#tea").is(":checked");
                if (t) {
                    let url = "${path}/teacher/login"
                    $("#logform").attr("action", url)
                    $("#uname").attr("name", "email")
                    $("#pwd").attr("name", "pwd")
                } else {
                    let url = "${path}/student/login"
                    $("#logform").attr("action", url)
                    $("#uname").attr("name", "studentid")
                    $("#pwd").attr("name", "studentpwd")
                }
            })
            </script>
</body>

</html>