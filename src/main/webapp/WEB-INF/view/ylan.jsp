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
    <title>首页预览</title>
    <link rel="stylesheet" href="${path}/css/tree.css" />
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/handle.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
</head>
<body>
    <style type="text/css">
		.choose{
			margin-bottom: 20px;
		}
		.choose select{
			line-height: 30px;
			padding: 5px;
		}
		
		.choose option{
			border-left: none;
		}
        .layui-breadcrumb{
            visibility: visible;
        }
        .clear:after{
            content: "";
            display: block;
            clear: both;
        }
        .myChoose li{
            float: left;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            margin-right: 5px;
            cursor: pointer;
            border: 1px solid #ccc;
            margin-top: 10px
        }
        .myChoose li:hover{
            background-color: #39dfd1;
            color: #fff
        }
        .myChoose ul{
            padding-left: 3%;
            padding-bottom: 2%
        }
       .problem_list img {
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
<jsp:include page="../public/top.jsp"/>

    <div class="layui-container main_bd">
        <div>
            <span>位置：</span>
            <span class="layui-breadcrumb" lay-separator="|" id="nav" style="padding-top:10px;">
                <a href="${path}/index">首页</a>
                <span style="margin:0 10px;">|</span>
                <a href="${path}/handle">手动组卷</a>
            </span>
        </div>
        <div class="handle_block">
            <div class="layui-row handle_area">
                <div class="layui-col-sm3 trees">
                    <div class="tree_title">
                    	<h3>题目</h3>
                    </div>
                    <div class="centent">
                        <div class="myChoose">
                            <ul class="clear" >							
                           <c:forEach items="${jiexi.map.list}" varStatus="status" >
                           <li value="${status.index}" ><a href="#+${status.index+1}"></a> ${status.index+1}</li>
                           </c:forEach>
					
                            </ul>
                        </div>
		            </div>
                </div> 
                <div class="layui-col-sm9">
                <form action="${path}/File/download" id="updload" >
                <c:forEach items="${jiexi.map.list}" var="x">
                <input type="hidden" name="id" value="${x.id}"/>
                </c:forEach>
                <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm" href="${filepath }">下载该试卷</button>
                </form>
                                       
                    <div class="problem_block">
                        <div class="layui-tab layui-tab-card">
                            <ul class="layui-tab-title">
                                <li class="layui-this">试题</li>
                            </ul>
                            <div class="layui-tab-content">
                                <div class="layui-tab-item layui-show">
                                    <ul class="problem_list" >
                                    <c:forEach items="${jiexi.map.list}" var="x" varStatus="status" >
                                    <li>
                                            <div class="p_info" name="+${status.index+1}">
                              
                                              
                                            </div>
                                            <div class="p_cnt">
                                              
                                                    ${x.body}
                                              
                                               
                                                    ${x.analysis}
                                               
                                                <div class="options">
                                                    <div class="opt_r">
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    
                                    </c:forEach>
                                       
                                    </ul>
                                    <div class="text-center" id="pages">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <jsp:include page="../public/footer.jsp"/>
</body>
</html>
<script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path}/layui/layui.js"></script>
<script type="text/javascript" src="${path}/MathJax-master/MathJax.js"></script>
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
    
    $.each($(".p_cnt p"), function(k, v) {
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
}

</script>