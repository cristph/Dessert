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

    <title>Dessert | 客户关系管理</title>

    <%--<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="//cdn.bootcss.com/jqueryui/1.11.3/jquery-ui.min.css" rel="stylesheet">--%>
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/store.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/shoppingcart.css" rel="stylesheet">
    <link href="css/pqgrid.min.css" rel="stylesheet">


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
                <div class="title-box">客户关系管理</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <div style="min-height: 15px"></div>
                        <div style="min-height: 15px;text-align: center"><h3 style="font-weight: bold">各类客户人数所占比例统计</h3></div>
                        <div id="pieChart" style="width: 1000px;height:400px;"></div>
                        <div style="min-height: 50px"></div>
                        <div style="min-height: 15px;text-align: center"><h3 style="font-weight: bold">各类客户消费总额所占比例统计</h3></div>
                        <div id="pieChart2" style="width: 1000px;height:400px;"></div>
                        <div style="min-height: 100px"></div>
                        <%--<div id="grid_export" style="margin: auto;"></div>--%>

                        <div class="bs-example">
                            <ul class="nav nav-pills" role="tablist">
                                <li id="ApplyCategoryFilter" role="presentation" class="active"><a href="javascript:void(0)">Apply Filter</a></li>
                                <li role="presentation" class="dropdown">
                                    <a id="MeasureValue" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Customer Category
                                        <span class="caret"></span>
                                    </a>
                                    <ul id="MeasureValueMenu" class="dropdown-menu" aria-labelledby="drop4">
                                        <li><a href="javascript:void(0)" title="All">All</a></li>
                                        <li><a href="javascript:void(0)" title="Important_Customer">Important_Customer</a></li>
                                        <li><a href="javascript:void(0)" title="Normal_Customer">Normal_Customer</a></li>
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
                        <div id="gridContainer_2_2_5" class="dlshouwen-grid-container"></div>
                        <div id="gridToolBarContainer_2_2_5" class="dlshouwen-grid-toolbar-container"></div>

                        <div style="min-height: 70px"></div>
                        <button type="button" class="btn" style="background-color: #ffcd29;"><a style="color: black" href="javascript:void(0)">一键邮件推送</a></button>
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
<%--<script src="//cdn.bootcss.com/jqueryui/1.11.3/jquery-ui.min.js"></script>--%>
<%--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>
<script src="js/echarts.min.js"></script>
<%--<script src="js/pqgrid.min.js"></script>--%>
<script>
    //
    //饼图
    //

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

</script>

<script type="text/javascript">
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
    $('#ApplyCategoryFilter').click(function(){
        var customer_category=document.getElementById("MeasureValue").innerText;
//        alert(customer_category);
        var div=document.getElementById("gridContainer_2_2_5");
        while(div.hasChildNodes()) {
            div.removeChild(div.firstChild);
        }
        var gridpost= $.post(
                "/getGridData",
                {
                    "category":customer_category
                },
                function(data){
//                    alert(data);
                    datas= $.parseJSON(data);
                }
        );
        gridpost.done(function(){
            var gridColumns_2_2_5 = [
                {id:'customerid', title:'用户编号', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'eq'},
                {id:'days', title:'上次购买间隔天数', type:'number', columnClass:'text-center', fastQuery:true, fastQueryType:'lk'},
                {id:'times', title:'最近购买次数', type:'number', columnClass:'text-center', fastQuery:true, fastQueryType:'eq'},
                {id:'money', title:'消费总额', type:'number', format:'#,###.00', columnClass:'text-center',fastQuery:true, fastQueryType:'range'},
                {id:'r', title:'R值', type:'number', columnClass:'text-center', fastQuery:true, fastQueryType:'eq' },
                {id:'f', title:'F值', type:'number', columnClass:'text-center', fastQuery:true, fastQueryType:'range' },
                {id:'m', title:'M值', type:'number', columnClass:'text-center',fastQuery:true, fastQueryType:'range' },
                {id:'rFM', title:'RFM值', type:'number',  columnClass:'text-center',fastQuery:true, fastQueryType:'range' },
                {id:'description', title:'客户分类', type:'string', columnClass:'text-center',fastQuery:true, fastQueryType:'range' }
            ];
            var gridOption_2_2_5 = {
                lang : 'zh-cn',
                ajaxLoad : false,
                datas : datas,
                exportFileName : '客户列表',
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





    //映射内容
//    var sex = {1:'男', 2:'女'};
//    var degree = {1:'小学', 2:'初中', 3:'高中', 4:'中专', 5:'大学', 6:'硕士', 7:'博士', 8:'其他'};
    //模拟数据（薪水在6000-12000之间，日期在1980-01-01 00::00:00到2014-10-01 00:00:00之间）

//    var datas = new Array();
//    for(var i=0; i<186; i++){
//        var user = new Object();
//        user.user_id = 'user_'+i;
//        user.user_code = 'user_'+i;
//        user.user_name = '模拟用户'+(Math.floor(Math.random()*1000)+10000)+'号';
//        user.sex = (Math.floor(Math.random()*2)+1);
//        user.salary = (Math.floor(Math.random()*6000)+6000);
//        user.degree = (Math.floor(Math.random()*8)+1);
//        user.time = new Date(Math.floor(Math.random()*1096588800000)+315504000000);
//        user.time_stamp_s = Math.floor((Math.floor(Math.random()*1096588800000)+315504000000)/1000);
//        user.time_stamp_ms = Math.floor(Math.random()*1096588800000)+315504000000;
//        user.string_date = $.fn.dlshouwen.grid.tools.dateFormat(new Date(Math.floor(Math.random()*1096588800000)+315504000000), 'yyyy-MM-dd');
//        user.string_time = $.fn.dlshouwen.grid.tools.dateFormat(new Date(Math.floor(Math.random()*1096588800000)+315504000000), 'yyyy-MM-dd hh:mm:ss');
//        datas.push(user);
//    }
//    var gridColumns_2_2_5 = [
//        {id:'user_code', title:'用户编号', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'eq'},
//        {id:'user_name', title:'用户名称', type:'string', columnClass:'text-center', fastQuery:true, fastQueryType:'lk'},
//        {id:'sex', title:'性别', type:'string', codeTable:sex, columnClass:'text-center', hideType:'xs', fastQuery:true, fastQueryType:'eq', resolution:function(value, record, column, grid, dataNo, columnNo){
//            var content = '';
//            if(value==1){
//                content += '<span style="background:#00a2ca;padding:2px 10px;color:white;">Male</span>';
//            }else{
//                content += '<span style="background:#c447ae;padding:2px 10px;color:white;">Female</span>';
//            }
//            return content;
//        }},
//        {id:'salary', title:'薪水', type:'number', format:'#,###.00', columnClass:'text-center', hideType:'xs', fastQuery:true, fastQueryType:'range'},
//        {id:'degree', title:'学历', type:'string', codeTable:degree, columnClass:'text-center', hideType:'sm|xs', fastQuery:true, fastQueryType:'eq' },
//        {id:'time', title:'日期对象', type:'date', format:'yyyy-MM-dd hh:mm:ss', columnClass:'text-center', hideType:'md|sm|xs', fastQuery:true, fastQueryType:'range' },
//        {id:'time_stamp_s', title:'秒级时间戳', type:'date', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_s', columnClass:'text-center', hideType:'lg|md|sm|xs', fastQuery:true, fastQueryType:'range' },
//        {id:'time_stamp_ms', title:'毫秒级时间戳', type:'date', format:'yyyy-MM-dd hh:mm:ss S', otype:'time_stamp_ms', columnClass:'text-center', hideType:'lg|md|sm|xs', fastQuery:true, fastQueryType:'range' },
//        {id:'string_date', title:'日期格式字符串', type:'date', format:'yyyy-MM-dd', otype:'string', oformat:'yyyy-MM-dd', columnClass:'text-center', hideType:'lg|md|sm|xs', fastQuery:true, fastQueryType:'range' },
//        {id:'string_time', title:'时间格式字符串', type:'date', format:'yyyy-MM-dd hh:mm:ss', otype:'string', oformat:'yyyy-MM-dd hh:mm:ss', columnClass:'text-center', hideType:'lg|md|sm|xs', fastQuery:true, fastQueryType:'range' }
//    ];




</script>
</body>
</html>
</body>
</html>
