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
    <title>手动组卷</title>
    <link rel="stylesheet" href="${path}/css/tree.css" />
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/handle.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
    <style type="text/css">
   			#problem_list img{
      		vertical-align: middle !important;
   			}
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
		.handle_block{
			width:1200px;
			margin:150px auto  0
		}
		.hchoose {
		 	position:fixed;
		 	width:150px;
		 	top:56%;
		 	right:1%;
		 	min-height:14px;
		 	background-color:#e6e6e6;
		 	z-index:999;
		 	display:none;
		 	font-size:12px;
		 }
		 .hchoose p {
		 	padding-left:20px;
		 	padding-top:5px;
		 	padding-bottom:5px;
		 }
		 .hchoose ul{
		 	padding-top:5px;
		 	padding-left:4%
		 }
		 .hchoose li{
		 	float:left;
		 	margin-right:5px;
		 	text-align:center;
		 	width:16%;
		 	padding:4px;
		 	border:1px solid #f2f2f2;
		 	background-color:#fff;
		 	margin-bottom:5px;
		 	cursor: pointer;
		 }
		 .hchoose li:nth-child(5n){
		 	margin-right:0
		 }
		 .sureBtn{
		 	text-align:center
		 }
		@media screen and (max-width:768px){
			.handle_block{
				width:100%
			}
			 .trees{
            padding:0 !important
        }
        .cc{
            position:relative;
            left:-11%;
            
        }
        
        .known {
		    padding: 0px;
		}
		
		 /*已选择*/
		 .hchoose{
		 display:block;
		 	width:50px;
		 	min-height:50px;
		 }
		 .hchoose p{
		 	font-size: 0;
		 }
		}
		
    </style>
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
<jsp:include page="../public/top.jsp"/>
        <div class="handle_block main_bd layui-container" >
            <div class="layui-row handle_area">
                <div class="layui-col-sm3 trees">
                    <div class="tree_title">
                    	<input id="zsd" onclick="init(0)" type="radio" name="type" checked="checked"><label for="zsd">知识点</label>
                    	<input id="zj" onclick="init(1)"  type="radio" name="type"><label for="zj">章节</label>
                    </div>
                    <div class="centent">
                        <div class="treebox scrollXY">
                            <div class="tree" id="tree">
                                <ul>
                                  
                                </ul>
                            </div>
                        </div>
		            </div>
                </div> 
                <div class="layui-col-sm9">
   					  <div class="problem_block">
                        <div class="layui-tab layui-tab-card">
                            <ul class="layui-tab-title">
                                <li class="layui-this">试题</li>
                            </ul>
                            <div class="layui-tab-content">
                            	<div class="choose">
									<select name="tx" id="tx">
									<c:forEach items="${types}" var="x">
									<option value="${x.id}">${x.name}</option>
									</c:forEach>
									</select>
                            	</div>
                                <div class="layui-tab-item layui-show">
                                    <ul class="problem_list" id="problem_list">
                                    </ul>
                                    <div class="text-center" id="pages">
                                    </div>
                                    <div class="sureBtn">
                                   		<form action="${path}/aproblem/show" method="post" id="garbageJava">
                                   			
                                   			
                                		</form>
                                	</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="hchoose mh" id="hadChoose">
       	<div>
        	<p>点击即删除该题</p>
        	<ul class="clear">
        		
        	</ul>
        	</div>
        </div>
<jsp:include page="../public/footer.jsp"/>
<script type="text/javascript" src="${path}/js/jquery.js"></script>
<script type="text/javascript" src="${path}/js/FileSaver.js"></script>
<script type="text/javascript" src="${path}/js/jquery.wordexport.js"></script>
<script type="text/javascript" src="${path}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${path}/js/treescroll.min.js"></script>
<script type="text/javascript" src="${path}/layui/layui.js"></script>
<script type="text/javascript" src="${path}/js/handle.js"></script>
<script type="text/javascript" src="${path}/js/top.js"></script>
<script type="text/javascript" src="${path}/MathJax-master/MathJax.js"></script>
<script type="text/javascript">
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
function mathinit(){
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
}


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



if(screen.width<768){
	$(".mh").click(function(){
		$(this).animate({width:'100%',top:0});
	})
}
$(".sureBtn").hide()
localStorage.removeItem('timu');
Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
	if (this[i] == val) return i;
	}
	return -1;
	};
	Array.prototype.remove = function(val) {
		var index = this.indexOf(val);
		if (index > -1) {
		this.splice(index, 1);
		}
		};
function ads (num,e){
    //num 为传过来的题的id值
    var num = num
    var arr = []
   $("#hadChoose").show()
    var pd = $(e).attr("data-true")
    $(e).attr("data-true","false")
    var wBtn
   	if(localStorage.getItem("timu")){
   		arr = JSON.parse(localStorage.getItem("timu"))
   		if(pd == "true"){
   		arr.push(num)
   		localStorage.setItem("timu",JSON.stringify(arr))
   			$("#hadChoose ul").empty()
   			for(var i = 0 ; i < arr.length ; i ++){
   				var str = "<li>"+(i+1)+"</li>"
   				$("#hadChoose ul").append(str)
   			}
   		$("#hadChoose ul li").each(function(i){
   			$(this).click(function(){
   				var arr = JSON.parse(localStorage.getItem("timu"))
   				$("#garbageJava").empty()
   				
   				wBtn = arr[i]
   				delete arr[i]
   				var newArr = []
   				for( l in arr){
   					newArr.push(arr[l])
   				}
   				newArr = newArr.slice(0,newArr.length-2)
   				console.log(newArr.length)
   				if(newArr.length < 1){
   					$("#hadChoose").hide()
   					$("#garbageJava").empty()
   				}
   				newArr.forEach(function(item){
   		   			var input = "<input type='hidden' name='id' value='"+item+"'/>"
   		   			$("#garbageJava").append(input)
   		   		})
   		   		var sumit = "<input type='submit' class='layui-btn' id='garbage' value='提交' />"
   		   			$("#garbageJava").append(sumit)
   				localStorage.setItem("timu",JSON.stringify(newArr))
   				$($("#hadChoose ul li:last-child")).remove()
   				$("button").each(function(index,item){
   			if($(item).attr("data") == wBtn){
   				$(item).attr("data-true","true")
   			}
   		})
   			})
   		})
   		
   		}
   		
   		var nArr = JSON.parse(localStorage.getItem("timu"))
   		$("#garbageJava").empty()
   		nArr.forEach(function(item){
   			var input = "<input type='hidden' name='id' value='"+item+"'/>"
   			$("#garbageJava").append(input)
   		})
   		var sumit = "<input type='submit' class='layui-btn' id='garbage' value='提交' />"
   			$("#garbageJava").append(sumit)
   		
   		
   		
   	}else{
   		arr.push(num)
   		var input = "<input type='hidden' name='id' value='"+num+"'/>"
   			$("#garbageJava").append(input)
   		var sumit = "<input type='submit' class='layui-btn' id='garbage' value='提交' />"
   			$("#garbageJava").append(sumit)
   		for(var i = 0 ; i < arr.length ; i ++){
				var str = "<li>"+(i+1)+"</li>"
				console.log(str)
				$("#hadChoose ul").append(str)
			}
   		localStorage.setItem("timu",JSON.stringify(arr))
   		$("#hadChoose ul li").on("click",$("#hadChoose ul"),function(){
   			wBtn = JSON.parse(localStorage.getItem("timu"))[0]
   			$("button").each(function(index,item){
   	   			if($(item).attr("data") == wBtn){
   	   				$(item).attr("data-true","true")
   	   			}
   	   		})
   			localStorage.removeItem("timu")
   			$("#hadChoose ul").empty()
   			$("#hadChoose").hide()
   			$("#garbageJava").empty()
		})
   	}
}



var x=0;
var ass=2766;//树的第一个可用节点
var status=1;//0代表知识点一代表章节
var types=1;//题型
var page=1;//页数
let data={
		"ass":ass,
		"status":status,
		"types":types,
		"page":page,
		pagesize:10
		
}

init(0)

$(function(){
	$("#product_ok").click(function(){
		$("#word").wordExport();
	})	
		
	$("#tx").change(function(){
		data.page=page;
		data.types=$("#tx").val();
	 	data.ass=$(this).attr("data-id");
	 	data.status=status;
		var d=$.param(data);
	    $.ajax({type:"post",
	    		url:'${path}/aproblem/sdzj',
	    		data:d, 
	    		success: function(dt) {
	            var list = dt.list;
	            $("#problem_list").empty();
	            $(".sureBtn").show()
	            layui.use(['element','laypage','form'], function(){
	                var element = layui.element,
	                    laypage = layui.laypage,
	                    form = layui.form;

	                laypage.render({
	                    elem: 'pages'
	                    ,count: dt.total
	                    ,layout: ['count', 'prev', 'page', 'next', 'skip']
	                    ,jump: function(obj){
	                    	//当前鼠标点击的页面
	                        console.log(obj.curr)
	                      // 向后台请求数据
	                       //$.post('${path}/aproblem/sdzj',{page:obj.curr},function(dt){
	                        	
	                       // })
	                    }
	                });
	            })
	        list.forEach(function(item){
	            var str = "<li><div class='p_info'><span class='layui-breadcrumb'lay-separator='|'><a href='javascript:vodi(0)'>题号："+item.id+"题</a></span></div><div class='p_cnt'>"+item.body+item.analysis+"<div class='options'><div class='opt_r'><button class='layui-btn layui-btn-normal layui-btn-sm' name='tj' onclick='ads("+item.id+",this)' data-true='true' data='"+item.id+"' >添加选题</button></div></div></div></li>"
	            $("#problem_list").append(str)
	        })
	        mathinit();
	    }
	})
	mathinit();
	});
	
});

function init(num) {
	status=num;
	$.get("${path}/get", { status: num }, function(result){
		if(result.status==500){
			alert(result.msg);
		}
	});
    $("#tree > ul").empty();
    $.get("${path}/assort/three", { status: num }, function(dt) {
        var secondFloor = []
        var threeFloor = []
        var fourFloor = []
        dt.forEach(function(item, index) {
            var str = "<li><div class='open_menu'><span></span><a title='一级菜单' data-id='"+item.id+"'>" + item.nodename + "</a></div><ul></ul></li>"
            $("#tree > ul").append(str);
            item.list.forEach(function(ite, inde) {
                if (ite.list.length > 0) {
                    var str = "<li><div class='open_menu'><span></span><a title='集合' data-id='"+ite.id+"'>" + ite.nodename + "</a></div><ul></ul></li>"
                    $("#tree > ul > li >ul").eq(index).append(str);
                    secondFloor.push(ite.list)
                } else {
                    var str = "<li><a class='lastChoose' data-true='true' title='最后一层' data-name='" + ite.nodename + "' data-id='" + ite.id + "'>" + ite.nodename + "</a></li>"
                    $("#tree > ul > li >ul").eq(index).append(str);
                }
            })
        })
        secondFloor.forEach(function(item, index) {
            item.forEach(function(it) {
                if (it.list.length > 0) {
                    var str = "<li><div class='open_menu'><span></span><a data-id='"+it.id+"' title='集合的含义及表示'>" + it.nodename + "</a></div><ul></ul></li>"
                    $("#tree > ul > li >ul > li >ul").eq(index).append(str)
                    threeFloor.push(it.list)
                } else {
                    var str = "<li><a class='lastChoose' data-true='true' title='最后一层' data-name='" + it.nodename + "' data-id='" + it.id + "'>" + it.nodename + "</a></li>"
                    $("#tree > ul > li >ul > li >ul").eq(index).append(str)
                }
            })
        })
        threeFloor.forEach(function(item, index) {
            item.forEach(function(it) {
                var str = "<li><a  class='lastChoose' data-true='true' data-name='" + it.nodename + "' data-id='" + it.id + "' title='集合的含义及表示'>" + it.nodename + "</a></div></li>"
                $("#tree > ul > li >ul > li >ul>li>ul").eq(index).append(str)
            })
        })
        var reg = /^[1-9]\d*$|^0$/;
        //获取  选择的题目数
        $("#product_btn").click(function() {
        	x++;
        	if(x%2==0){
        		x=x%2;
        		return false;
        	}
            var dataList = [];
            var data = [];
            $("td input").each(function(index, item) {
                var num = $(this).val()
                if (!num) {
                    num = 0
                }
                if (reg.test(num)) {
                    data.push(num)
                }
            })
            var length = Math.ceil(data.length / 6)
            for (var i = 0; i < length; i++) {
                var type = $("tr").eq(i + 1).attr("data-id")
                var first = i * 6
                var currArr = data.slice(first, first + 6)
                var obj = {
                    types: type,
                    xzt: currArr[0],
                    tkt: currArr[1],
                    jdt: currArr[2],
                    jst: currArr[3],
                    zmt: currArr[4],
                    pdt: currArr[5]
                }
                dataList.push(obj)
            }
            $.ajax({
            	type:"POST",
            	url:"${path}/aproblem/result",
            	data:"data="+JSON.stringify(dataList)+"&status="+num,
            	success:function(result){
            		if(result===[]){
            			alert('没有数据')
            			return false;
            		}
            		var word=$("#word");
            		word.empty();
            		$(result).each(function(i,k){
            			word.append(k.body);
            		})
            		word.append("参考答案")
            		$(result).each(function(i,k){
            			word.append(k.analysis);
            		})
            		
            		
            	}
            	
            	})
            console.log(data)
            //types 1(章节),0(知识点)  xzt tkt jdt jst zmt
        })

        
       	
		$("#tree a").on('click',function(){
				data.page=page;
				data.types=$("#tx").val();
			 	data.ass=$(this).attr("data-id");
			 	data.status=status;
			var d=$.param(data);
		    $.ajax({type:"post",
		    		url:'${path}/aproblem/sdzj',
		    		data:d, 
		    		success: function(dt) {
	           var list = dt.list
	           $(".sureBtn").show()
	           $("#problem_list").empty();
	           layui.use(['element','laypage','form'], function(){
	                var element = layui.element,
	                    laypage = layui.laypage,
	                    form = layui.form;

	                laypage.render({
	                    elem: 'pages'
	                    ,count: dt.total
	                    ,layout: ['count', 'prev', 'page', 'next', 'skip']
	                    ,jump: function(obj){
	                    	//当前鼠标点击的页面
	                        console.log(obj.curr)
	                      // 向后台请求数据
	                       //$.post('${path}/aproblem/sdzj',{page:obj.curr},function(dt){
	                        	
	                       // })
	                    }
	                });
	            })
		        list.forEach(function(item){
		            var str = "<li><div class='p_info'>"+item.id+"</div><div class='p_cnt'>"+item.body+item.analysis+"<div class='options'><div class='opt_r'><button class='layui-btn layui-btn-normal layui-btn-sm w' name='tj' onclick='ads("+item.id+",this)' data-true='true'  data='"+item.id+"' >添加选题</button></div></div></div></li>"
		            $("#problem_list").append(str)
		        })
		        mathinit();
		    }
		})
		mathinit();
		});

        $(".lastChoose").click(function() {
            var id = $(this).attr("data-id")
            var name = $(this).attr("data-name")
            var pd = $(this).attr("data-true")
            if (pd == "true") {
                $(this).attr("data-true", "false")
                var str = "<tr data-id='" + id + "'><td>" + name + "<i class='layui-icon layui-icon-close closeBtn'style='font-size:12px'></i></td><td>14</td><td><input class='tishu'type='text'></td><td><input class='tishu'type='text'></td><td><input class='tishu'type='text'></td><td><input class='tishu'type='text'></td><td><input class='tishu'type='text'></td><td><input class='tishu'type='text'></td></tr>"
                $("#known_table tbody").prepend(str)
            }

            // //删除dom
            $(".closeBtn").each(function() {
                $(this).click(function() {
                    var num = $(this).parent().parent().attr("data-id")
                    $("#tree a").each(function() {
                        var nu = $(this).attr("data-id")
                        if (nu == num) {
                            $(this).attr("data-true", "true")
                        }
                    })
                    $(this).parent().parent().remove()
                })
            })
        })

        setTimeout(function() {
            $("#chooseType .layui-unselect").each(function(i) {
                $(this).click(function() {
                    init(i)
                })
            })
        }, 200)
    })
}


String.prototype.times = function(n) {
    if (n == 1) {
        return this;
    }
    var midRes = this.times(Math.floor(n / 2));
    midRes += midRes;
    if (n % 2) {
        midRes += this;
    }
    return midRes;
}





//就在这里向后台发送
$(".sureBtn").on("click",function(){
//${path}/aproblem/show

if(localStorage.getItem("timu")){
	var arr = JSON.parse(localStorage.getItem("timu"))
	var newArr = []
	arr.forEach(function(item){
		var obj = {"id":item}
		newArr.push(obj)
	})
	var jsonArr = JSON.stringify()
	
}
})
</script>

</body>
</html>
