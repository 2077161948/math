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
    <title>首页</title>
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/index.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
    <script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
    <script src="${path}/js/public.js"></script>

</head>

<body>
    <div class="header layui-hide-xs">
        <div class="tops">
            <div class="layui-container">
                <div class="layui-row">
                    <a href="${path}/" class="f-left toindex"><i class="layui-icon layui-icon-home" style="font-size:14px;margin-right:.5rem"></i>乙墨数学官方网站</a>
                    <ul class="option_list f-right">
                        <li>
                            <c:choose>
                                <c:when test="${Teacher!=null}">
                                    <a href="${path }/adminTeacher">个人中心</a>&nbsp; |
                                    <a href="${path }/login_out">登出</a>&nbsp; | 
                                    <c:if test="${Teacher.postone!=null }">
                                     <a href="${path }/Admin/index">管理员控制台</a>
                                    </c:if>
                                </c:when>
                                <c:when test="${Student!=null}">
                                    <a href="${path }/login_out">登出</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${path }/login">登录</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li>|</li>
                        <li>
                            <a href="${path }/help">帮助中心</a>
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
                    <div class="logo f-left">
                        <img src="${path}/img/index/logo.png" alt="乙墨教学" title="乙墨教学">
                    </div>
                        <div class="head_nav f-right">
                            <div class="serach f-right">
                                <input id='wb' type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                                <a id="sc" class="layui-icon layui-icon-search ser" href="javascript:;"></a>
                            </div>
                            <ul class="f-right">
                                <!-- <li class="project">
                                <span class="dropdown">高中试题</span>
                                <i class="layui-icon layui-icon-triangle-d"></i>
                            </li> -->
                                <li><a id="index" href="${path}/" class="nav-on">首页</a></li>
                                <li><a id="newexam" href="${path}/newexam">最新试题</a></li>
                                <li><a id="combination" href="${path}/combination">智能组卷</a></li>
                                <li><a id="handle" href="${path}/handle">手动组卷</a></li>
                            </ul>
                        </div>
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
                <a href="${path}/index">首页</a>
            </li>
            <li>
                <a href="${path}/newexam">最新试题</a>
            </li>
            <li>
                <a href="${path}/combination">智能组卷</a>  
            </li>
            <li>
                <a href="${path}/handal">手动组卷</a>
            </li>
             <c:choose>
             <c:when test="${Teacher!=null}">
             <li>
             <a href="${path }/login_out">登出</a>
             </li>
             </c:when>
             <c:when test="${Student!=null}">
             <li>
             <a href="${path }/login_out">登出</a>
             </li>
             </c:when>
             <c:otherwise>
             <li>
              <a href="${path }/login">登录</a>
             </li>
              </c:otherwise>
              </c:choose>
        </ul>
    </div>
</body>

<script type="text/javascript">
$(function() {
    $("#sc").click(function() {
        var wb = $("#wb").val();
        var t = $(this).attr("src");
        $(this).attr("href", "${path}/doc/eq?eq=" + wb);
        $('a').trigger('click');
    })
})
</script>

</html>