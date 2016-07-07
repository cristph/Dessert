/**
 * Created by cristph on 2016/3/8.
 */




$('#savesetting').click(
    function(){
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

        $.post(
            "/savesetting",
            {"name":name,
                "sex":sex,
                "address":address,
                "birth":birth,
                "selfintro":selfintro,
                "contact":contact
            },
            function(data){
                if(data=="Success"){
                    alert("修改并保存成功！");
                    location.href="/setting";
                }else{
                    alert("修改失败！请重新修改");
                }
            });
    });
