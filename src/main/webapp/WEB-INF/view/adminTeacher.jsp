<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String path=this.getServletContext().getContextPath();
    session.setAttribute("path", path);
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>教师中心</title>
    <link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${path}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/css/pub.css">
       <link rel="shortcut icon " type="images/x-icon" href="${path}/img/index/shorticon.png">
    
<style type="text/css">
    .header {
        height: 60px;
        line-height: 60px;
        padding: 0 15px;
        color: #fff;
        background-color: #393D49
    }

    .uploadBox {
        width: 1200px;
        margin: 20px auto 0;
    }

    .header .right a {
        margin-left: 20px;
        color: #fff;
    }

    .header .right a:hover {
        color: #ac6767;
    }

    .changepwd>div {
        margin-bottom: 10px;
    }

    .changepwd>div input {
        padding: 3px 0;
        padding-left: 5px;
    }

    .wrapper {
        width: 1200px;
        margin: 0 auto
    }

    .unUpload {
        margin-top: 80px;
    }
    .cgUser2 > p{
        margin-bottom: 10px
    }
    .cgUser{
        display: none;
    }
    .cgUser > div{
        margin-top: 10px;
    }
    </style>
</head>

<body>
    <div class="header clear">
        <div class="right">
            <span>尊敬的: <em>${Teacher.name}</em> 您好</span>
            <a href="javascript:changePwd()">修改密码</a>
            <a href="javascript:userInfo()">个人信息</a>
            <a href="${path}/">退出</a>
        </div>
    </div>
    <div class="uploadBox">
        <div class="layui-upload">
            <button type="button" class="layui-btn layui-btn-normal" id="testList">选择doc试题文件</button>
            <div class="layui-upload-list">
                <table class="layui-table">
                    <thead>
                        <tr>
                            <th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody id="demoList"></tbody>
                </table>
            </div>
            <button type="button" class="layui-btn" id="testListAction">开始上传</button>
        </div>
    </div>
<h3 style="margin-top: 100px; text-align: center;">当前上传文件</h3>
<div id="oks" style="margin: 0 auto;width: 80%;"></div>
<h3 style="margin-top: 100px;text-align: center;">历史未解析文件</h3>
<div  style="margin: 0 auto;width: 80%;">



<table class="layui-table"  >
<tr>
<td>文件名</td>
<td>上传时间</td>
<td>解析</td>
</tr>
<c:forEach items="${w}" var="x">
<tr>
<td>${x.filename}</td>
<td><fmt:formatDate value="${x.uploadtime}"  type="date" dateStyle="default"/></td>
<td><a href="${path}/File/jixi?path=${x.filepath}">解析</a></td>
</tr>
</c:forEach>

</table>
</div>
<script type="text/javascript" src="${path}/js/public.js"></script>
<script type="text/javascript" src="${path}/js/jquery.js"></script>
<script type="text/javascript" src="${path}/js/jquery.redirect.js"></script>
    <script src="${path}/layui/layui.js"></script>
    <script>
    
    $(function(){
    	
    	$("a").on("click",function(){
    		let r=$(this).attr("href")
    		 $.redirect(r,{},"POST");
    	});
    	
    	   $("#testListAction").click(function(){
    	    	$(this).addClass("btn btn-default btn-lg");
    	    	$(this).attr("disabled","disabled")
    	    })
    	
    })
    
    function userInfo() {
        layer.open({
            type: 1, //Page层类型
            area: ['360px', '220px'],
            title: '用户信息',
            shade: 0.6,
            anim: 1, //0-6的动画形式，-1不开启
            content: "<div style='padding:20px 30px 0;' class='changepwd'><div class='cgUser2'><p><label>昵&nbsp;&nbsp;&nbsp;&nbsp;称：</label><span>${Teacher.name}</span></p><p><label>手机号：</label><span>${Teacher.phone}</span></p><p><button class='layui-btn layui-btn-sm'onclick='cgUser()'>修改</button></p></div><div  class='cgUser'><div><label>昵&nbsp;&nbsp;&nbsp;&nbsp;称：</label><input type='text'placeholder='请输入昵称'id='reName'></div><div><label>手机号：</label><input type='text'placeholder='请输入手机号'id='rePhone'></div><div style='margin-top:10px'><button class='layui-btn layui-btn-sm' onclick='cgUserBtn()'>提交</button></div></div></div>"

        });
    }
var password="";
    //prompt层
    function changePwd() {
  
            layer.open({
                type: 1, //Page层类型
                area: ['300px', '270px'],
                title: '修改新密码',
                shade: 0.6,
                anim: 1, //0-6的动画形式，-1不开启
                content: "<div style='padding:30px;'  class='changepwd'><div><lable>当前密码<lable><input type='password'class='changepwd' id='dqpm' name='pwd'/></div><div><label>新密码：</label><input type='password'placeholder='请输入新密码'id='pwd'></div><div><label>新密码：</label><input type='password'placeholder='请再次输入'id='rPwd'></div><div style='margin-top:10px'><button onclick='changepwd()' class='layui-btn layui-btn-sm'>提交</button></div></div>"
        
        });
    };
    
    
    

    function changepwd(){
    	var password=$('#rPwd').val();
    	var pwds=$("#pwd").val();
    	var pwd=$("#dqpm").val();
    	if(!pwdReg(password)){
    		alert("密码需要6-12位数字字母混合")
    		return;
    	}
    	console.log(pwds)
    	if(password!=pwds){
    		alert("两次密码不一致");
    		return;
    	}
    	
    	$.ajax({
    		type:'POST',
    		url:'${path}/teacher/updatepwd',
    		data:"pwd="+pwd+"&newpassword="+password,
    		success:function(result){
    			if(result.status==200){
    				alert('修改成功')
    			}
    		
    		}
    	})
    }
    
    layui.use('upload', function() {
        var $ = layui.jquery,
            upload = layui.upload;
        //拖拽上传
        var demoListView = $('#demoList'),
            uploadListIns = upload.render({
                elem: '#testList',
                url: '${path}/File/upload',
                accept: 'file',
                multiple: true,
                ext: 'doc',
                auto: false,
                bindAction: '#testListAction',
                choose: function(obj) {
                    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                    //读取本地文件
                    obj.preview(function(index, file, result) {


                        var tr = $(['<tr id="upload-' + index + '">', '<td>' + file.name + '</td>', '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>', '<td>等待上传</td>', '<td>', '<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>', '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>', '</td>', '</tr>'].join(''));

                        //单个重传
                        tr.find('.demo-reload').on('click', function() {
                            obj.upload(index, file);
                        });

                        //删除
                        tr.find('.demo-delete').on('click', function() {
                            delete files[index]; //删除对应的文件
                            tr.remove();
                            uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                        });

                        demoListView.append(tr);

                    });
                },
                done: function(res, index, upload) {
                    if (res.status == 200) { //上传成功
                    	console.log(res);
                    	let arr=res.map.list[0];
                    	let lujin = res.map.list;
                    	
                    	arr=String(arr);
                    	let r=arr.split("-");
                    	
                    	var strs = `<div>上传成功-----------------<a href="">解析</a></div>`
                    	//	${path}/File/jixi?path=
                    	$("#oks").append(strs)
                    	var urls = `${path}/File/jixi?path=`+lujin
                    	$("#oks a").attr("href",urls); 
                        var tr = demoListView.find('tr#upload-' + index),
                            tds = tr.children();
                        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                        tds.eq(3).html(''); //清空操作
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    }
                    alert(res.msg)
                    this.error(index, upload);
                },
                error: function(index, upload) {
                    var tr = demoListView.find('tr#upload-' + index),
                        tds = tr.children();
                    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                }
            });
    });

    function cgUser(){
        $(".cgUser").show()
        $(".cgUser2").hide()
    }
    function cgUserBtn(){
    	var name=$("#reName").val();
    	var phone=$("#rePhone").val();
    	$.ajax({
    		type:"POST",
    		url:"${path}/teacher/update",
    		data:"name="+name+"&phone="+phone,
    		success:function(result){
    		
    				alert(result.msg);
    		}
    		
    	})
    	console.log(name+phone)
        $(".cgUser").hide()
        $(".cgUser2").show()
        
    }
    </script>
</body>

</html>