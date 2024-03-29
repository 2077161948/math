<!DOCTYPE html>
<html lang="en">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>帮助中心</title>
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_971310_tliwneydojc.css">
    
    <style type="text/css">
    .navPosition {
        margin-top: 170px;
        margin-bottom: 50px;
    }

    .clear:after {
        display: block;
        clear: both;
        content: ""
    }

    .left {
        float: left;
    }

    .cjwt {
        padding-left: 40px;
        height: 700px;
    }

    .leftNav {
        padding: 10px;
        width: 20%;
        height: 700px;
        border: 1px solid #ebebeb
    }

    .leftNav .layui-icon {
        font-size: 22px;
    }

    .leftNav>span {
        margin-left: 20px;
    }

    .leftNav li {
        position: relative;
        padding-top: 30px;
        padding-bottom: 6px;
        padding-left: 10%;
        cursor: pointer;
        border-bottom: 1px dashed #ebebeb
    }

    .leftNav li span {
        margin-right: 10px
    }

    .leftNav li span.layui-icon {
        color: #39dfd1;
        opacity: 0;
    }

    i.iconfont {
        font-size: 22px;
        margin-right: 14px
    }

    .leftNav li.curr span {
        opacity: 1;
        color: #39dfd1;
    }

    .leftNav li i {
        color: #d1d1d1;
    }

    .leftNav li.curr i {
        color: #484848;
    }
    .main{
        width: 79%;
        height: 700px;
        padding-top: 24px;
        margin-left: 1%;
        border: 1px solid #ebebeb
    }
    .main > div{
        display: none;
    }
    .main h1{
        margin-bottom: 56px;
        text-align: center;
        font-size: 18px;
        color: #626262;
    }
    .main img{
        display: block;
        width: 90%;
        margin: 0 auto;
        margin-bottom: 20px;
    }
    .main p {
        margin-bottom: 20px;
        padding-left: 20px;
        text-indent: 28px;
        line-height: 2em
    }
    </style>
</head>

<body>
<jsp:include page="../public/top.jsp"/>
                <!-- <div class="drop_area">
                <div class="choose_prj">
                    <div class="f-left">
                        <img src="img/index/project.png" alt="科目" title="科目">
                    </div>
                    <div class="f-right">
                        <h4>高中 ></h4>
                        <ul class="pro_list layui-clear">
                            <li class="f-left"><a href="">数学</a></li>
                        </ul>
                    </div>
                </div>
            </div> -->
        <div class="layui-container navPosition" style="margin-top: 150px" >
            位置：<a href="${path}/index">首页</a> > 帮助中心
        </div>
        <div class="layui-container cjwt clear">
            <div class="left leftNav">
                <span>常见问题</span>
                <ul>
                    <li class="curr"><span class="layui-icon">&#xe623;</span> <i class="iconfont" style="margin-left: -5px">&#xe601;</i>如何登陆</li>
                    <li><span class="layui-icon">&#xe623;</span><i class="iconfont">&#xe6e8;</i>用户权限</li>
                    <!-- <li><span class="layui-icon">&#xe623;</span><i class="iconfont">&#xe73f;</i>下载试卷</li> -->
                    <li><span class="layui-icon">&#xe623;</span><i class="iconfont">&#xe630;</i>公司信息</li>
                </ul>
            </div>
            <div class="left main">
                <div>
                    <h1>如何登陆</h1>
                    <div>
                        <p>在红色方框内输入您注册时的账号密码，并在下方选择您的角色，[注册的账号是您的邮箱地址，密码由6-12位数字字母混合组成]</p>
                        <img src="img/help1.png" alt="">
                        <h3 style="margin-left: 20px;margin-bottom: 10px;">找回密码</h3>
                        <p> 
                            忘记密码可以在登录页面右侧的“忘记密码”入口进入密码重置页面。
                            按照提示，填入邮箱，收取邮箱验证码以后，进行验证，重置密码。
                        </p>
                    </div>
                </div>
                <div>
                    <h1>用户权限</h1>
                    <h3 style="margin-left: 20px;margin-bottom: 10px;">教师</h3>
                    <p>经过认证的教师可以上传试卷，下载试卷</p>
                    <h3 style="margin-left: 20px;margin-bottom: 10px;">普通用户</h3>
                    <p>普通用户可以下载试卷,后续将开放在线试题，敬请期待</p>
                </div>
                <div>
                    <h1>公司信息</h1>
                    <p>本网站由</p>
                </div>
            </div>
        </div>
        <div class="footer" style="width: 100%">
            <div class="layui-container">
                <div class="layui-row">
                    <ul class="foot_list layui-col-sm2">
                        <li>
                            <a href="${path}/newexam">最新试题</a>
                        </li>
                        <li>
                            <a href="${path}/help">帮助中心</a>
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
<script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path}/layui/layui.js"></script>
<script type="text/javascript">
$(".main > div").eq(0).show()
$(".leftNav li").each(function(i, item) {
    $(this).click(function() {
        $(".leftNav li").removeClass("curr")
        $(this).addClass("curr")
        $(".main > div").hide()
        $(".main > div").eq(i).show()
    })
})
</script>