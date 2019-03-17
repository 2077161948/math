<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>最新试卷</title>
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/index.css">
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
</head>

<body>
    <jsp:include page="../public/top.jsp" />
    <div class="layui-container main_bd" style="margin-top: 150px;">
        <div>
            <span>位置：</span>
            <span  lay-separator="|" id="nav">
                <a href="${path}/">首页</a>&nbsp;&nbsp;
                <a href="${path}/newexam" id="r" >最新试题</a>
            </span>
        </div>
        <table class="layui-table">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>试卷标题</th>
                    <th>发布日期</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${info.list}" var="x">
                    <tr>
                        <td>${x.id }</td>
                        <td>${x.filename}</td>
                        <td>
                            <fmt:formatDate value="${x.uploadtime}" type="date" dateStyle="default" />
                        </td>
                        <td>
                        <a href="${path}/ylan?id=${x.id }">查看及下载</a></td>
                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div id="pagebar4" class="text-center">
            <%--   <span>${info.pageNum}</span> --%>
            <ul class="pagination">
                <c:forEach items="${info.navigatepageNums}" var="x">
                    <li>
                        <a href="${path}/newexam?page=${x}">${x}</a>
                    </li>
                </c:forEach>
            </ul>
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
<script type="text/javascript" src="${path}/js/newexam.js"></script>
<script type="text/javascript" src="${path}/js/top.js"></script>

</html>