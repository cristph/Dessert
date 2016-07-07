/**
 * Created by cristph on 2016/3/12.
 */

$('#savepswd').click(
    function(){

        var originPswd=document.getElementById("originPswd").value;
        var newPswd=document.getElementById("newPswd").value;
        var sureNewPswd=document.getElementById("sureNewPswd").value;

        var str="";
        if(originPswd==""){
            str+="原密码";
        }
        if(newPswd==""){
            str+=" 新密码";
        }
        if(sureNewPswd==""){
            str+=" 确认新密码";
        }
        if(str!=""){
            str+=" 不能为空！";
            alert(str);
            return;
        }

        if(newPswd!=sureNewPswd){
            alert("前后两次输入的 新密码 不一致！");
            return;
        }

        $.post(
            "/resetpswd/post",
            {"originPswd":originPswd,
                "newPswd":newPswd
            },
            function(data){
                if(data=="method_execute_success"){
                    alert("密码修改成功，请重新登录~");
                    location.href="/login";
                }else if(data="wrong_pswd"){
                    alert("原密码输入错误，请重新输入！");
                }else{
                    alert("未知错误，请重试！");
                }
            }
        );
    }
);
