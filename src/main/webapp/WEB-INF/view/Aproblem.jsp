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
<link rel="stylesheet" href="${path}/css/bootstrap.min.css">
   <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
	<script src="${path}/js/jquery.js"></script>
	<script type="text/javascript" src="${path}/js/jquery.redirect.js"></script>
<script type="text/javascript" src="${path}/MathJax-master/MathJax.js"></script>

</head>

<body>
<style type="text/css">
 img{
      		vertical-align: middle !important;
   			}
   			
.MathJax_Display{
text-align: left; 
margin: 1em 0em;
 position: relative;
   display:inline !important;
   text-indent: 0; 
   max-width: none;
    max-height: none; 
    min-width: 0; 
    min-height: 0;
     width: auto;
}
</style>
<div class="container">
<form action="${path}/Admin/aproblem" id="que">
<h4>筛选条件</h4>
<div style="width: 25%; float: left;">
题型
<select class="form-control" name="questiontypeId">
<c:forEach items="${types}" var="r">
<option value="${r.id}">${r.name}</option>
</c:forEach>
</select>
</div>
<div style="width: 25%; float: left;">
章节
<select class="form-control" name="zj">
<c:forEach items="${zj}" var="z">
<option value="${z.id }">${z.nodename}</option>
</c:forEach>
</select>
</div>
知识点
<select class="form-control" style="width: 25%" name="zsd">
<c:forEach items="${zsd }" var="s">
<option value="${s.id }">${s.nodename }</option>
</c:forEach>
</select>
<br>
<button class="btn btn-success" type="submit" style="margin: 20px">开始筛选</button>
</form>
</div>
<table class="table table-bordered" >
<thead>
<tr>
<td>试题id</td>
<td>试题主体</td>
<td>试题选项</td>
<td>可选操作</td>
</tr>
</thead>
<tbody>
<c:forEach items="${list.list}" var="x">
<tr>
<td>${x.id}</td>
<td class="body">${x.body}</td>
<td>
<form>
<input  type="hidden" name="id" value="${x.id}"/>
<select class="form-control" name="questiontypeId">
<c:forEach items="${types}" var="r">
<c:if test="${r.id==x.questiontypeId}">
<option value="${r.id}" selected="selected">${r.name}</option>
</c:if>
<option value="${r.id}">${r.name}</option>
</c:forEach>
</select>
<br/>
<select class="form-control" name="zj">
<c:forEach items="${zj}" var="z">
<c:if test="${z.id==x.zj}" >
<option value="${z.id }"  selected="selected">${z.nodename}</option>
</c:if>
<option value="${z.id }">${z.nodename}</option>
</c:forEach>
</select>
<br/>
<select class="form-control" name="zsd">
<c:forEach items="${zsd }" var="s">
<c:if test="${s.id == x.zsd }">
<option value="${s.id }" selected="selected">${s.nodename }</option>
</c:if>
<option value="${s.id }">${s.nodename }</option>
</c:forEach>
</select>
</form>
</td>
<td>
<a class="btn btn-warning" name='upd'>修改</a> 
<a class="btn btn-danger"  name="del"  data_id="${x.id}">删除</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
<div class="center-block">
<ul class="pagination">
<c:forEach items="${list.navigatepageNums }" var="x">
<li><a name="page" page="${x}">${x}</a></li>
</c:forEach>
</ul>
</div>
<script type="text/javascript">
$(function(){
	MathJax.Hub.Config({
        extensions: ["tex2jax.js"],
        jax: ["input/TeX", "output/HTML-CSS"],
        tex2jax: {
            inlineMath: [
                ["\\(", "\\)"]
            ],
            displayMath: [
                ["$$", "$$"],
                ["\\[", "\\]"]
            ],
            processEscapes: true
        },
        "HTML-CSS": {
            linebreaks: {
                automatic: true
            },
            scale: 100,
            styles: {
              ".MathJax_Display": {
                "text-align": "left",
                "width" : "auto",
                "margin": "10px 0px 10px 0px !important",
                "background-color": "#f5f5f5 !important",
                "border-radius": "3px !important",
                border:  "1px solid #ccc !important",
                padding: "5px 5px 5px 5px !important"
              },
              ".MathJax": {
                "background-color": "#f5f5f5 !important",
                padding: "2px 2px 2px 2px !important"
              }
            }
        },
        "HTML-CSS": { availableFonts: ["TeX"] }
    });
    MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
    
    $.each($(".body p"), function(k, v) {
        let r = 0;
        let arr = $(v).text().split('');
        let dom = $(v)
        let str = '';
        let s = '';
        for (let i = 0; i < arr.length; i++) {
            if (arr[i] === '$') {
                r++;
            }
            if (r == 1) {
                s = s + arr[i];
                continue;

            } else if (r == 2) {
                r = 0;
                let result = math(s);
                str = str + result;
                s = '';
                continue;
            }
            str = str + arr[i];
        }

		$(this).html(str);
		str='';
		s='';
    });

    function math(st) {
    	let str=st.replace('$','');
    	if (str.startsWith('url')){
    		 let r=img(str);
    		 return r;
    	}
    	var s = '\\[\\ '+str+' \\]';
        return s;
    }

    function img(str) {
        let arr=str.split(';');

        let url=arr[0].split("=")[1];

        let w=arr[1].split("=")[1]/9625;

        let h=arr[2].split("=")[1]/9625;

        let img='<img src="'+url+'" height="'+h+'" width="'+w+'" />';
        return img;

     }

	
	
	
	
	
	
	$("a[name='upd']").on("click",function(){
		if(!confirm("确定修改？")){
			return false;
		}
		var from= $(this).parent().prev().find("form");
		from=$(from).serialize();
		$.ajax({
			type:"POST",
			url:'${path}/Admin/aproblem',
			data:from,
			success:function(result){
				alert(result.msg);
			}
		})
	});
	$("a[name='del']").on("click",function(){
		if(!confirm("确定删除？")){
			return false;
		}
		var ids= $(this).attr("data_id");
		$.ajax({
			type:"DELETE",
			url:"${path}/Admin/aproblem/"+ids,
			success:function(result){
				alert(result.msg);
			}
		})
	})
	$("a[name='page']").on('click',function(){
		var s=$(this).attr("page");		
		var d=$("que").serialize()+"&id="+s;
		$.redirect("${path}/Admin/aproblem?"+d,{},'GET');
	})
});
</script>
</body>
</html>
