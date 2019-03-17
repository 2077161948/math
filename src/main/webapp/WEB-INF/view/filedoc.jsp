<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${path}/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<script src="${path}/js/jquery.js"></script>
<script src="${path}/layui/layui.js"></script>
<script type="text/javascript" src="${path}/js/jquery.redirect.js"></script>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css"/>
</head>
<body>
<div style="float: left;">
<p><span>baiqiang</span>:百强中学试卷</p>
<br/>
<p><span>gz</span>:高中组卷精选</p>
<br/>
<p><span>now</span>:最新高中试卷</p>
<br/>
<p><span>tb</span>:最新高中同步</p>
<br/>
</div>
<div  style="margin: 20px 30%;">
<form action="${path}/Admin/filedoc" class="form-inline" method="get" id="eq">
<input type="text" name="name" class="form-control" />
<button type="submit" class="btn btn-primary" >搜索</button>
</form>
</div>
<table class="table table-bordered" >
<thead>
<tr>
<td>试卷id</td>
<td>文章名字</td>
<td>试卷类型</td>
<td>可选操作</td>
</tr>
</thead>
<tbody>
<c:forEach items="${list.list}" var="x">
<tr>
<td>${x.id}</td>
<td>${x.filename}</td>
<td>${x.uploadinfo}</td>
<td>
<button name="upd" class="btn btn-warning" data_id="${x.id}" >修改</button>
&nbsp;&nbsp;
<button class="btn btn-danger" name="del" data_id="${x.id}" >删除</button>
</td>
</tr>
</c:forEach>
</tbody>
</table>
<div class="pagination center-block" >
<c:forEach items="${list.navigatepageNums}" var="x">
<a class="sub" href="" data_id="${x}">${x}</a>
</c:forEach>
</div>
<script type="text/javascript" >
layui.use(['layer', 'form'], function(){
	$("button[name='upd']").on('click',function(){
		$.ajax({
			type:'GET',
			url:'${path}/Admin/filedoc/'+$(this).attr("data_id"),
			success:function(jsonstr){
				var result=JSON.parse(jsonstr);
				$("#ids").val(result.id);
				$("#filename").val(result.filename)
				$("#uploadinfo").val(result.uploadinfo===undefined?"未定义":result.uploadinfo);
				alert(1); 
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
		})
	});
	$("button[name='del']").on('click',function(){
		if(!confirm("确定删除吗？")){
			return false;
		}
	$.ajax({
		type:'DELETE',
		url:'${path}/Admin/filedoc',
		data:'ids='+$("ids").attr('data_id'),
		success:function(jsonstr){
			var result=JSON.parse(jsonstr);
			alert(result.status);
		}
	})
	});
	
	$(".update").on('click',function(){
		var s= $("#eq").serialize()+"&page="+$(this).attr("data_id");
		$.redirect("${path}/Admin/filedoc?"+s,{},"GET");
	});
	
});
</script>

<form style="display: none;" method="post" class="layui-form" action="${path}/Admin/filedoc" id="update" >
      <input type="hidden" name="id" id="ids" >
  <div class="layui-form-item">
    <label class="layui-form-label">文件名</label>
    <div class="layui-input-inline">
      <input type="text" name="filename"  id="filename" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">试卷类型</label>
    <div class="layui-input-inline">
      <input type="text" name="uploadinfo" id="uploadinfo" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn">立即修改</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</body>
</html>