/**
 * Created by cristph on 2016/3/19.
 */

$('#buy').click(
    function(){

        var vid=document.getElementById("bid").value;
        var money=document.getElementById('money').value;
        var pswd=document.getElementById('pswd').value;

        str="";
        if(vid==""){
            str+="会员卡号";
        }
        if(pswd==""){
            str+=" 密码";
        }
        if(str!=""){
            str+="不能为空";
            alert(str);
            return;
        }

        $.post(
            "/sellpost",
            {
                "vid":vid,
                "money":money,
                "pswd":pswd
            },
            function(data){
                if(data=="id_or_pswd_error"){
                    alert("会员密码错误！");
                }else if(data=="account_money_not_enough"){
                    alert("会员卡余额不足！请先充值！");
                }else if(data=="method_execute_fail"){
                    alert("未知错误，请重试！");
                }else if(data=="method_execute_success"){
                    alert("销售成功！");
                    location.href="/Dessert/sell";
                }else if(data=="not_active"){
                    alert("请先激活会员！");
                }else{
                    alert("服务器错误！");
                }
            }
        );

    }
);