/**
 * Created by cristph on 2015/10/28.
 */

$(function(){
    var nodelist=document.getElementsByClassName('setting-left');
    var i;
    var num=nodelist.length;
    for(i=0;i<num;i++){
        nodelist[i].addEventListener('mouseover',areaIn,false);
        nodelist[i].addEventListener('mouseout',areaOut,false);
    }
});

function areaIn(){
    this.style.backgroundColor='rgba(153,153,153,0.3)';
}

function areaOut(){
    this.style.background='none';
}
