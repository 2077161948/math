<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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


</head>
<body>
<jsp:include page="../public/top.jsp"/>
    <div class="banner">
            <div class="layui-carousel" id="slider">
                <div carousel-item>
              
                <c:if test="${empty banner}">
            	<img alt="亿墨数学" src="${path}/img/index/banner.png">
                </c:if>
                <c:forEach items="${banner}" var="i">
                <div>
                <img alt="" src="${i.path}">
                </div>
                </c:forEach>
                </div>
            </div>
    </div>
    <div class="layui-container block">
            <div class="layui-row">
                <div class="layui-col-sm6 pub_block-l">
                    <div class="title layui-clear">
                        <h3 class="f-left">百强中学试卷</h3>
                        <a href="" class="more f-right">更多</a>
                    </div>
                    <ul class="exam_list">
                    <c:forEach items="${baiqiang}" var="i">
		               <li>
                            <a href="${path}/ylan?path=${i.filepath }" class="layui-clear">
                                <p class="f-left">
                                    <span  class="exam_name">${i.filename }</span>
                                </p>
                               
                                <p class="time f-right color-r"><fmt:formatDate value="${i.uploadtime}"/></p>
                            </a>
                        </li>
                    </c:forEach>
                      
                    </ul>
                </div>
                <div class="layui-col-sm6 pub_block-r">
                        <div class="title layui-clear">
                            <h3 class="f-left">高中组卷精选</h3>
                            <a href="" class="more f-right">更多</a>
                        </div>
                        <ul class="exam_list">
                        <c:forEach items="${gz}" var="i">
                        
                        <li>
                                <a href="${path}/ylan?path=${i.filepath }" class="layui-clear">
                                    <p class="f-left">
                                        <span class="exam_name">${i.trs}${i.time}</span>
                                    </p>
                                    <p class="count f-right color-g">共计<span class="color-r">${i.shool}</span>题</p>
                                </a>
                            </li>
                        </c:forEach>
                        </ul>
                </div>
            </div>
            <div class="small_banner">
                <a href="" class="todetails">查看详情</a>
            </div>
            <div class="layui-row block">
                <div class="layui-col-sm6 pub_block-l">
                    <div class="title layui-clear">
                        <h3 class="f-left">最新高中试卷</h3>
                        <a href="" class="more f-right">更多</a>
                    </div>
                    <ul class="exam_list">
                    <c:forEach items="${now}" var="i">
                    
                      <li>
                            <a href="${path}/ylan?path=${i.filepath }" class="layui-clear">
                                <p class="f-left">
                                    <span class="exam_name">${i.trs }</span>
                                </p>
                                <p class="time f-right color-r">${i.time}</p>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="layui-col-sm6 pub_block-r">
                        <div class="title layui-clear">
                            <h3 class="f-left">最新高中同步</h3>
                            <a href="" class="more f-right">更多</a>
                        </div>
                        <ul class="exam_list">
                        <c:forEach items="${tb }" var="i">
                 			<li>
                                <a href="${path}/ylan?path=${i.filepath }" class="layui-clear">
                                    <p class="f-left">
                                        <span class="exam_name">${i.trs}</span>
                                    </p>
                                    <p class="count f-right color-r">${i.time}</p>
                                </a>
                            </li>
                        </c:forEach>
                </ul>
            </div>
    </div>
    </div>
    <div class="footer" >
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
                <p class="text-center color-g">2018  蜀ICP备5971531号</p>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path}/layui/layui.js"></script>
<script type="text/javascript" src="${path}/js/index.js"></script>
<script type="text/javascript" src="${path}/js/top.js"></script>
</html>