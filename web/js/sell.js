/**
 * Created by cristph on 2016/3/19.
 */

$("#sell").click(
    function(){

        var gid=document.getElementById("gid").value;
        var num=document.getElementById("num").value;

        $.post(
            "/sellgood",
            {
                "gid":gid,
                "num":num
            },
            function(data){
                alert(data);
            }
        );
    }
);