(function(){
    layui.use('layer', function(){})
        $('#register').click(function(){
        var uname = $('#studentid').val(),
            pwd = $('#studentpwd').val();
        if(!(emailReg(uname)||phoneReg(uname))){
            layer.msg('用户名不符合',{icon: 2});
            return false;
        }
        if(!pwdReg(pwd)){
            layer.msg('密码不符合',{icon: 2});
            return false;
        }
        
    
    
    })
})()
