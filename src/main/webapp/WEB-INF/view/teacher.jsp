<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path}/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<script src="${path}/js/jquery.redirect.js"></script>
<script src="${path}/layui/layui.js"></script>
<script src="${path}/js/jquery.js"></script>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 20px 40%;">
<form action="${path}/Admin/user" class="layui-form" >
  <div class="layui-form-item">
    <div class="layui-input-inline">
      <input type="text" style="width: 250px" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  </div>
  <button class="layui-btn" type="submit">收索</button>
</form>
</div>

<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>id</th>
      <th>姓名</th>
      <th>电话</th>
      <th>邮箱</th>
      <th>可选操作</th>
    </tr> 
  </thead>
  <tbody>
<c:forEach items="${list.list}" var="x" >
<tr>
<th>${x.id}</th>
<th>${x.name}</th>
<th>${x.phone}</th>
<th>${x.email}</th>
<th>
<a  class="layui-btn" method="delete" data_id='${x.id}'>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a  class="layui-btn" method="post" data_id='${x.id}' >修改</a>
</tr>
</c:forEach>

  </tbody>
</table>
<div class="pagination center-block">
<c:forEach items="${list.navigatepageNums}" var="x">
<a class="sub" href="">x</a>
</c:forEach>
</div>
</body>
<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form'], function(){
$("a").click(function(){
	let method=$(this).attr("method");
	if(method==="delete"){
		if(!confirm("确定删除吗？")){
			return false;
		}
		$.ajax({
			type:"delete",
			url:"${path}/Admin/user?id="+$(this).attr("data_id"),
			success:function(result){
				if(result.status==200){
						alert(result.msg);
				}
			}
			});
	}else if(method==="post"){
		$.ajax({
			type:"GET",
			url:"${path}/Admin/get/"+$(this).attr("data_id"),
			success:function(result){
				if(result.status==200){
					$("#id").attr("value",result.id);
					$("#name").attr("value",result.name);
					$("#email").attr("value",result.email);
					$("#phone").attr("value",result.phone);
					$("#postone").attr(result.postone==1?"checked":"")
				}else{
					return false;
				}
			}
			});
		 var layer = layui.layer;
		 layer.open({
			 skin: 'demo-class',
			 type: 1,
			  skin: 'layui-layer-molv', //默认皮肤
			  title: '修改',
			  area: '400px',
			  content: $('#update'),
			});     
			  
	}
});
});
</script> 
<form style="display: none;" class="layui-form" action="${path}/Admin/user" id="update" >
      <input type="hidden" name="name" id="id" >
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-inline">
      <input type="text" name="name" id="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">email</label>
    <div class="layui-input-inline">
      <input type="text" name="email" id="email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">电话</label>
    <div class="layui-input-inline">
      <input type="text" name="phone" id="phone" required  lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password" name="pwd" id="pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">超管</label>
    <div class="layui-input-inline">
      <input type="checkbox" name="postone"  id="postone" value="1" lay-skin="switch" >
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn">立即修改</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</html>