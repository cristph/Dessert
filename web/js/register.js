/**
 * Created by cristph on 2016/2/19.
 */

function reloadVerifyCode(){
    document.getElementById('verifyCodeImage').setAttribute('src', '${pageContext.request.contextPath}/register/getVerifyCodeImage');
}

$('#submitForm').click(
    function(){
        var email=document.getElementById("email").value;
        var username=document.getElementById("nickname").value;
        var pre_password=document.getElementById("pre-password").value;
        var post_password=document.getElementById("post-password").value;
        var validationCode=document.getElementById("validationCode").value;

        var str="";
        if(email==""){
            str+="邮箱";
        }
        if(username==""){
            str+=" 昵称";
        }
        if(pre_password==""){
            str+=" 密码";
        }
        if(post_password==""){
            str+=" 确认密码";
        }
        if(validationCode==""){
            str+=" 验证码";
        }
        if(str!="") {
            str+="  不能为空！";
            alert(str);
            return;
        }

        if(pre_password!=post_password){
            alert("前后两次输入的密码不一致！");
            return;
        }

        $.post(
            "/register/post",
            {"email":email,
                "username":username,
                "password":pre_password,
                "validationCode":validationCode
            },
            function(data){
                label=document.getElementById("infoLabel");
                if(label!=null){
                    label.parentNode.removeChild(label);
                }
                label2=document.getElementById("infoLabel2");
                if(label2!=null){
                    label2.parentNode.removeChild(label2);
                }
                if(data=="Success"){
                    alert("注册成功");
                    location.href="/login";
                }else if(data=="Email Exists"){
                    label= document.createElement("label");
                    label.id="infoLabel";
                    label.innerText="该邮箱已被注册！";
                    document.getElementById("emaildiv").appendChild(label);
                }else if(data=="verifyCode empty!"){
                    label2= document.createElement("label");
                    label2.id="infoLabel2";
                    label2.innerText="验证码不能为空！";
                    document.getElementById("validiv").appendChild(label2);
                }else if(data=="verifyCode wrong!"){
                    label2= document.createElement("label");
                    label2.id="infoLabel2";
                    label2.innerText="验证码错误！";
                    document.getElementById("validiv").appendChild(label2);
                }
                else{
                    alert(data);
                }
            });
});
