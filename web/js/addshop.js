/**
 * Created by cristph on 2016/3/18.
 */

$('#openshop').click(
    function(){
        var shopname=document.getElementById("shopname").value;
        var address=document.getElementById("address").value;
        var contact=document.getElementById("contact").value;

        var str="";
        if(shopname==""){
            str+="店名";
        }
        if(address==""){
            str+=" 地址";
        }
        if(contact==""){
            str+=" 联系电话";
        }
        if(str!=""){
            str+=" 不能为空";
            alert(str);
            return;
        }

        $.post(
            "/openshop",
            {
                "shopname":shopname,
                "address":address,
                "contact":contact
            },
            function(data){
              if(data=="method_execute_success"){
                  alert("增设店铺成功！");
                  location.href="/shoplist";
              } else{
                  alert("未知错误，请重试");
              }
            }
        );
    }
);