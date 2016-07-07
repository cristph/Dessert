<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/5/29
  Time: 16:13
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

    <title>Dessert | 制定新产品</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/store.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">

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
                <a href="${pageContext.request.contextPath}/addProductView?picpath="><div class="setting-left">制定新产品</div></a>
                <a href="${pageContext.request.contextPath}/productList"><div class="setting-left">产品库</div></a>
                <a href="${pageContext.request.contextPath}/addGoodProject?picpath="><div class="setting-left">制定产品计划</div></a>
                <a href="${pageContext.request.contextPath}/saleplanlist"><div class="setting-left">查看产品计划</div></a>
            </div>

            <div class="col-sm-11 frame-middle">

                <div class="title-box">添加产品：</div>
                <div class="white-box">
                    <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" accept-charset="utf-8">
                        <div style="min-height: 35px"></div>
                        <div id="histogramChart" style="width: 800px;height:400px"></div>

                        <div style="min-height: 15px"></div>
                        <div style="min-height: 15px;text-align: center"><h3 style="font-weight: bolder;font-family:Microsoft YaHei;color:black">各类客户人数所占比例统计</h3></div>
                        <div id="pieChart" style="width: 1000px;height:400px;"></div>
                        <div style="min-height: 50px"></div>
                        <div style="min-height: 15px;text-align: center"><h3 style="font-weight: bolder;font-family:Microsoft YaHei;color:black">各类客户消费总额所占比例统计</h3></div>
                        <div id="pieChart2" style="width: 1000px;height:400px;"></div>
                        <div style="min-height: 50px"></div>

                        <div class="bs-example">
                            <ul class="nav nav-pills" role="tablist">
                                <li id="ApplyCategoryFilter" role="presentation" class="active"><a href="javascript:void(0)">Apply Filter</a></li>
                                <li role="presentation" class="dropdown">
                                    <a id="MeasureValue" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Customer Category
                                        <span class="caret"></span>
                                    </a>
                                    <ul id="MeasureValueMenu" class="dropdown-menu" aria-labelledby="drop4">
                                        <li><a href="javascript:void(0)" title="Important_Retain_Customer">Important_Retain_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Important_Keep_Customer">Important_Keep_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Important_Develop_Customer">Important_Develop_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Important_Value_Customer">Important_Value_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Normal_Retain_Customer">Normal_Retain_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Normal_Keep_Customer">Normal_Keep_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Normal_Develop_Customer">Normal_Develop_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Normal_Value_Customer">Normal_Value_Customer</a></li>
                                    </ul>
                                </li>
                            </ul> <!-- /pills -->
                        </div>
                        <div style="min-height: 50px"></div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div id="pieChart3" style="max-width: 500px;height:400px;"></div>
                            </div>
                            <div class="col-sm-7">
                                <div style="min-height: 15px;text-align: center"><h3 style="font-weight: bolder;font-family:Microsoft YaHei;color:black">各类甜品销售额变化</h3></div>
                                <div id="linechart" style="min-height: 500px"></div>
                            </div>
                        </div>

                        <div style="min-height: 30px"></div>
                    </form>

                    <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" action="uploadProductPic" method="post" enctype="multipart/form-data">

                        <div class="form-group form-line">
                            <label for="pic" class="col-sm-2 control-label">图片：</label>
                            <div class="col-sm-4">
                                <input type="file" class="form-control from-input" id="pic" name="studentPhoto" style="width: 100%!important;" >
                            </div>
                            <div class="col-sm-4">
                                <img src="${picpath}" alt="请上传图片" style="height: 150px; width: 150px; display: block;border: 2px solid #2588ff">
                                <input type="hidden" id="picture" value="${picpath}" >
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit"  value="提交甜品图片" class="btn btn-block post-btn" id="picupload">
                            </div>
                        </div>

                    </form>

                    <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" accept-charset="utf-8">

                        <div class="form-group form-line">
                            <label for="name" class="col-sm-2 control-label">品名：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="name" name="name" >
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="category" class="col-sm-2 control-label">种类：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="category" value="cake"> 糕点
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="category"  value="biscuit"> 饼干
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="category" value="drink"> 饮品
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="description" class="col-sm-2 control-label">甜品描述：</label>
                            <div class="col-sm-10">
                                <textarea class="form-control from-input" id="description" name="description" rows="3"></textarea>
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="price" class="col-sm-2 control-label">建议零售价(元)：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="price" name="price" value=''>
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="button"  value="添加甜品" class="btn btn-block post-btn" id="createPlan">
                                <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                            </div>
                        </div>
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
<script src="js/common.js"></script>
<script src="js/addProduct.js"></script>
<script src="js/echarts.min.js"></script>
<script>
    var measureValue="totalProfit";
    var compareValue="payWay";
    var CompareValue1;
    var CompareValue2;
    var xAxisData = [];
    var data1 = [];
    var data2 = [];
    var data3 = [];
    var histogramChart = echarts.init(document.getElementById('histogramChart'));

    for(var i=1;i<13;i++){
        xAxisData.push(2014+"年"+i+"月");
    }

    var inihistogram= $.post(
            "/getCategoryData",
            function(data){
                var set= $.parseJSON(data);
                data1=set[0];
                data2=set[1];
                data3=set[2];
            }
    );
    inihistogram.done(function(){
        histogramChart.setOption({
            title: {
                text: 'cake,biscuit,drink的销售额变化趋势',
                textStyle:{
                    color:'#111'
                }
            },
            legend: {
                data: ['biscuit', 'cake','drink'],
                align: 'auto',
                left:'45%'
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
                name: 'biscuit',
                type: 'bar',
                data: data1,
                animationDelay: function (idx) {
                    return idx * 10;
                }
            }, {
                name: 'cake',
                type: 'bar',
                data: data2,
                animationDelay: function (idx) {
                    return idx * 10 + 100;
                }
            },{
                name: 'drink',
                type: 'bar',
                data: data3,
                animationDelay: function (idx) {
                    return idx * 10 + 200;
                }
            }],
            animationEasing: 'elasticOut',
            animationDelayUpdate: function (idx) {
                return idx * 5;
            }

        });
    });

    var measure="totalcost";

    var legendData;
    var innerData;
    var outerData;

    var legendData2;
    var innerData2;
    var outerData2;
    var inipie= $.post(
            "/getRFMData",
            {
                "measureValue":measure
            },
            function(data){
                var set= $.parseJSON(data);
                legendData=set[0].legendData;
                innerData=set[0].innerData;
                outerData=set[0].outerData;

                legendData2=set[1].legendData;
                innerData2=set[1].innerData;
                outerData2=set[1].outerData;
            }
    );
    inipie.done(function(){
        var piechart=echarts.init(document.getElementById('pieChart'));
        var piechart2=echarts.init(document.getElementById('pieChart2'));
        piechart.setOption({
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
        piechart2.setOption({
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:legendData2
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
                    data:innerData2
                },
                {
                    name:'数据源',
                    type:'pie',
                    radius: ['40%', '55%'],
                    data:outerData2
                }
            ]
        });
    });

    ////////////

    $('#MeasureValueMenu').find('li').each(function(){
        $(this).click(function(){
            var node=document.getElementById("MeasureValue");
            node.innerText=$(this).children("a").attr("title");
            var span=document.createElement('span');
            span.setAttribute("class","caret");
            node.appendChild(span);
        });
    });

    var datas;
    $('#ApplyCategoryFilter').click(function() {
        var customer_category = document.getElementById("MeasureValue").innerText;
//        alert(customer_category);

        var datasets;
        var linedata1;
        var linedata2;
        var linedata3;
        var inipie= $.post(
                "/getSelectedData",
                {
                    "customer":customer_category
                },
                function(data){
                    var set= $.parseJSON(data);
                    datasets=set.dataSets;
                    linedata1=set.doubles[0];
                    linedata2=set.doubles[1];
                    linedata3=set.doubles[2];
                }
        );
        inipie.done(function(){
            var piechart3=echarts.init(document.getElementById('pieChart3'));
            var linechart=echarts.init(document.getElementById('linechart'));
            piechart3.setOption({
                title : {
                    text: '各类甜品销售额比重',
                    x:'center',
                    textStyle:{
                        color:'#111'
                    }
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['biscuit','cake','drink']
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:datasets,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });

            linechart.setOption({
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['biscuit','cake','drink'],
                    left: '10%'
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {},
                        dataView: {readOnly: false},
                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: xAxisData
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: function (value, index) {
                            var texts=value/10000;
                            var res=texts+"万元";
                            return res;
                        }
                    }
                },
                series: [
                    {
                        name:'biscuit',
                        type:'line',
                        data:linedata1,
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    },
                    {
                        name:'cake',
                        type:'line',
                        data:linedata2,
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    },
                    {
                        name:'drink',
                        type:'line',
                        data:linedata3,
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    }
                ]
            });
        });
    });
</script>
</body>
</html>