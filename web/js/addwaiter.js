/**
 * Created by cristph on 2016/3/18.
 */

$('#createwaiter').click(
    function(){
        var email=document.getElementById("email").value;
        var name=document.getElementById("name").value;
        var sex=0;
        var obj=document.getElementsByName("sex");
        for(i=0;i<obj.length;i++) {
            if(obj[i].checked){
                sex=i+1;
            }
        }
        var address=document.getElementById("address").value;
        var birth=document.getElementById("birth").value;
        var selfintro=document.getElementById("selfintro").value;
        var contact=document.getElementById("contact").value;

        var pswd=document.getElementById("pswd").value;

        var shopid=document.getElementById("shopid").value;
        var shopauth=document.getElementById("shopauth").value;

        $.post(
            "/createwaiter",
            {"email":email,
                "name":name,
                "sex":sex,
                "address":address,
                "birth":birth,
                "selfintro":selfintro,
                "contact":contact,
                "pswd":pswd,
                "shopid":shopid,
                "shopauth":shopauth
            },
            function(data){
                if(data=="method_execute_success"){
                    alert("注册服务员成功！");
                    var str="/editshop?shopid=";
                    str+=shopid;
                    str+="&shopauth=";
                    str+=shopauth;
                    //alert(str);
                    location.href=str;
                }else{
                    alert("未知错误，请重试！");
                }
            });
    }
);
