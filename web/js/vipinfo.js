/**
 * Created by cristph on 2016/3/13.
 */


$('#invoke').click(
    function(){
        var money=document.getElementById('money').value;
        var bid=document.getElementById('bid').value;
        var pswd=document.getElementById('pswd').value;

        var str="";
        if(money==""){
            str+="充值金额";
        }
        if(bid==""){
            str+=" 银行卡号";
        }
        if(pswd==""){
            str+=" 密码";
        }
        if(str!=""){
            str+=" 不能为空！"
            return;
        }

        var parttern1=/^[1-9]\d*$/;
        var parttern2=/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
        var flag1=parttern1.test(bid);
        var flag2=parttern2.test(money);
        if(!flag2){
           str+="请输入正确的充值金额！";
        }else{
            if(money<200){
                str+="至少充值200元！";
            }
        }
        if(!flag1){
            str+="请输入正确的银行卡号！";
        }
        if(str!=""){
            alert(str);
            return;
        }

        $.post(
            "/invokevip",
            {"money":money,
                "bid":bid,
                "pswd":pswd
            },
            function(data){
                if(data=="id_or_pswd_error"){
                    alert("银行卡号或密码错误！");
                }else if(data=="account_money_not_enough"){
                    alert("银行账户余额不足！");
                }else if(data=="method_execute_fail"){
                    alert("未知错误，请重试！");
                }else if(data=="method_execute_success"){
                    alert("充值并激活会员成功！");
                    location.href="/chargerecord";
                }else{
                    alert("服务器错误！");
                }
            }
        );

    }
);


$('#charge').click(
    function(){
        var money=document.getElementById('cmoney').value;
        var bid=document.getElementById('cbid').value;
        var pswd=document.getElementById('cpswd').value;

        var str="";
        if(money==""){
            str+="充值金额";
        }
        if(bid==""){
            str+=" 银行卡号";
        }
        if(pswd==""){
            str+=" 密码";
        }
        if(str!=""){
            str+=" 不能为空！"
            return;
        }

        var parttern1=/^[1-9]\d*$/;
        var parttern2=/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
        var flag1=parttern1.test(bid);
        var flag2=parttern2.test(money);
        if(!flag2){
            str+="请输入正确的充值金额！";
        }
        if(!flag1){
            str+="请输入正确的银行卡号";
        }
        if(str!=""){
            alert(str);
            return;
        }

        $.post(
            "/chargevip",
            {"money":money,
                "bid":bid,
                "pswd":pswd
            },
            function(data){
                if(data=="id_or_pswd_error"){
                    alert("银行卡号或密码错误！");
                }else if(data=="account_money_not_enough"){
                    alert("银行账户余额不足！");
                }else if(data=="method_execute_fail"){
                    alert("未知错误，请重试！");
                }else if(data=="method_execute_success"){
                    alert("充值成功！");
                    location.href="/chargerecord";
                }else{
                    alert("服务器错误！");
                }
            }
        );

    }
);
