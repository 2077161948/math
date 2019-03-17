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
    <title>智能组卷</title>
    <link rel="stylesheet" href="${path}/css/tree.css" />
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/css/public.css">
    <link rel="stylesheet" href="${path}/css/combination.css">
    <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
    <style>
        @media screen and (max-width:768px){
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
		.layui-table td, .layui-table th {
		    padding: 0px 2px !important;
		    font-size: 12px;
		}
		#word img{
			vertical-align: middle !important; 
			maxwidth:100% !important
		}
    }
    </style>
</head>

<body>
    <jsp:include page="../public/top.jsp" />
    <div class="layui-container main_bd">
        <div>
            <span>位置：</span>
            <span class="layui-breadcrumb" lay-separator="|" id="nav" style="padding-top:10px;">
                <a href="${path}/">首页</a>
                <a href="${path}/combination">智能组卷</a>
            </span>
        </div>
        <div class="layui-row">
            <div class="layui-col-sm12 combina_block">
                <div class="layui-form layui-form-pane">
                    <div class="layui-form-item choose_type" pane="">
                        <div id="chooseType">
                            <input type="radio" name="AI" lay-skin="primary" title="智能知识点组卷" checked="checked">
                            <input type="radio" name="AI" lay-skin="primary" title="智能章节组卷">
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm3 trees">
                    <div class="tree_title">
                        <h3>高中数学</h3>
                    </div>
                    <div class="centent">
                        <div class="treebox scrollXY">
                            <div class="tree" id="tree">
                                <ul id="treeul">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm12 layui-col-md9 cc">
                    <div class="known">
                        <div class="kwown_title">
                            <h4>试题知识点:</h4>
                            <span id="del">
                                <a class="layui-icon layui-icon-delete"></a>清空
                            </span>
                        </div>
                        <table class="layui-table known_table" id="known_table">
                            <thead>
                                <tr>
                                    <th>已选知识点</th>
                                    <th>题数</th>
                                    <th>选择题</th>
                                    <th>填空题</th>
                                    <th>解答题</th>
                                    <th>计算题</th>
                                    <th>证明题</th>
                                    <th>判断题</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <div class="product">
                            <button class="layui-btn layui-btn-lg layui-btn-normal" id="product_btn">生成试卷</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="word" style="width: 50%;margin:0 auto">
    </div>
    <div class="footer layui-hide-xs">
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
                <p class="text-center color-g">2018 蜀ICP备5971531号</p>
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
<script type="text/javascript" src="${path}/js/treescroll.min.js"></script>
<script type="text/javascript" src="${path}/layui/layui.js"></script>
<script type="text/javascript" src="${path}/js/public.js"></script>
<script type="text/javascript" src="${path}/js/jquery.js"></script>
<script type="text/javascript" src="${path}/js/FileSaver.js"></script>
<script type="text/javascript" src="${path}/js/jquery.wordexport.js"></script>
<script type="text/javascript" src="${path}/js/top.js"></script>
<script type="text/javascript" src="${path}/js/canvasjs.js"></script>
<script type="text/javascript" src="${path}/js/jquery.redirect.js"></script>
<script type="text/javascript">
var x = 0;

init(0)

$(function() {
    $("#product_ok").click(function() {
        $("#word").wordExport();
    })
})

function init(num) {
    $.get("${path}/get", { status: num }, function(result) {
        if (result.status == 500) {
            alert(result.msg);
        }
    });
    $("#tree > ul").empty();
    $.get("${path}/assort/three", { status: num }, function(dt) {
        var secondFloor = []
        var threeFloor = []
        var fourFloor = []
        dt.forEach(function(item, index) {
            var str = "<li><div class='open_menu'><span></span><a title='一级菜单'>" + item.nodename + "</a></div><ul></ul></li>"
            $("#tree > ul").append(str);
            item.list.forEach(function(ite, inde) {
                if (ite.list.length > 0) {
                    var str = "<li><div class='open_menu'><span></span><a title='集合'>" + ite.nodename + "</a></div><ul></ul></li>"
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
                    var str = "<li><div class='open_menu'><span></span><a title='集合的含义及表示'>" + it.nodename + "</a></div><ul></ul></li>"
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
            if (x % 2 == 0) {
                x = x % 2;
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
            $.redirect('${path}/aproblem/result',{'data':JSON.stringify(dataList),'status':num});
  /*          $.redirect({
            	url: "${path}/aproblem/result",
            	values:"data": JSON.stringify(dataList).toString() + "&status=" + num,
            	method:'POST'
            });        
            
            $.ajax({
                type: "POST",
                url: "${path}/aproblem/result",
                data: "data=" + JSON.stringify(dataList) + "&status=" + num,
                success: function(result) {
                    if (result === []) {
                        alert('没有数据')
                        return false;
                    }
                    var word = $("#word");
                    word.empty();
                    $(result).each(function(i, k) {
                        word.append(k.body);
                    })
                    word.append("<p style='font-size: 20px'>参考答案</p>")
                    $(result).each(function(i, k) {
                        word.append(k.analysis);
                    })
                    
			$.each($("#word > img"),function(i,k){
			$(this).css("vertical-align","middle");
				});
                    $.each($("#word >p"),function(i,k){
                    	html2canvas(this).then(canvas =>{
                    		var image = new Image();
                    		image.src = canvas.toDataURL("image/png");
                    		$(image).attr("id","x"+i);
                    		$(image).attr("width","80%");
                    		$(this).replaceWith(image);
                    	});
                    });

                }

            }) */
            console.log(data)
            //types 1(章节),0(知识点)  xzt tkt jdt jst zmt
        })


        $(".lastChoose").click(function() {
            var id = $(this).attr("data-id")
            var name = $(this).attr("data-name")
            var pd = $(this).attr("data-true")
            if (pd == "true") {
                $(this).attr("data-true", "false")
                var str = "<tr data-id='" + id + "'><td>" + name + "<i class='layui-icon layui-icon-close closeBtn'style='font-size:12px'></i></td><td>14</td><td><input class='tishu'type='text' ></td><td><input class='tishu'type='text' ></td><td><input class='tishu'type='text' ></td><td><input class='tishu'type='text' ></td><td><input class='tishu'type='text' ></td><td><input class='tishu'type='text' ></td></tr>"
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






layui.use(['element', 'laypage', 'form'], function() {
    var element = layui.element,
        laypage = layui.laypage;
    var form = layui.form;
})

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



if (window.screen.availWidth < 768) {
    $(".cc").width(window.screen.availWidth - 1)
    console.log($(".cc").scrollLeft)
}
</script>

</html>