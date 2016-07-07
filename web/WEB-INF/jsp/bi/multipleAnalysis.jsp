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

    <title>Dessert | 综合分析</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/store.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/shoppingcart.css" rel="stylesheet">


    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="css/material.indigo-red.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" />
    <script defer src="js/material.min.js"></script>

    <!-- Syntax Highlighter -->
    <!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/styles/default.min.css"> -->
    <link rel="stylesheet" href="css/github.min.css">
    <script src="js/highlight.min.js"></script>

    <link rel="stylesheet" href="css/wijmo.min.css" />
    <link href="css/wijmo.theme.material.min.css" rel="stylesheet" />
    <script src="js/vendor/wijmo.min.js"></script>
    <script src="js/vendor/wijmo.input.min.js"></script>
    <script src="js/vendor/wijmo.grid.min.js"></script>
    <script src="js/vendor/wijmo.grid.filter.min.js"></script>
    <script src="js/vendor/wijmo.chart.min.js"></script>
    <script src="js/vendor/wijmo.xlsx.min.js"></script>
    <script src="js/vendor/wijmo.grid.xlsx.min.js"></script>
    <script src="js/vendor/wijmo.odata.min.js"></script>
    <script src="js/vendor/wijmo.olap.min.js"></script>
    <script src="js/vendor/wijmo.culture.zh.js"></script>
    <script src="js/vendor/jszip.min.js"></script>

    <link rel="stylesheet" href="css/app.css" />
    <script src="js/vendor/app.js"></script>
</head>

<body>



<div class="mdl-layout mdl-js-layout">

    <nav class="navbar navbar-fixed-top navbar-custom" style="margin-bottom: 100px">
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
                    <li><a href="${pageContext.request.contextPath}/managerOLAP">返回</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
    <div style="min-height: 50px"></div>
    <main class="mdl-layout__content">
        <div class="container">

            <div style="min-height: 50px"></div>
            <div style="color: black;font-weight: bolder;font-size: 20px;font-family: 'Microsoft Yahei';padding-left: 15px">多维查看：</div>

            <div class="mdl-grid" id="theView">
                <div class="mdl-cell mdl-cell--4-col">
                    <div id="pivotPanel"></div>
                </div>
                <div class="mdl-cell mdl-cell--8-col">
                    <div id="pivotGrid"></div>
                </div>
            </div>

            <p></p>

            <div style="display: none">
                <p>
                    选择预定义视图
                </p>
                <ul id="views"></ul>
            </div>



            <%--<h4>--%>
                <%--配置PivotPanel属性--%>
            <%--</h4>--%>
            <dl class="dl-horizontal" style="display: none">
                <dt>Dataset</dt>
                <dd><div id="cmbDataSets"></div></dd>
                <dt>Row totals</dt>
                <dd><div id="cmbRowTotals"></div></dd>
                <dt>Column totals</dt>
                <dd><div id="cmbColTotals"></div></dd>
                <dt>Show Zeros</dt>
                <dd><input id="chkShowZeros" type="checkbox" /></dd>
            </dl>


            <%--<h4>--%>
                <%--查看多视图表--%>
            <%--</h4>--%>
            <div style="min-height: 50px"></div>
            <div style="color: black;font-weight: bolder;font-size: 20px;font-family: 'Microsoft Yahei';margin-bottom: 30px">查看多视图表：</div>
            <div id="chartPanel">
                <dl class="dl-horizontal">
                    <dt><div style="padding-top: 5px;color: black;font-size: 18px">Chart Type:</div></dt>
                    <dd><div id="cmbChartType"></div></dd>
                </dl>
                <div id="pivotChart"></div>
            </div>
            <div id="noChartPanel" style="display:none">
                <p>
                    Please create a view in order to see the chart.
                </p>
            </div>


            <%--<h4>--%>
                <%--查看并且编辑源数据--%>
            <%--</h4>--%>
            <div style="min-height: 50px"></div>
            <div style="color: black;font-weight: bolder;font-size: 20px;font-family: 'Microsoft Yahei';margin-bottom: 20px">查看并且编辑源数据：</div>
            <p>
                数据透视表是实时的，如果你编辑<span id="itemCount">n</span>项目中的任意一个，数据透视表会自动更新。
                    <span id="readOnlyData" class="text-info">
                        (This grid is read-only because it is bound to a read-only data source.)
                    </span>
            </p>
            <div id="rawGrid" style="border:none"></div>



            <%--<h4>--%>
                <%--导出为Excel--%>
            <%--</h4>--%>
            <div style="min-height: 50px"></div>
            <div style="color: black;font-weight: bolder;font-size: 20px;font-family: 'Microsoft Yahei';margin-bottom: 20px">导出为Excel：</div>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect"
                    onclick="app.export()">
                Export to XLSX
            </button>
            <div style="min-height: 50px"></div>

            <%--<h4>--%>
                <%--查看增长率--%>
            <%--</h4>--%>
            <div style="min-height: 50px"></div>
            <div style="color: black;font-weight: bolder;font-size: 20px;font-family: 'Microsoft Yahei';margin-bottom: 20px">查看增长率：</div>
            <div id="formattedGrid" style="border:none">
            </div>

            <div style="min-height: 50px"></div>
        </div>
    </main>
</div>



<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m);
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-852777-12', 'gcpowertools.com.cn');
    ga('send', 'pageview');
</script>
</body>
</html>
</body>
</html>

</body>
</html>
