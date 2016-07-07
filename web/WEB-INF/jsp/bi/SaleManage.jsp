<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/6/9
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="Ease Project">
    <meta name="author" content="cristph">
    <link rel="icon" href="../../favicon.ico">

    <title>Dessert | 销售管理</title>

    <%--<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/store.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/shoppingcart.css" rel="stylesheet">


    <!-- jQuery -->
    <script type="text/javascript" src="dependents/jquery/jquery.min.js"></script>
    <!-- bootstrap -->
    <script type="text/javascript" src="dependents/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="dependents/bootstrap/css/bootstrap.min.css" />
    <!--[if lt IE 9]>
    <script src="dependents/bootstrap/plugins/ie/html5shiv.js"></script>
    <script src="dependents/bootstrap/plugins/ie/respond.js"></script>
    <![endif]-->
    <!--[if lt IE 8]>
    <script src="dependents/bootstrap/plugins/ie/json2.js"></script>
    <![endif]-->
    <!-- font-awesome -->
    <link rel="stylesheet" type="text/css" href="dependents/fontAwesome/css/font-awesome.min.css" media="all" />
    <!-- DLShouWen Grid -->
    <script type="text/javascript" src="js/dlshouwen.grid.min.js"></script>
    <script type="text/javascript" src="i18n/en.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dlshouwen.grid.min.css" />
    <!-- datePicker -->
    <script type="text/javascript" src="dependents/datePicker/WdatePicker.js" defer="defer"></script>
    <link rel="stylesheet" type="text/css" href="dependents/datePicker/skin/WdatePicker.css" />
    <link rel="stylesheet" type="text/css" href="dependents/datePicker/skin/default/datepicker.css" />

    <link rel="stylesheet" type="text/css" href="css/k.css">
</head>

<body>

<nav class="navbar navbar-fixed-top navbar-custom">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Dessert</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/logout">登出</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="outer-frame">
    <div class="container inner-frame">
        <div class="row main-frame">

            <div class="col-sm-1 frame-left">
                <a href="${pageContext.request.contextPath}/permitplan"><div class="setting-left">审批产品计划</div></a>
                <a href="${pageContext.request.contextPath}/managerOLAP"><div class="setting-left">经营统计</div></a>
                <a href="${pageContext.request.contextPath}/getRFM"><div class="setting-left">客户关系管理</div></a>
                <a href="${pageContext.request.contextPath}/saleManageView"><div class="setting-left">销售管理</div></a>
            </div>

            <div class="col-sm-11 frame-middle">
                <div class="title-box">时间与地域分析</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <div id="areaP" style="width: 1000px;height: 500px"></div>
                        <div style="min-height: 70px"></div>
                        <div id="timeP" style="width: 800px;height: 500px"></div>
                    </form>
                </div>

                <div class="title-box">购物篮---关联规则分析</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <b>最小置信度：</b><input id="CompareValue1" type="text" class="form-control" style="width: 17%;display: inline-block" placeholder="MinConfidence">
                        <b>    发现关联规则数：</b><input id="CompareValue2" type="text" class="form-control" style="width: 15%;display: inline-block" placeholder="RulesNum">
                        <button type="button" class="btn" style="background-color: #ffcd29;" id="apply"><a style="color: black" href="javascript:void(0)">应用并分析</a></button>
                        <div style="min-height: 25px;"></div>
                        <div id="aprioriResult" class="well">
                            销售关联规则分析结果展示
                        </div>
                        <div id="analysisExample" class="well">
                        <p style="color: black;font-weight: bolder;">分析示例:</p>
                        <div style="color: #ff9211">
                            以规则" time=pm14_16 1022 ==> biscuit=T 1022 conf:(1)"为例，在time=pm14_16发生购物的情况下(下午14点至16点)，我们有
                            置信度 conf:(1)去相信，会购买饼干(biscuit)，这里confidence=1，说明一定会发生。数字1022说明有1022条记录支持。
                        </div>
                        <div style="color: #ff9211">
                            那么这给我们决策带来了帮助吗？
                            聪明的你一定会想到：在傍晚14—16时段，在线下商铺将饼干放在醒目位置，或者饼干减价促销；在线上商铺，你想怎么促销都行，抓住关联规则即可。
                        </div>
                    </div>

                        <div style="min-height: 50px;"></div>
                        <div style="color: black;font-weight: bolder">可用于创建特价包的关联规则：</div>
                        <div style="min-height: 15px;"></div>
                        <div id="package" class="well">
                            暂无可用规则
                        </div>
                        <button type="button" class="btn" style="background-color: #ffcd29;" id="ctpackage"><a style="color: black" href="javascript:void(0)">创建特价包</a></button>
                    </form>
                </div>

                <div class="title-box">客户购买习惯---聚类分析</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <b>初始随机种子：</b><input id="Value1" type="text" class="form-control" style="width: 15%;display: inline-block" placeholder="Seed">
                        <b>    分类组数：</b><input id="Value2" type="text" class="form-control" style="width: 15%;display: inline-block" placeholder="ClusterNum">
                        <button type="button" class="btn" style="background-color: #ffcd29;" id="applyCulster"><a style="color: black" href="javascript:void(0)">应用并分析</a></button>
                        <div style="min-height: 25px;"></div>
                        <div  >
                            <pre id="kmeansResult">
                            客户购买习惯聚类分析结果展示
                            </pre>
                        </div>

                        <div style="min-height: 70px"></div>
                        <div style="color: black;font-weight:bolder;font-size:18px;display: none" id="title">客户聚类结果：</div>
                        <div id="gridContainer_2_2_5" class="dlshouwen-grid-container"></div>
                        <div id="gridToolBarContainer_2_2_5" class="dlshouwen-grid-toolbar-container"></div>

                        <div style="min-height: 70px"></div>
                        <button type="button" class="btn" style="background-color: #ffcd29;"><a style="color: black" href="javascript:void(0)">一键用户个性化产品推送</a></button>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <a href="/">Home</a>
                <a href="/terms" target="_blank">Terms</a>
                <a href="/privacy" target="_blank">Privacy</a>
                <a href="https://twitter.com/wiplohq" target="_blank" rel="nofollow">Twitter</a>
                <a href="mailto:team@wiplo.com?subject=Hi Wiplo Team!" rel="nofollow">Contact</a>
                <small>Architect @ Cristph</small>
            </div>
        </div>
    </div>
</footer>


<%--<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>--%>
<%--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>
<script src="js/echarts.min.js"></script>
<script src="js/china.js"></script>
<script>

    var areaChart=echarts.init(document.getElementById("areaP"));
    option = {
        title: {
            text: '最近一天甜点订单量',
            left: 'center',
            textStyle:{
                color:'#000'
            }
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data:['cake','biscuit','drink']
        },
        visualMap: {
            min: 0,
            max: 2500,
            left: 'left',
            top: 'bottom',
            text: ['高','低'],           // 文本，默认为数值文本
            calculable: true
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
            feature: {
                dataView: {readOnly: false},
                restore: {},
                saveAsImage: {}
            }
        },
        series: [
            {
                name: 'cake',
                type: 'map',
                mapType: 'china',
                roam: false,
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
                    {name: '北京',value: Math.round(Math.random()*400+200) },
                    {name: '天津',value: Math.round(Math.random()*400+200) },
                    {name: '上海',value: Math.round(Math.random()*400+200) },
                    {name: '重庆',value: Math.round(Math.random()*400+100) },
                    {name: '河北',value: Math.round(Math.random()*300+100) },
                    {name: '安徽',value: Math.round(Math.random()*400+100) },
                    {name: '浙江',value: Math.round(Math.random()*400+200) },
                    {name: '江西',value: Math.round(Math.random()*400+200) },
                    {name: '山西',value: Math.round(Math.random()*300+100) },
                    {name: '吉林',value: Math.round(Math.random()*400+200) },
                    {name: '福建',value: Math.round(Math.random()*400+200) },
                    {name: '广东',value: Math.round(Math.random()*400+200) },
                    {name: '四川',value: Math.round(Math.random()*400+100) },
                    {name: '湖南',value: Math.round(Math.random()*400+100) },
                    {name: '河南',value: Math.round(Math.random()*400+100) },
                    {name: '河北',value: Math.round(Math.random()*400+100) },
                    {name: '山东',value: Math.round(Math.random()*400+100) },
                    {name: '天津',value: Math.round(Math.random()*400+100) },
                    {name: '江苏',value: Math.round(Math.random()*400+100) },
                    {name: '湖北',value: Math.round(Math.random()*200+100) },
                    {name: '辽宁',value: Math.round(Math.random()*300+100) },
                ]
            },
            {
                name: 'biscuit',
                type: 'map',
                mapType: 'china',
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
                    {name: '北京',value: Math.round(Math.random()*200+200) },
                    {name: '天津',value: Math.round(Math.random()*200+200) },
                    {name: '上海',value: Math.round(Math.random()*200+200) },
                    {name: '重庆',value: Math.round(Math.random()*200+100) },
                    {name: '河北',value: Math.round(Math.random()*200+200) },
                    {name: '安徽',value: Math.round(Math.random()*200+100) },
                    {name: '浙江',value: Math.round(Math.random()*200+200) },
                    {name: '江西',value: Math.round(Math.random()*200+200) },
                    {name: '山西',value: Math.round(Math.random()*200+100) },
                    {name: '吉林',value: Math.round(Math.random()*200+100) },
                    {name: '福建',value: Math.round(Math.random()*200+200) },
                    {name: '广东',value: Math.round(Math.random()*200+200) },
                    {name: '四川',value: Math.round(Math.random()*200+200) },
                    {name: '湖南',value: Math.round(Math.random()*200+100) },
                    {name: '河南',value: Math.round(Math.random()*200+100) },
                    {name: '河北',value: Math.round(Math.random()*200+100) },
                    {name: '山东',value: Math.round(Math.random()*200+100) },
                    {name: '天津',value: Math.round(Math.random()*100+100) },
                    {name: '江苏',value: Math.round(Math.random()*400+100) },
                    {name: '湖北',value: Math.round(Math.random()*200+100) },
                    {name: '辽宁',value: Math.round(Math.random()*300+100) },
                ]
            },
            {
                name: 'drink',
                type: 'map',
                mapType: 'china',
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
                    {name: '北京',value: Math.round(Math.random()*400+200) },
                    {name: '天津',value: Math.round(Math.random()*400+200) },
                    {name: '上海',value: Math.round(Math.random()*400+200) },
                    {name: '重庆',value: Math.round(Math.random()*200+200) },
                    {name: '河北',value: Math.round(Math.random()*400+200) },
                    {name: '安徽',value: Math.round(Math.random()*300+100) },
                    {name: '浙江',value: Math.round(Math.random()*400+200) },
                    {name: '江西',value: Math.round(Math.random()*400+200) },
                    {name: '山西',value: Math.round(Math.random()*300+100) },
                    {name: '吉林',value: Math.round(Math.random()*400+200) },
                    {name: '福建',value: Math.round(Math.random()*400+200) },
                    {name: '广东',value: Math.round(Math.random()*400+200) },
                    {name: '四川',value: Math.round(Math.random()*300+100) },
                    {name: '湖南',value: Math.round(Math.random()*400+100) },
                    {name: '河南',value: Math.round(Math.random()*400+100) },
                    {name: '河北',value: Math.round(Math.random()*400+100) },
                    {name: '山东',value: Math.round(Math.random()*400+100) },
                    {name: '天津',value: Math.round(Math.random()*400+100) },
                    {name: '江苏',value: Math.round(Math.random()*400+200) },
                    {name: '湖北',value: Math.round(Math.random()*400+100) },
                    {name: '辽宁',value: Math.round(Math.random()*300+100) },
                ]
            }
        ]
    };
    areaChart.setOption(option);

    var timeChart=echarts.init(document.getElementById("timeP"));
    option2 = {
        title:{
            text: '订单随时间分布散点图',
            left: 'center',
            textStyle:{
                color:'#000'
            }
        },
        tooltip : {
            trigger: 'axis',
            showDelay : 0,
            axisPointer:{
                show: true,
                type : 'cross',
                lineStyle: {
                    type : 'dashed',
                    width : 1
                }
            },
            zlevel: 1
        },
        legend: {
            data:['orderPrice']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataZoom : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        xAxis : [
            {
                name:'时间(24H制)',
                nameGap:10,
                type : 'value',
                scale:true
            }
        ],
        yAxis : [
            {
                name:'订单总价',
                type : 'value',
                scale:true
            }
        ],
        series : [
            {
                name:'OrderPrice',
                type:'scatter',
                large: true,
                symbolSize: 3,
                data: (function () {
                    var  pp=[0.2,0.2,0.5,0.5,0.5,0.5,0.5,0.3,0.3,0.3];
                    var qz=[0.2,0.2,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8];
                    var d = [];
                    var len = 10000;
                    var x = 0;
                    var y=0;
                    for(var j=0;j<250;j++){
                        x=6+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }
                    for(var i=7;i<=8;i++){
                        for(var j=0;j<1250;j++){
                            x=i+Math.random();
                            var zp=Math.round(Math.random()*10);
                            var pz=pp[zp];
                            if(pz==0.2){
                                y=Math.round(10+10*Math.random());
                            }else if(pz==0.5){
                                y=Math.round(20+15*Math.random());
                            }else if(pz==0.3){
                                if(qz[Math.round(Math.random()*10)]==0.8){
                                    y=Math.round(30+10*Math.random());
                                }else{
                                    y=Math.round(40+20*Math.random());
                                }
                            }
                            d.push([x,y]);
                        }
                    }
                    for(var j=0;j<250;j++){
                        x=9+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }

                    for(var j=0;j<350;j++){
                        x=10+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }

                    for(var i=11;i<=12;i++){
                        for(var j=0;j<750;j++){
                            x=i+Math.random();
                            var zp=Math.round(Math.random()*10);
                            var pz=pp[zp];
                            if(pz==0.2){
                                y=Math.round(10+10*Math.random());
                            }else if(pz==0.5){
                                y=Math.round(20+15*Math.random());
                            }else if(pz==0.3){
                                if(qz[Math.round(Math.random()*10)]==0.8){
                                    y=Math.round(30+10*Math.random());
                                }else{
                                    y=Math.round(40+20*Math.random());
                                }
                            }
                            d.push([x,y]);
                        }
                    }

                    for(var j=0;j<150;j++){
                        x=13+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }

                    for(var j=0;j<50;j++){
                        x=14+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }

                    for(var j=0;j<150;j++){
                        x=15+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }

                    for(var j=0;j<550;j++){
                        x=16+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }


                    for(var i=17;i<=18;i++){
                        for(var j=0;j<1250;j++){
                            x=i+Math.random();
                            var zp=Math.round(Math.random()*10);
                            var pz=pp[zp];
                            if(pz==0.2){
                                y=Math.round(10+10*Math.random());
                            }else if(pz==0.5){
                                y=Math.round(20+15*Math.random());
                            }else if(pz==0.3){
                                if(qz[Math.round(Math.random()*10)]==0.8){
                                    y=Math.round(30+10*Math.random());
                                }else{
                                    y=Math.round(40+20*Math.random());
                                }
                            }
                            d.push([x,y]);
                        }
                    }

                    for(var j=0;j<250;j++){
                        x=i+Math.random();
                        var zp=Math.round(Math.random()*10);
                        var pz=pp[zp];
                        if(pz==0.2){
                            y=Math.round(10+10*Math.random());
                        }else if(pz==0.5){
                            y=Math.round(20+15*Math.random());
                        }else if(pz==0.3){
                            if(qz[Math.round(Math.random()*10)]==0.8){
                                y=Math.round(30+10*Math.random());
                            }else{
                                y=Math.round(40+20*Math.random());
                            }
                        }
                        d.push([x,y]);
                    }
//                    while (len--) {
//                        x = (Math.random() * 10).toFixed(3) - 0;
//                        d.push([
//                            x,
//                            //Math.random() * 10
//                            (Math.sin(x) - x * (len % 2 ? 0.1 : -0.1) * Math.random()).toFixed(3) - 0
//                        ]);
//                    }
                    //console.log(d)
                    return d;
                })()
            },
        ]
    };
    timeChart.setOption(option2);



    $('#apply').click(function(){
        var conf=document.getElementById("CompareValue1").value;
        var rulesNum=document.getElementById("CompareValue2").value;


//        alert(conf+"|"+rulesNum);
        $.post(
                "/saleManage",
                {
                    "confidence":conf,
                    "rulesNum":rulesNum
                },
                function(data){
//                    alert(data);
                    var div=document.getElementById("aprioriResult");
                    var str=data.split('||');
                    div.innerText=str[0];

                    var div2=document.getElementById("package");
                    if(str[1].length==0){
                        div2.innerText= '暂无可用规则';
                    }else {
                        div2.innerText=str[1];
                    }
                }
        );
    });

    $('#applyCulster').click(function(){
        var seed=document.getElementById("Value1").value;
        var clusterNum=document.getElementById("Value2").value;

        var div=document.getElementById("gridContainer_2_2_5");
        while(div.hasChildNodes()) {
            div.removeChild(div.firstChild);
        }

        var txt;

        var z=$.post(
                "/getClusterData",
                {
                    "seed":seed,
                    "clusterNum":clusterNum
                },
                function(data){
                    var div=document.getElementById("kmeansResult");
                    var text=data.split("||");
                    div.innerText=text[0];
                    txt= $.parseJSON(text[1]);
//                    alert(text[1]);
                }
        );

        z.done(function(){
//            alert("z.done");
            var div=document.getElementById("title");
            div.style.display="block";

            var gridColumns_2_2_5 = [
                {id:'customerid', title:'用户编号', type:'number', columnClass:'text-center', fastQuery:true, fastQueryType:'eq'},
                {id:'sex', title:'性别', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'eq'},
                {id:'marriage', title:'婚姻状态', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'eq'},
                {id:'time', title:'时间', type:'string',  columnClass:'text-center',fastQuery:true, fastQueryType:'eq'},
                {id:'cream_cake', title:'是否购买cream_cake', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'eq' },
                {id:'chocolate_cake', title:'是否购买chocolate_cake', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'eq' },
                {id:'sweet_bread', title:'是否购买sweet_bread', type:'string', columnClass:'text-center',fastQuery:true, fastQueryType:'eq' },
                {id:'salty_bread', title:'是否购买salty_bread', type:'string',  columnClass:'text-center',fastQuery:true, fastQueryType:'eq' },
                {id:'biscuit', title:'是否购买biscuit', type:'string', columnClass:'text-center',fastQuery:true, fastQueryType:'eq' },
                {id:'milky_tea', title:'是否购买milky_tea', type:'string', columnClass:'text-center',fastQuery:true, fastQueryType:'eq' },
                {id:'black_tea', title:'是否购买black_tea', type:'string', columnClass:'text-center',fastQuery:true, fastQueryType:'eq' },
                {id:'milk', title:'是否购买milk', type:'string', columnClass:'text-center',fastQuery:true, fastQueryType:'eq' },
                {id:'cluster', title:'分组编号', type:'number', columnClass:'text-center',fastQuery:true, fastQueryType:'eq' }
            ];
            var gridOption_2_2_5 = {
                lang : 'zh-cn',
                ajaxLoad : false,
                datas : txt,
                exportFileName : '客户购买习惯_聚类分析',
                columns : gridColumns_2_2_5,
                gridContainer : 'gridContainer_2_2_5',
                toolbarContainer : 'gridToolBarContainer_2_2_5',
                tools : 'export[excel,csv,pdf,txt]',
                pageSize : 10,
                pageSizeLimit : [10, 20, 50]
            };
            var grid_2_2_5 = $.fn.dlshouwen.grid.init(gridOption_2_2_5);
            $(function(){
                grid_2_2_5.load();
            });
        });
    });
</script>
</body>
</html>
</body>
</html>
