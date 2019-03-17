(function() {
    var h = $(window).width() > 768 ? '400px' : $(window).width() * .4 + 'px';
    var carousel
    var option = {
        elem: '#slider',
        interval: '2000',
        height: h,
        width: '100%' //设置容器宽度
            ,
        arrow: 'always' //始终显示箭头
        //,anim: 'updown' //切换动画方式
    }
    layui.use('carousel', function() {
        carousel = layui.carousel;
        //建造实例
        carousel.render(option);
    });

    

    window.onresize = function() {
    	var h = $(window).width() > 768 ? '400px' : $(window).width() * .4 + 'px';
    	var option = {
    	        elem: '#slider',
    	        interval: '2000',
    	        height: h,
    	        width: '100%' //设置容器宽度
    	            ,
    	        arrow: 'always' //始终显示箭头
    	        //,anim: 'updown' //切换动画方式
    	    }
        var ins = carousel.render(option)
        ins.reload(option);
    }
})()