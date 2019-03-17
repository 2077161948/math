

    init(0)
    	function init(num) {
        console.log("我执行的是"+ num)
        // $.get("/assort/three",{status:num},function(dt){

        // })
        var dt =[];
        $.ajax({
        	type:'POST',
        	url="${path}/assort/three",
        	sync:false,
        	data:'status='+num,
        	success:function(result){
        		dt=result;
        	}
        	
        })
        var newItem = []
        dt.forEach(function(item) {
            if (item.parentid) {
                if (item.parentid == 1) {
                    var str = "<ul><li><div class='close_menu'><span></span><a href='javascript:;' title='" + item.name + "'>" + item.name + "</a></div></li></ul>"
                    $("#tree >ul >li").append(str)
                } else if (item.parentid == 2) {
                    var str = "<ul><li><div class='close_menu'><span></span><a title='" + item.name + "'>" + item.name + "</a></div><ul></ul></li></ul>"
                    $("#tree > ul> li > ul > li > div").after(str)
                } else if (item.parentid == 3) {
                    newItem.push(item)
                }
            } else {
                var str = "<li><div class='close_menu'><span></span><a href='javascript:;' title='" + item.name + "'>" + item.name + "</a></div>"
                $("#tree > ul").append(str)
            }
        })
        newItem.forEach(function(item){
             var str = "<li><a data-id="+item.id+" data-true='true' data-name='" + item.name+ "' class='lastChoose' >" + item.name + "</a>"
            $("#tree > ul> li > ul > li > ul >li>ul").append(str)
        })


    }


    $(".lastChoose").click(function() {
        var id = $(this).attr("data-id")
        var name = $(this).attr("data-name")
        var pd = $(this).attr("data-true")
        if (pd == "true") {
            $(this).attr("data-true", "false")
            var str = "<tr data-id='"+id+"'><td>" + name + "<i class='layui-icon layui-icon-close closeBtn'style='font-size:12px'></i></td><td>14</td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td></tr>"
            $("#known_table tbody").prepend(str)
        }

        // //删除dom
        $(".closeBtn").each(function() {
            $(this).click(function() {
                var num = $(this).parent().parent().attr("data-id")
                $("#tree a").each(function(){
                    var nu = $(this).attr("data-id")
                    if(nu == num ){
                        $(this).attr("data-true", "true")
                    }
                }) 
                $(this).parent().parent().remove()
            })
        })
    })



    var reg = /^[1-9]\d*$|^0$/;

    //删除dom
$(".lastChoose").click(function(){
    var id = $(this).attr("data-id")
    var name = $(this).attr("data-name")
    var pd = $(this).attr("data-true")
    if(pd == "true"){
        $(this).attr("data-true","false")
        var str = "<tr><td>"+name+"<i class='layui-icon layui-icon-close closeBtn'style='font-size:12px'></i></td><td>14</td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td><td><input class='tishu'type='text'placeholder='65题'></td></tr>"
    $("#known_table tbody").prepend(str)
    }
    
  // //删除dom
    $(".closeBtn").each(function() {
        $(this).click(function() {
            $(this).parent().parent().remove()
        })
    })
})
    //获取  选择的题目数
    $("#product_btn").click(function() {
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
            var first = i * 6
            var currArr = data.slice(first, first + 6)
            var obj = {
                types: 4,
                xzt: currArr[0],
                tkt: currArr[1],
                jdt: currArr[2],
                jst: currArr[3],
                zmt: currArr[4],
                pdt: currArr[5]
            }
            dataList.push(obj)
        }
        var data = {
            data: JSON.stringify(dataList),
            status: 0
        }
        console.log(data)
        //types 1(章节),0(知识点)  xzt tkt jdt jst zmt
    })


    layui.use(['element', 'laypage', 'form'], function() {
        var element = layui.element,
            laypage = layui.laypage;
        var form = layui.form;
    })

setTimeout(function(){
$("#chooseType .layui-unselect").each(function(i){
    $(this).click(function(){
        init(i)
    })
})

},200)




