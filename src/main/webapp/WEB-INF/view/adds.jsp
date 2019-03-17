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
<title>试题入库</title>
<script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path}/MathJax-master/MathJax.js"></script>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css">
   <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
</head>
<body>
<style type="text/css">

 img{
      		vertical-align: middle !important;
   			}

form{
	display: block;
	width: 1200px;
	margin: 0 auto;
	margin-bottom: 30px;
}
p,span,div{
	word-break:break-all;
}
select{
	display: inline-block;
	margin-right: 10px;
	padding: 3px 6px;
	text-align: center;
}
.choose{
	margin-bottom: 30px;
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
<h3 style="text-align: center;">解析结果</h3>
<table class="table table-hover" id='data'>
<c:forEach 	items="${list.map.list}" var="i">
<tr>
<td>
<form action="" method="post" onsubmit="return false;" class="choose" style="border: 3px solid red; padding: 10px">
	
		<p>请选择该题所对应的知识点及章节</p>
		<div style="width: 33%">
				<select name="zsd" class="form-control">
			<c:forEach items="${zsd}" var="w">
				<option value="${w.id}">${w.nodename}</option>
			</c:forEach>
				</select>
		
		</div>
		<div style="width: 33%">
				<select name="questiontypeId" class="form-control">
			<c:forEach items="${types}" var="x" >
				<option value="${x.id}">${x.name}</option>
			</c:forEach>
		</select>
		</div>
		<div  style="width: 33%">
				<select name="zj" class="form-control">
			<c:forEach items="${zj}" var="w">
				<option value="${w.id}">${w.nodename}</option>
			</c:forEach>
		</select>
		</div>
		<button class=" ok btn btn-primary">提交</button>
	<input type="hidden"  name="filedocId" value="${i.filedocId}"/>
	<textarea rows="1" cols="1" style="display:none; " name="body"> ${i.body}</textarea>
	<textarea rows="1" cols="1" style="display:none; " name="analysis"> ${i.analysis}</textarea>
	${i.body}
	${i.analysis}
	<hr/>
</form>
</td>
</tr>
</c:forEach>
</table>

<a class="btn btn-danger"  href="${path}/adminTeacher">退出选择</a>
</body>

<script type="text/javascript">



window.onload = function(){
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
    
    $.each($("#data p"), function(k, v) {
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
    
$(".ok").on("click",function(){
	var form=$(this).parent("form");
	console.log(form);
	var data=form.serialize();
	console.log(data)
	$.ajax({
		type:"POST",
		data:data,
		url:"${path}/aproblem/add",
		success:function(result){
			if(result.status==200){
				form.remove();
				alert(result.msg)
			}
		}
	})
})
    }
</script>
</html>