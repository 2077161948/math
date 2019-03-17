$(function () {

    function ssw( ){
        let r=window.location.href;
        if(r.endsWith("math/")){
            $("#index").addClass("nav-on");
            $("#newexam").removeClass("nav-on");
            $("#combination").removeClass("nav-on");
            $("#handle").removeClass("nav-on");

        }else if (r.endsWith("newexam")){
            $("#index").removeClass("nav-on");
            $("#newexam").addClass("nav-on");
            $("#combination").removeClass("nav-on");
            $("#handle").removeClass("nav-on");
        } else if (r.endsWith("combination")){
            $("#index").removeClass("nav-on");
            $("#newexam").removeClass("nav-on");
            $("#combination").addClass("nav-on");
            $("#handle").removeClass("nav-on");
        }else if(r.endsWith("handle")){
            $("#index").removeClass("nav-on");
            $("#newexam").removeClass("nav-on");
            $("#combination").removeClass("nav-on");
            $("#handle").addClass("nav-on");
        }

    }
    ssw();
});