<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path}/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
<!--         <div class="layui-logo">layui 后台布局</div>
        头部区域（可配合layui已有的水平导航）
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">权限管理</a></li>
            <li class="layui-nav-item"><a href="">接口管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul> -->
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" >
<!--                 <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">网站基本信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">浏览量</a></dd>
                        <dd><a href="javascript:;">恶意ip</a></dd>
                        <dd><a href="javascript:;">数据库</a></dd>
                        <dd><a href="javascript:;">服务器</a></dd>
                        <dd><a href="javascript:;">登录日志</a></dd>
                        <dd><a href="javascript:;">敏感操作</a></dd>
                    </dl>
                </li> -->
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">基本信息管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${path}/Admin/user">老师信息管理</a></dd>
                        <dd><a href="${path}/Admin/aproblem">试卷信息管理</a></dd>
                        <dd><a href="${path}/Admin/filedoc">试卷信息管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" id="main">
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com
    </div>
</div>
<script src="${path}/layui/layui.js"></script>
<script src="${path}/js/jquery.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        $("a").click(function () {
            event.preventDefault();
           if ($(this).parent().is('dd')){
               let path=$(this).attr("href");
               $("#main").empty();
               $("#main").append($("<object type='text/html' data='"+path+"' width='100%' height='100%'></object>"))
           }
        })
    });
</script>
</body>
</html>