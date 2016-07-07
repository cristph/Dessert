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

    <title>Dessert | 对比分析</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/store.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/shoppingcart.css" rel="stylesheet">
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
                <div class="title-box">对比分析</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <div style="min-height: 15px"></div>
                        <div class="bs-example">
                            <ul class="nav nav-pills" role="tablist">
                                <li id="ApplyHistogramFilter" role="presentation" class="active"><a href="javascript:void(0)">Apply Filter</a></li>
                                <li role="presentation" class="dropdown">
                                    <a id="MeasureValue" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Measure Value
                                        <span class="caret"></span>
                                    </a>
                                    <ul id="MeasureValueMenu" class="dropdown-menu" aria-labelledby="drop4">
                                        <li><a href="javascript:void(0)" title="TotalProfit">TotalProfit</a></li>
                                        <li><a href="javascript:void(0)" title="TotalCost">TotalCost</a></li>
                                        <li><a href="javascript:void(0)" title="TotalPrice">TotalPrice</a></li>
                                    </ul>
                                </li>
                                <li role="presentation" class="dropdown">
                                    <a id="CompareValue" href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Compare Value
                                        <span class="caret"></span>
                                    </a>
                                    <ul id="CompareValueMenu" class="dropdown-menu" aria-labelledby="drop5">
                                        <li><a href="javascript:void(0)" title="Sex">Sex</a></li>
                                        <li><a href="javascript:void(0)" title="PayWay">PayWay</a></li>
                                        <li><a href="javascript:void(0)" title="Online">Online</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="javascript:void(0)" title="Category">Category</a></li>
                                        <li><a href="javascript:void(0)" title="Province">Province</a></li>
                                        <li><a href="javascript:void(0)" title="ShopName">ShopName</a></li>
                                    </ul>
                                </li>
                                <input id="CompareValue1" type="text" class="form-control" style="width: 15%;display: none" placeholder="CompareValue1">
                                <input id="CompareValue2" type="text" class="form-control" style="width: 15%;display: none" placeholder="CompareValue2">
                            </ul> <!-- /pills -->
                        </div>
                        <div style="min-height: 50px"></div>
                        <div id="histogramChart" style="width: 800px;height:400px;"></div>
                        <div style="min-height: 50px"></div>
                        <div class="bs-example">
                            <ul class="nav nav-pills" role="tablist">
                                <li id="ApplyPieFilter" role="presentation" class="active"><a href="javascript:void(0)">Apply Filter</a></li>
                                <li role="presentation" class="dropdown">
                                    <a id="InnerValue" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Inner Value
                                        <span class="caret"></span>
                                    </a>
                                    <ul id="InnerValueMenu" class="dropdown-menu" aria-labelledby="drop4">
                                        <li><a href="javascript:void(0)" title="Sex">Sex</a></li>
                                        <li><a href="javascript:void(0)" title="PayWay">PayWay</a></li>
                                        <li><a href="javascript:void(0)" title="Online">Online</a></li>
                                        <li><a href="javascript:void(0)" title="Category">Category</a></li>
                                    </ul>
                                </li>
                                <li role="presentation" class="dropdown">
                                <a id="OuterValue" href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    Compare Value
                                    <span class="caret"></span>
                                </a>
                                <ul id="OuterValueMenu" class="dropdown-menu" aria-labelledby="drop5">
                                    <li><a href="javascript:void(0)" title="Sex">Sex</a></li>
                                    <li><a href="javascript:void(0)" title="PayWay">PayWay</a></li>
                                    <li><a href="javascript:void(0)" title="Online">Online</a></li>
                                    <li><a href="javascript:void(0)" title="Category">Category</a></li>
                                </ul>
                            </li>
                                <li role="presentation" class="dropdown">
                                    <a id="PieMeasureValue" href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Measure Value
                                        <span class="caret"></span>
                                    </a>
                                    <ul id="PieMeasureValueMenu" class="dropdown-menu" aria-labelledby="drop5">
                                        <li><a href="javascript:void(0)" title="TotalProfit">TotalProfit</a></li>
                                        <li><a href="javascript:void(0)" title="TotalCost">TotalCost</a></li>
                                        <li><a href="javascript:void(0)" title="TotalPrice">TotalPrice</a></li>
                                    </ul>
                                </li>
                            </ul> <!-- /pills -->
                        </div>
                        <div style="min-height: 50px"></div>
                        <div id="pieChart" style="width: 800px;height:400px;"></div>
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


<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/echarts.min.js"></script>
<script>
    //
    //直方图
    //
    $('#MeasureValueMenu').find('li').each(function(){
        $(this).click(function(){
            var node=document.getElementById("MeasureValue");
            node.innerText=$(this).children("a").attr("title");
            var span=document.createElement('span');
            span.setAttribute("class","caret");
            node.appendChild(span);
        });
    });
    $('#CompareValueMenu').find('li').each(function(){
        $(this).click(function(){
            var node=document.getElementById("CompareValue");
            var str=$(this).children("a").attr("title");
            node.innerText=str;
            var span=document.createElement('span');
            span.setAttribute("class","caret");
            node.appendChild(span);

            if(str=="Province"||str=="ShopName"||str=="Category"){
                document.getElementById("CompareValue1").style.display="inline-block";
                document.getElementById("CompareValue2").style.display="inline-block";
            }else {
                document.getElementById("CompareValue1").style.display="none";
                document.getElementById("CompareValue2").style.display="none";
            }
        });
    });

    var measureValue="totalProfit";
    var compareValue="payWay";
    var CompareValue1;
    var CompareValue2;
    var xAxisData = [];
    var data1 = [];
    var data2 = [];
    var histogramChart = echarts.init(document.getElementById('histogramChart'));

    $('#ApplyHistogramFilter').click(function(){
        measureValue=document.getElementById("MeasureValue").innerText;
        compareValue=document.getElementById("CompareValue").innerText;

        if(compareValue=="Province"||compareValue=="ShopName"||compareValue=="Category"){
            CompareValue1=document.getElementById("CompareValue1").value;
            CompareValue2=document.getElementById("CompareValue2").value;

            var applyMultipleHistogram= $.post(
                    "/applyMultipleHistogramSetting",
                    {
                        "measureValue":measureValue,
                        "compareValue":compareValue,
                        "CompareCategory1":CompareValue1,
                        "CompareCategory2":CompareValue2
                    },
                    function(data){
                        var set= $.parseJSON(data);
                        xAxisData=set.date;
                        data1=set.data1;
                        data2=set.data2;
                    }
            );
            applyMultipleHistogram.done(function(){
                var temp=echarts.init(document.getElementById('histogramChart'));
                temp.setOption({
                    title: {
                        text: CompareValue1+"\/"+CompareValue2+"的"+measureValue+"对比"
                    },
                    legend: {
                        data: [CompareValue1, CompareValue2],
                        align: 'left'
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
                        name: CompareValue1,
                        type: 'bar',
                        data: data1,
                        animationDelay: function (idx) {
                            return idx * 10;
                        }
                    }, {
                        name: CompareValue2,
                        type: 'bar',
                        data: data2,
                        animationDelay: function (idx) {
                            return idx * 10 + 100;
                        }
                    }],
                    animationEasing: 'elasticOut',
                    animationDelayUpdate: function (idx) {
                        return idx * 5;
                    }

                });
            });
        }else {
            if(compareValue=="Sex"){
                CompareValue1='male';
                CompareValue2='female';
            }else if(compareValue=="PayWay"){
                CompareValue1='card';
                CompareValue2='cash';
            }else if(compareValue=="Online"){
                CompareValue1='online';
                CompareValue2='offline';
            }

            var applyHistogram= $.post(
                    "/applyHistogramSetting",
                    {
                        "measureValue":measureValue,
                        "compareValue":compareValue
                    },
                    function(data){
                        var set= $.parseJSON(data);
                        xAxisData=set.date;
                        data1=set.data1;
                        data2=set.data2;
                    }
            );

            applyHistogram.done(function(){
                var temp=echarts.init(document.getElementById('histogramChart'));
                temp.setOption({
                    title: {
                        text: CompareValue1+"\/"+CompareValue2+"的"+measureValue+"对比"
                    },
                    legend: {
                        data: [CompareValue1, CompareValue2],
                        align: 'left'
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
                        name: CompareValue1,
                        type: 'bar',
                        data: data1,
                        animationDelay: function (idx) {
                            return idx * 10;
                        }
                    }, {
                        name: CompareValue2,
                        type: 'bar',
                        data: data2,
                        animationDelay: function (idx) {
                            return idx * 10 + 100;
                        }
                    }],
                    animationEasing: 'elasticOut',
                    animationDelayUpdate: function (idx) {
                        return idx * 5;
                    }

                });
            });
        }
    });

    var inihistogram= $.post(
            "/applyHistogramSetting",
            {
                "measureValue":measureValue,
                "compareValue":compareValue
            },
            function(data){
                var set= $.parseJSON(data);
                xAxisData=set.date;
                data1=set.data1;
                data2=set.data2;
            }
    );
    inihistogram.done(function(){
        histogramChart.setOption({
            title: {
                text: 'card/cash的TotalProfit对比'
            },
            legend: {
                data: ['card', 'cash'],
                align: 'left'
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
                name: 'card',
                type: 'bar',
                data: data1,
                animationDelay: function (idx) {
                    return idx * 10;
                }
            }, {
                name: 'cash',
                type: 'bar',
                data: data2,
                animationDelay: function (idx) {
                    return idx * 10 + 100;
                }
            }],
            animationEasing: 'elasticOut',
            animationDelayUpdate: function (idx) {
                return idx * 5;
            }

        });
    });


    //
    //饼图
    //
    $('#InnerValueMenu').find('li').each(function(){
        $(this).click(function(){
            var node=document.getElementById("InnerValue");
            node.innerText=$(this).children("a").attr("title");
            var span=document.createElement('span');
            span.setAttribute("class","caret");
            node.appendChild(span);
        });
    });
    $('#OuterValueMenu').find('li').each(function(){
        $(this).click(function(){
            var node=document.getElementById("OuterValue");
            var str=$(this).children("a").attr("title");
            node.innerText=str;
            var span=document.createElement('span');
            span.setAttribute("class","caret");
            node.appendChild(span);
        });
    });
    $('#PieMeasureValueMenu').find('li').each(function(){
        $(this).click(function(){
            var node=document.getElementById("PieMeasureValue");
            var str=$(this).children("a").attr("title");
            node.innerText=str;
            var span=document.createElement('span');
            span.setAttribute("class","caret");
            node.appendChild(span);
        });
    });



    var inner="payway";
    var outer="sex";
    var measure="totalcost";

    var legendData;
    var innerData;
    var outerData;
    var inipie= $.post(
            "/getPieData",
            {
                "inner":inner,
                "outer":outer,
                "measureValue":measure
            },
            function(data){
                var set= $.parseJSON(data);
                legendData=set.legendData;
                innerData=set.innerData;
                outerData=set.outerData;
            }
    );
    inipie.done(function(){
        var piechart=echarts.init(document.getElementById('pieChart'));
        piechart.setOption({
            title: {
                text: outer+"\/"+inner+"的"+measure+"占比",
                left:'30%'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:legendData
            },
            series: [
                {
                    name:'数据源',
                    type:'pie',
                    selectedMode: 'single',
                    radius: [0, '30%'],

                    label: {
                        normal: {
                            position: 'inner'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:innerData
                },
                {
                    name:'数据源',
                    type:'pie',
                    radius: ['40%', '55%'],
                    data:outerData
                }
            ]
        });
    });

    $('#ApplyPieFilter').click(function(){
        inner=document.getElementById("InnerValue").innerText;
        outer=document.getElementById("OuterValue").innerText;
        measure=document.getElementById("PieMeasureValue").innerText;

        var applypie= $.post(
                "/getPieData",
                {
                    "inner":inner,
                    "outer":outer,
                    "measureValue":measure
                },
                function(data){
                    var set= $.parseJSON(data);
                    legendData=set.legendData;
                    innerData=set.innerData;
                    outerData=set.outerData;
                }
        );
        applypie.done(function(){
            var applypiechart=echarts.init(document.getElementById('pieChart'));
            applypiechart.setOption({
                title: {
                    text: outer+"\/"+inner+"的"+measure+"占比",
                    left:'30%'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data:legendData
                },
                series: [
                    {
                        name:'数据源',
                        type:'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],

                        label: {
                            normal: {
                                position: 'inner'
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:innerData
                    },
                    {
                        name:'数据源',
                        type:'pie',
                        radius: ['40%', '55%'],
                        data:outerData
                    }
                ]
            });
        });
    });
</script>
</body>
</html>
</body>
</html>