/**
 * Created by cristph on 2016/3/16.
 */

$('#buy').click(
    function(){

        var money=document.getElementById('money').value;
        var pswd=document.getElementById('pswd').value;

        if(pswd==""){
            alert("密码不能为空！");
            return;
        }

        $.post(
            "/shoppingcart/buy",
            {"money":money,
                "pswd":pswd
            },
            function(data){
                if(data=="id_or_pswd_error"){
                    alert("会员密码错误！");
                }else if(data=="account_money_not_enough"){
                    alert("会员卡余额不足！请先充值！");
                    location.href="/vipinfo";
                }else if(data=="method_execute_fail"){
                    alert("未知错误，请重试！");
                }else if(data=="method_execute_success"){
                    alert("购买成功！");
                    location.href="/buyrecord";
                }else if(data=="not_active"){
                    alert("请先激活会员！");
                    location.href="/vipinfo";
                }else{
                    alert("服务器错误！");
                }
            }
        );

    }
);
