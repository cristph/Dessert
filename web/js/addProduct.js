/**
 * Created by cristph on 2016/5/29.
 */
$('#createPlan').click(
    function(){

        var picpath=document.getElementById("picture").value;
        var name=document.getElementById("name").value;
        var description=document.getElementById("description").value;
        var price=document.getElementById("price").value;

        var category="";
        var obj=document.getElementsByName("category");
        for(i=0;i<obj.length;i++) {
            if(obj[i].checked){
                category=obj[i].value;
            }
        }

        $.post(
            "/postProduct",
            {
                "picpath":picpath,
                "name":name,
                "description":description,
                "price":price,
                "category":category,
            },
            function(data){
                if(data=="method_execute_success"){
                    alert("新增产品成功！");
                    location.href="/productList";
                }else{
                    alert("未知错误，请重试");
                }
            }
        );




    }
);
