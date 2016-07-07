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

    <title>Dessert | 经营统计</title>

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

            <div class="col-sm-10 frame-middle">
                <div class="title-box">经营统计</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <div id="historydatachart" style="width: 600px;height:400px;"></div>

                        <div style="min-height: 50px"></div>
                        <button type="button" class="btn" style="background-color: #ffcd29;margin-left: 50px">
                            <a href="${pageContext.request.contextPath}/multipleAnalysis" target="_blank" style="color: black;font-weight:bolder">综合分析</a>
                        </button>
                        <button type="button" class="btn" style="background-color: #ff961e;margin-left: 50px" >
                            <a href="${pageContext.request.contextPath}/compareAnalysis" target="_blank" style="color: black;font-weight:bolder">对比分析</a>
                        </button>
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
    var myHistoryDataChart = echarts.init(document.getElementById('historydatachart'));
    var date = [];
    var dataSet = [];
    option = {
        tooltip: {
            trigger: 'axis',
            position: function (pt) {
                return [pt[0], '10%'];
            }
        },
        title: {
            left: 'center',
            text: '企业总盈利曲线图',
        },
        legend: {
            top: 'bottom',
            data:['意向']
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: date
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%']
        },
        dataZoom: [{
            type: 'inside',
            start: 0,
            end: 10
        }, {
            start: 0,
            end: 10
        }],
        series: [
            {
                name:'总毛利润',
                type:'line',
                smooth:true,
                symbol: 'none',
                sampling: 'average',
                itemStyle: {
                    normal: {
                        color: 'rgb(255, 70, 131)'
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(255, 158, 68)'
                        }, {
                            offset: 1,
                            color: 'rgb(255, 70, 131)'
                        }])
                    }
                },
                data: dataSet
            }
        ]
    };
    myHistoryDataChart.setOption(option);
    var jqxhr=$.post("/historyData", function(data){
        var set=$.parseJSON(data);
        date=set.date;
        dataSet=set.data;
    });
    jqxhr.done(function(){
        myHistoryDataChart.setOption({
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: date
            },
            series: [
                {
                    name:'总毛利润',
                    type:'line',
                    smooth:true,
                    symbol: 'none',
                    sampling: 'average',
                    itemStyle: {
                        normal: {
                            color: 'rgb(255, 70, 131)'
                        }
                    },
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(255, 158, 68)'
                            }, {
                                offset: 1,
                                color: 'rgb(255, 70, 131)'
                            }])
                        }
                    },
                    data: dataSet
                }
            ]
        });
    });
</script>
</body>
</html>
</body>
</html>
