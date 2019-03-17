<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷下载</title>
<link rel="stylesheet" href="${path}/layui/css/layui.css">
 <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
 <script type="text/javascript" src="${path}/MathJax-master/MathJax.js"></script>
</head>
<body>
 <style type="text/css">
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
<div id="word" style="width: 50%;margin:0 auto">
<c:forEach items="${list}" var="x">
${x.body}
</c:forEach>
</div>
<div id="box"></div>
<form action="${path}/File/download">
<c:forEach items="${list}" var="x">
<input type="hidden" value="${x.id}" name="id"/>
</c:forEach>
<button id="product_ok" type="submit" class="layui-btn">下载</button>
</form>
</body>
<script type="text/javascript" src="${path}/js/jquery.js"></script>
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
    
    $.each($("#word p"), function(k, v) {
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
    var t=setTimeout(MathJax.Hub.Queue(['Typeset', MathJax.Hub]),5000);
})
</script>
</html>