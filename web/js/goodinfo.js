/**
 * Created by cristph on 2016/3/16.
 */

$('#mui-amount-increase').click(
    function(){
        var input=document.getElementById("buy-amount");
        if(input.value==""){
            input.value=0;
        }
        var amount=parseInt(input.value);
        input.value=amount+1;
        if(input.value<0){
            input.value=0;
        }
    }
);

$('#mui-amount-decrease').click(
    function(){
        var input=document.getElementById("buy-amount");
        if(input.value==""){
            input.value=0;
        }
        var amount=parseInt(input.value);
        input.value=amount-1;
        if(input.value<0){
            input.value=0;
        }
    }
);

$('#J_LinkBasket').click(
    function(){

        var sgid=document.getElementById("good-id").value;
        var amount=document.getElementById("buy-amount").value;

        $.post(
            "/shoppingcart/add",
            {
                "sgid":sgid,
                "amount":amount
            },
            function(data){

                if(data=="method_execute_success"){
                    //location.href="/Dessert/shoppingcart";
                    window.open("/shoppingcart");
                }
            }
        );
    }
);
