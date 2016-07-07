<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/6/7
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- Material Lite -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.1/material.indigo-red.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" />
    <script defer src="https://code.getmdl.io/1.1.1/material.min.js"></script>

    <!-- Syntax Highlighter -->
    <!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/styles/default.min.css"> -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/styles/github.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/highlight.min.js"></script>

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
    <main class="mdl-layout__content">
        <div class="container">

            <div class="mdl-grid" id="theView">
                <div class="mdl-cell mdl-cell--4-col">
                    <div id="pivotPanel"></div>
                </div>
                <div class="mdl-cell mdl-cell--8-col">
                    <div id="pivotGrid"></div>
                </div>
            </div>



            <p>
                使用<b>viewDefinition</b>属性保存或恢复视图定义。就像在下面的样例中那样：
            </p>

            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect"
                    onclick="app.saveView()">
                Save View
            </button>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect"
                    onclick="app.loadView()">
                Load View
            </button>

            <p></p>
            <p>
                使用<b>viewDefinition</b>属性，你也可以组建一个预定义的列视图供用户选择，就像在下面的样例中那样：
            </p>
            <ul id="views"></ul>


            <h4>
                配置PivotPanel属性
            </h4>
            <p>
                <b>PivotPanel</b>控件拥有允许你自定义视图的属性。使用下面的控件修改一些属性值，查看产生的影响：
            </p>
            <dl class="dl-horizontal">
                <dt>Dataset</dt>
                <dd><div id="cmbDataSets"></div></dd>
                <dt>Row totals</dt>
                <dd><div id="cmbRowTotals"></div></dd>
                <dt>Column totals</dt>
                <dd><div id="cmbColTotals"></div></dd>
                <dt>Show Zeros</dt>
                <dd><input id="chkShowZeros" type="checkbox" /></dd>
            </dl>


            <h4>
                在PivotChart上显示结果
            </h4>
            <p>
                <b>PivotChart</b>控件提供了图形化的结果。
                与Excel的数据透视表类似，包括对多种图表类型和分级轴的支持。
            </p>
            <p>
                要使用<b>PivotChart</b>控件，使用<b>itemsSource</b>属性，将其与<b>PivotPanel</b>连接：
            </p>

            <div id="chartPanel">
                <dl class="dl-horizontal">
                    <dt>Chart Type</dt>
                    <dd><div id="cmbChartType"></div></dd>
                </dl>
                <div id="pivotChart"></div>
            </div>
            <div id="noChartPanel" style="display:none">
                <p>
                    Please create a view in order to see the chart.
                </p>
            </div>


            <h4>
                查看并且编辑源数据
            </h4>
            <p>
                数据透视表是实时的，如果你编辑<span id="itemCount">n</span>项目中的任意一个，数据透视表会自动更新。
                    <span id="readOnlyData" class="text-info">
                        (This grid is read-only because it is bound to a read-only data source.)
                    </span>
            </p>
            <div id="rawGrid" style="border:none"></div>



            <h4>
                将结果导出为Excel
            </h4>
            <p>
                <b>PivotGrid</b>控件扩展了<b>FlexGrid</b>，因此你可以将它导出为<b>FlexGrid</b>提供的拓展模块支持的任意格式。
                支持的格式包括XLSLX, CSV和PDF。
            </p>
            <p>
                例如，下面的按钮创建了一个有三个sheet的Excel文件：当前视图，当前视图的转换版本和原始数据：
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect"
                        onclick="app.export()">
                    Export to XLSX
                </button>


            <h4>
                自定义PivotGrid单元格
            </h4>
            <p>
                <b>PivotGrid</b>控件扩展了<b>FlexGrid</b>控件，
                所以你可以使用<b>formatItem</b>事件来自定义网格单元格的显示并且完全灵活地修改每个单元格的内容。
            </p>
            <p>
                例如，下面的<b>PivotGrid</b>使用了与微软Excel图标集相同的颜色和图标来显示销量在季度间的变化：
            </p>

            <div id="formattedGrid" style="border:none">
            </div>

            <p>
                注意，在样例中，我们只有一个预定义的视图，不需要<b>PivotPanel</b>。
                相反，代码直接创建了一个<b>PivotEngine</b>并且将它作为网格的<b>itemsSource</b>。
            </p>
        </div>
    </main>
</div>
<!--Google-->
<script>

    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-852777-12', 'gcpowertools.com.cn');
    ga('send', 'pageview');
</script>

<script>
//    onload = function () {
//        var app = {};
//        app.panel = new wijmo.olap.PivotPanel('#pivotPanel');
//        app.pivotGrid = new wijmo.olap.PivotGrid('#pivotGrid', {
//            itemsSource: app.panel
//        });
//
//        app.dataSets = [
//            { name: 'Simple (1,000 items)', value: getSimpleDataSet(1000) },
//            { name: 'Simple (10,000 items)', value: getSimpleDataSet(10000) },
//            { name: 'Complex (100 items)', value: getDataSet(100) },
//            { name: 'Complex (50,000 items)', value: getDataSet(50000) },
//            { name: 'Complex (100,000 items)', value: getDataSet(100000) },
//            { name: 'Northwind Orders (read-only)', value: getNorthwindOrders() },
//            { name: 'Northwind Sales (read-only)', value: getNorthwindSales() }
//        ];
//
//        var ng = app.panel.engine;
//        ng.itemsSource = app.dataSets[0].value;
//        ng.rowFields.push('Product', 'Country');
//        ng.valueFields.push('Sales', 'Downloads');
//    }
//
//    // gets a simple data set for basic demos
//    function getSimpleDataSet(cnt) {
//        var dtOct = new Date(2015, 9, 1),
//                dtDec = new Date(2015, 11, 1),
//                data = [
//                    { product: 'Wijmo', country: 'USA', sales: 10, downloads: 100, date: dtOct, active: true },
//                    { product: 'Wijmo', country: 'Japan', sales: 10, downloads: 100, date: dtOct, active: false },
//                    { product: 'Aoba', country: 'USA', sales: 10, downloads: 100, date: dtDec, active: true },
//                    { product: 'Aoba', country: 'Japan', sales: 10, downloads: 100, date: dtDec, active: false }
//                ];
//        for (var i = 0; i < cnt - 4; i++) {
//            data.push({
//                product: randomInt(1) ? 'Wijmo' : 'Aoba',
//                country: randomInt(1) ? 'USA' : 'Japan',
//                active: i % 2 == 0,
//                date: new Date(2015 + randomInt(2), randomInt(11), randomInt(27) + 1),
//                sales: randomInt(10, 20),
//                downloads: randomInt(10, 200)
//            });
//        }
//        return new wijmo.collections.CollectionView(data);
//    }
//
//    // gets a slightly more complex data set for more advanced demos
//    function getDataSet(cnt) {
//        var countries = 'US,Germany,UK,Japan,Italy,Greece,Spain,Portugal'.split(','),
//                products = 'Wijmo,Aoba,Xuni,Olap'.split(','),
//                data = [];
//        for (var i = 0; i < cnt; i++) {
//            data.push({
//                id: i,
//                product: products[randomInt(products.length - 1)],
//                country: countries[randomInt(countries.length - 1)],
//                date: new Date(2015 + randomInt(2), randomInt(11), randomInt(27) + 1),
//                sales: randomInt(10000),
//                downloads: randomInt(10000),
//                active: randomInt(1) ? true : false,
//                discount: Math.random()
//            });
//        }
//        return new wijmo.collections.CollectionView(data);
//    }
//
//    // get Northwind data (these are not very good sources for this demo, but are so easy to get...)
//    function getNorthwindOrders() {
//        var url = 'http://services.odata.org/V4/Northwind/Northwind.svc/';
//        return new wijmo.odata.ODataCollectionView(url, 'Order_Details_Extendeds');
//    }
//    function getNorthwindSales() {
//        var url = 'http://services.odata.org/V4/Northwind/Northwind.svc/';
//        return new wijmo.odata.ODataCollectionView(url, 'Product_Sales_for_1997');
//    }
//    // gets a random integer between zero and max
//    function randomInt(max) {
//        return Math.floor(Math.random() * (max + 1));
//    }
</script>
</body>
</html>
