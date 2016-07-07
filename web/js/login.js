/**
 * Created by cristph on 2016/2/16.
 */

$('#submitLogin').click(
    function(){
        var email=document.getElementById("email").value;
        var password=document.getElementById("password").value;
        var str="";
        if(email==""){
            str+=" 邮箱";
        }
        if(password==""){
            str+=" 密码";
        }
        if(str!="") {
            str+="  不能为空！";
            alert(str);
            return;
        }

        $.post(
            "/login/post",
            {"email":email,
                "password":password
            },
            function(data){
                label=document.getElementById("infoLabel");
                if(label!=null){
                    label.parentNode.removeChild(label);
                }
                if(data=="Unknown Account!"){
                    label= document.createElement("label");
                    label.id="infoLabel";
                    label.innerText="用户名或密码错误！";
                    //document.getElementById("emaildiv").appendChild(label);
                    document.getElementById("pswddiv").appendChild(label);
                }else if(data=="Unknown Error"){
                    alert("未知错误，请尝试重新登录！");
                } else if(data=="Login Success"){
                    location.href="/login/route";
                }
        });
});