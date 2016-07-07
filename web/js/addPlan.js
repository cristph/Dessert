/**
 * Created by cristph on 2016/3/19.
 */

$(function(){
    var chart1=document.getElementById("chart1");

    var chart=document.getElementById("chart1");

    if(chart1.value==""){
        //alert("Null Value");
        //no shop selected
    }else{
        //alert(chart1.value);
        //post and get data to load chart
        var div=document.getElementById("histogram1");
        div.style.display="block";

        var div=document.getElementById("histogram2");
        div.style.display="block";

        var div2=document.getElementById("bs-example");
        div2.style.display="block";

        $('#MeasureValueMenu').find('li').each(function(){
            $(this).click(function(){
                var node=document.getElementById("MeasureValue");
                node.innerText=$(this).children("a").attr("title");
                var span=document.createElement('span');
                span.setAttribute("class","caret");
                node.appendChild(span);
            });
        });

        $('#TimeIntervalMenu').find('li').each(function(){
            $(this).click(function(){
                var node=document.getElementById("TimeInterval");
                node.innerText=$(this).children("a").attr("title");
                var span=document.createElement('span');
                span.setAttribute("class","caret");
                node.appendChild(span);
            });
        });

        //var timeinterval=document.getElementById("TimeInterval").innerText;
        //var measure=document.getElementById("MeasureValue").innerText;
        //alert(timeinterval+measure);

        var xAxisData = [];
        var datas= [];

        var xAxisData2 = [];
        var datas2= [];
        var iniHistogram1=$.post(
            "/getPlanHistogramData",
            {
                "timeinterval":"Recent 3 Months",
                "measure":"num"
            },
            function(data){
                //alert(data);
                var set= $.parseJSON(data);
                xAxisData=set.strings;
                datas=set.doubles[0];
                var datasets=set.dataSets;
                for(var i=0;i<datasets.length;i++){
                    xAxisData2.push(datasets[i].name);
                    datas2.push(datasets[i].value);
                }
                //alert(xAxisData2.length+"|||"+datas2.length);
            }
        );
        iniHistogram1.done(function(){
            var histogram1=echarts.init(document.getElementById('histogram1'));
            var histogram2=echarts.init(document.getElementById('histogram2'));
            histogram1.setOption({
                title: {
                    text: '最近3个月各甜品销量排行',
                    textStyle:{
                        color:'#111'
                    },
                    left:'20%'
                },
                legend: {
                    data: ['甜品'],
                    align: 'left',
                    left: '10%'
                },
                toolbox: {
                    // y: 'bottom',
                    feature: {
                        magicType: {
                            type: ['stack', 'tiled']
                        },
                        dataView: {},
                        saveAsImage: {
                            pixelRatio: 2
                        }
                    }
                },
                tooltip: {},
                xAxis: {
                    data: xAxisData,
                    silent: false,
                    splitLine: {
                        show: false
                    }
                },
                yAxis: {
                },
                series: [{
                    name: '甜品',
                    type: 'bar',
                    data: datas,
                    animationDelay: function (idx) {
                        return idx * 10;
                    }
                }],
                animationEasing: 'elasticOut',
                animationDelayUpdate: function (idx) {
                    return idx * 5;
                }
            });
            histogram2.setOption({
                title: {
                    text: '最近3个月各甜品销量增长率排行',
                    textStyle:{
                        color:'#111'
                    },
                    left:'20%'
                },
                legend: {
                    data: ['甜品'],
                    align: 'left',
                    left: '10%'
                },
                toolbox: {
                    // y: 'bottom',
                    feature: {
                        magicType: {
                            type: ['stack', 'tiled']
                        },
                        dataView: {},
                        saveAsImage: {
                            pixelRatio: 2
                        }
                    }
                },
                tooltip: {},
                xAxis: {
                    data: xAxisData2,
                    silent: false,
                    splitLine: {
                        show: false
                    }
                },
                yAxis: {
                },
                series: [{
                    name: '甜品',
                    type: 'bar',
                    data: datas2,
                    animationDelay: function (idx) {
                        return idx * 10;
                    }
                }],
                animationEasing: 'elasticOut',
                animationDelayUpdate: function (idx) {
                    return idx * 5;
                }
            });
        });
    }


    if(chart.value==""){
        //alert("chart Null Value");
        //no good selected
    }else{
        //alert("chart:"+chart.value);
        //post and get data to load good chart
    }
});

$('#trueplanModal').on('show.bs.modal', function (event) {
    //alert("H");
    var div=document.getElementById("postPanel");
    var z=["ata_Cake","Atw_Cake","OeA_Cake","TUq_Cake","bBl_Cake","COK_Cake","MYD_Cake","MDW_Cake","pIK_Cake","MIR_Cake","KrN_Cake","AKf_Cake","SmF_Cake","IZu_Cake","Vbq_Cake","ync_Cake","xiN_Cake","FLl_Cake","Xpq_Cake","UkA_Cake","fBf_Cake","ImP_Cake","QUO_Cake","nEh_Cake","iLf_Cake","SXB_Cake","xaD_Cake","PDm_Cake","Tip_Cake","Kgt_Cake", "pjG_Biscuit","FCe_Biscuit","utu_Biscuit","QJo_Biscuit","XQU_Biscuit","MlB_Biscuit","EEx_Biscuit","sdS_Biscuit","zCd_Biscuit","OOj_Biscuit","jac_Biscuit","Ttm_Biscuit","QZm_Biscuit","ZkW_Biscuit","hur_Biscuit","Asg_Biscuit","ETa_Biscuit","VcA_Biscuit","lNe_Drink","JBS_Drink","YwV_Drink","kLO_Drink","VkF_Drink","qQY_Drink","auh_Drink","lAr_Drink","oEz_Drink","ZxN_Drink", "Ilp_Drink","DAi_Drink","NzS_Drink","fCp_Drink","GWO_Drink","imt_Drink","wsv_Drink","Xar_Drink","pyu_Drink","nWA_Drink","HRB_Drink","wFL_Drink","BWB_Drink","vNq_Drink","MzB_Drink"];

    var zpos=parseInt(72*Math.random());
    var zstring=z[zpos];

    var datas=[];
    var xAxisdata=[];
    var p;
    var pnum;
    var test= $.post(
        "/getPredicateData",
        {
            "good":zstring
        },
        function(data){
            var set= $.parseJSON(data);
            var length=set.length;
            for(var i=0;i<length-2;i++){
                datas.push(set[i]);
                xAxisdata.push(i+1);
            }
            p=set[length-2];
            pnum=parseInt(set[length-1]);

            //alert(datas);
            //alert(xAxisdata);
            //alert(p);
            //alert(pnum);
        }
    );

    test.done(function(){
        var cts=echarts.init(document.getElementById('predicateChart'));
        cts.setOption({
            title: {
                text: '双周销量变化趋势',
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:[zstring],
                right:'45%'
            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {},
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                },
                right:'10%'
            },
            xAxis:  {
                type: 'category',
                boundaryGap: false,
                data: xAxisdata
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: '{value}'
                }
            },
            series: [
                {
                    name:zstring,
                    type:'line',
                    data:datas,
                    markPoint: {
                        data: [
                            {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: '平均值'},
                            [{
                                symbol: 'arrow',
                                label: {
                                    normal: {
                                        formatter: '最大值'
                                    }
                                },
                                type: 'max',
                                name: '最大值'
                            }, {
                                symbol: 'circle',
                                x: '60%',
                                y: '50%'
                            }]
                        ]
                    }
                }
            ]
        });

        var div=document.getElementById("predicateChartText");
        div.innerText="采用二次平滑法预测销售量，当系数a="+p+"时标准差最小，此时预测值为"+pnum+"，故推荐每日可售数量为"+pnum+"/14="+pnum/14+"。";
        div.style.marginBottom="30px";
    });
    //div.style.backgroundColor='#567';
});

$('#ApplyFilter').click(function(){
    var timeinterval=document.getElementById("TimeInterval").innerText;
    var measure=document.getElementById("MeasureValue").innerText;

    //alert(timeinterval+measure);
    var str1="最近";
    var str2="";
    if(timeinterval=="Recent 3 Months"){
        str1+="3个月";
    }else if(timeinterval=="Recent 6 Months"){
        str1+="6个月";
    }else if(timeinterval=="Recent 3 Weeks"){
        str1+="3周";
    }else if(timeinterval=="Recent 2 Weeks"){
        str1+="2周";
    }

    if(measure=="Num"){
        str2+="销售量";
    }else if(measure=="TotalProfit"){
        str2+="毛利润";
    }else if(measure=="TotalPrice"){
        str2+="销售总额";
    }

    var xAxisData = [];
    var datas= [];

    var xAxisData2 = [];
    var datas2= [];
    var Histogram1=$.post(
        "/getPlanHistogramData",
        {
            "timeinterval":timeinterval,
            "measure":measure
        },
        function(data){
            //alert(data);
            var set= $.parseJSON(data);
            xAxisData=set.strings;
            datas=set.doubles[0];
            var datasets=set.dataSets;
            for(var i=0;i<datasets.length;i++){
                xAxisData2.push(datasets[i].name);
                datas2.push(datasets[i].value);
            }
            //alert(xAxisData2.length+"|||"+datas2.length);
        }
    );
   Histogram1.done(function(){
        var histogram1=echarts.init(document.getElementById('histogram1'));
        var histogram2=echarts.init(document.getElementById('histogram2'));
        histogram1.setOption({
            title: {
                text: str1+'各甜品'+str2+'排行',
                textStyle:{
                    color:'#111'
                },
                left:'20%'
            },
            legend: {
                data: ['甜品'],
                align: 'left',
                left: '10%'
            },
            toolbox: {
                // y: 'bottom',
                feature: {
                    magicType: {
                        type: ['stack', 'tiled']
                    },
                    dataView: {},
                    saveAsImage: {
                        pixelRatio: 2
                    }
                }
            },
            tooltip: {},
            xAxis: {
                data: xAxisData,
                silent: false,
                splitLine: {
                    show: false
                }
            },
            yAxis: {
            },
            series: [{
                name: '甜品',
                type: 'bar',
                data: datas,
                animationDelay: function (idx) {
                    return idx * 10;
                }
            }],
            animationEasing: 'elasticOut',
            animationDelayUpdate: function (idx) {
                return idx * 5;
            }
        });
        histogram2.setOption({
            title: {
                text: str1+'各甜品'+str2+'增长率排行',
                textStyle:{
                    color:'#111'
                },
                left:'20%'
            },
            legend: {
                data: ['甜品'],
                align: 'left',
                left: '10%'
            },
            toolbox: {
                // y: 'bottom',
                feature: {
                    magicType: {
                        type: ['stack', 'tiled']
                    },
                    dataView: {},
                    saveAsImage: {
                        pixelRatio: 2
                    }
                }
            },
            tooltip: {},
            xAxis: {
                data: xAxisData2,
                silent: false,
                splitLine: {
                    show: false
                }
            },
            yAxis: {
            },
            series: [{
                name: '甜品',
                type: 'bar',
                data: datas2,
                animationDelay: function (idx) {
                    return idx * 10;
                }
            }],
            animationEasing: 'elasticOut',
            animationDelayUpdate: function (idx) {
                return idx * 5;
            }
        });
    });
});

var buttons=document.getElementsByClassName("selectProduct");
var len=buttons.length;
for(var i=0;i<len;i++){
    buttons[i].addEventListener("click",function(){
        var input=document.getElementById("hiddenGood");
        //alert(input.value);
        var text=this.firstElementChild;
        var value=text.value;
        //alert(value);
        input.value=value;
        //alert(input.value);
        var dc=document.getElementById("chart");
        dc.value=value;
        return true;
    });
}

//$('#addShopPanTemp').click(function(){
//    var shopid=document.getElementById("hiddenShopId");
//    $.post(
//        "/Dessert/addPlanShop",
//        {
//            "shopid":shopid
//        },
//        function(data){
//            if(data=="method_execute_success"){
//                ale\\\\\\\\rt("添加成功！");
//                location.href="/Dessert//addGoodProject?picpath=";
//            }else{
//                alert("未知错误，请重试");
//            }
//        }
//    );\
//});

$('#createPlanProduct').click(function(){
    var gid=document.getElementById("hiddenGood").value;
    var beginDate=document.getElementById("beginDate").value;
    var deadline=document.getElementById("deadline").value;
    var price=document.getElementById("price").value;
    var num=document.getElementById("num").value;

    var dc=document.getElementById("chart");
    dc.value="";

    //alert(gid+"|"+beginDate+"|"+deadline+"|"+price+"|"+num);

    $.post(
        "/createPlanProduct",
        {
            "gid":gid,
            "beginDate":beginDate,
            "deadline":deadline,
            "price":price,
            "num":num
        },
        function(data){
            if(data=="method_execute_success"){
                alert("添加成功！");
                location.href="/addGoodProject?picpath=";
            }else{
                alert("未知错误，请重试");
            }
        }
    )
});

//$('#createProctPlan').click(
//    function(){
//
//        var picpath=document.getElementById("picture").value;
//        var name=document.getElementById("name").value;
//        var deadline=document.getElementById("deadline").value;
//        var description=document.getElementById("description").value;
//        var price=document.getElementById("price").value;
//
//        var category="";
//        var obj=document.getElementsByName("category");
//        for(i=0;i<obj.length;i++) {
//            if(obj[i].checked){
//                category=obj[i].value;
//            }
//        }
//
//        var num=document.getElementById("num").value;
//
//        $.post(
//            "/Dessert/postPlan",
//            {
//                "picpath":picpath,
//                "name":name,
//                "deadline":deadline,
//                "description":description,
//                "price":price,
//                "category":category,
//                "num":num
//            },
//            function(data){
//                if(data=="method_execute_success"){
//                    alert("提交成功，请等待总经理审批！");
//                    location.href="/Dessert/saleplanlist";
//                }else{
//                    alert("未知错误，请重试");
//                }
//            }
//        );
//
//
//
//
//    }
//);
