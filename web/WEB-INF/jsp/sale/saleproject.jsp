<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/3/18
  Time: 13:27
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

    <title>Dessert | 制定产品计划</title>

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

                <div class="title-box">临时产品计划清单：</div>
                <div class="white-box" style="margin: 0">
                    <div style="padding-left: 35px;margin-top: 40px">
                        <input type="button" value="选择商店" class="btn" style="background-color: #84c0ff" id="addPlanShop" data-toggle="modal" data-target="#planModal">
                    </div>
                   <form class="form-horizontal form-wrapper"  style="padding: 0 3% 0 3%" accept-charset="utf-8">
                       <table class="table table-hover">
                           <thead>
                           <tr>
                               <th>店名</th>
                               <th>总店/分店</th>
                               <th>地址</th>
                               <th>联系方式</th>
                               <th>开营日期</th>
                               <th>操作</th>
                           </tr>
                           </thead>
                           <tbody>
                           <c:choose>
                               <c:when test="${planShop==null}">
                                   <tr>
                                       <td style="font-weight: bolder;color: black">暂未选择店铺！</td>
                                   </tr>
                               </c:when>
                               <c:otherwise>
                                       <tr>
                                           <td style="width: 35%">
                                               <div class="row" >
                                                   <div class="col-sm-3">
                                                       <a href="#" >
                                                           <img  alt="100%x200" src="${planShop.shoppic}"  style="height: 50px; width: 50px; display: block;border: 1px #6f7be2 solid">
                                                       </a>
                                                   </div>
                                                   <div class="col-sm-9">
                                                           ${planShop.shopname}
                                                   </div>
                                               </div>
                                           </td>
                                           <td>${planShop.shopauth}</td>
                                           <td>${planShop.address}</td>
                                           <td>${planShop.contact}</td>
                                           <td>${planShop.opendate}</td>
                                           <td>
                                               <button type="button" class="btn btn-primary" id="PanTemp" data-toggle="modal" data-target="#planModal">
                                                   重新选择
                                               </button>
                                           </td>
                                       </tr>
                               </c:otherwise>
                           </c:choose>
                           </tbody>
                       </table>
                   </form>
                    <div id="prePanel">
                        <input type="hidden" id="chart1" value=${planShop.shopid}>
                        <div style="padding-left: 50px;margin-top: 70px">
                            <div class="bs-example" id="bs-example" style="display:none;">
                                <ul class="nav nav-pills" role="tablist">
                                    <li id="ApplyFilter" role="presentation" class="active"><a href="javascript:void(0)">Apply Filter</a></li>
                                    <li role="presentation" class="dropdown">
                                        <a id="TimeInterval" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            Time Interval
                                            <span class="caret"></span>
                                        </a>
                                        <ul id="TimeIntervalMenu" class="dropdown-menu" aria-labelledby="drop4">
                                            <li><a href="javascript:void(0)" title="Recent 3 Months">Recent 3 Months</a></li>
                                            <li><a href="javascript:void(0)" title="Recent 6 Months">Recent 6 Months</a></li>
                                            <li><a href="javascript:void(0)" title="Recent 3 Weeks">Recent 3 Weeks</a></li>
                                            <li><a href="javascript:void(0)" title="Recent 2 Weeks">Recent 2 Weeks</a></li>
                                        </ul>
                                    </li>
                                    <li role="presentation" class="dropdown">
                                        <a id="MeasureValue" href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            Measure Value
                                            <span class="caret"></span>
                                        </a>
                                        <ul id="MeasureValueMenu" class="dropdown-menu" aria-labelledby="drop5">
                                            <li><a href="javascript:void(0)" title="Num">SellNum</a></li>
                                            <li><a href="javascript:void(0)" title="TotalProfit">TotalProfit</a></li>
                                            <li><a href="javascript:void(0)" title="TotalPrice">TotalPrice</a></li>
                                        </ul>
                                    </li>
                                </ul> <!-- /pills -->
                            </div>
                        </div>
                        <div style="min-height: 30px"></div>
                        <div id="histogram1" style="width: 1000px;height: 500px;display: none" ></div>
                        <div style="min-height: 30px"></div>
                        <div id="histogram2" style="width: 1000px;height: 500px;display: none" ></div>
                    </div>
                    <div style="min-height: 70px"></div>
                    <div class="modal fade" id="planModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabels">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="exampleModalLabels">店铺列表</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal form-wrapper"  style="padding-right: 6%" accept-charset="utf-8">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th>店名</th>
                                                <th>总店/分店</th>
                                                <th>地址</th>
                                                <th>联系方式</th>
                                                <th>开营日期</th>
                                                <th>选择</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:choose>
                                                <c:when test="${shopList.size()==0}">
                                                    <tr>
                                                        <td style="font-weight: bolder;color: black">暂无店铺列表！</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${shopList}" var="item" varStatus="i">
                                                        <tr>
                                                            <td style="width: 35%">
                                                                <div class="row" >
                                                                    <div class="col-sm-3">
                                                                        <a href="#" >
                                                                            <img  alt="100%x200" src="${item.shoppic}"  style="height: 50px; width: 50px; display: block;border: 1px #6f7be2 solid">
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-sm-9">
                                                                            ${item.shopname}
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>${item.shopauth}</td>
                                                            <td>${item.address}</td>
                                                            <td>${item.contact}</td>
                                                            <td>${item.opendate}</td>
                                                            <td>
                                                                <button type="button" class="btn btn-primary selectProduct" id="addShopPanTemp">
                                                                    <a style="color: white" href="${pageContext.request.contextPath}/addPlanShop?shopid=${item.shopid}">选择</a>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div style="padding-left: 35px;margin-top: 40px">
                        <input type="button" value="添加产品" class="btn" style="background-color: #84c0ff" id="addPlanProduct" data-toggle="modal" data-target="#pplanModal">
                    </div>
                    <form class="form-horizontal form-wrapper"  style="padding: 0 3% 0 3%" accept-charset="utf-8">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>甜品</th>
                                <th>描述</th>
                                <th>种类</th>
                                <th>单价(元)</th>
                                <th>每日可售数量</th>
                                <th>销售开始日期</th>
                                <th>销售截止日期</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${productPlanArrayList.size()==0}">
                                    <tr>
                                        <td style="font-weight: bolder;color: black">暂未保存任何商品</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${productPlanArrayList}" var="item" varStatus="i">
                                        <tr>
                                            <td style="width: 35%">
                                                <div class="row" >
                                                    <div class="col-sm-3">
                                                        <a href="#" >
                                                            <img  alt="100%x200" src="${item.pic}"  style="height: 50px; width: 50px; display: block;border: 1px #6f7be2 solid">
                                                        </a>
                                                    </div>
                                                    <div class="col-sm-9">
                                                            ${item.gname}
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${item.description}</td>
                                            <td>${item.category}</td>
                                            <td>${item.price}</td>
                                            <td>${item.num}</td>
                                            <td>${item.beginDate}</td>
                                            <td>${item.deadline}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>

                        <input  id="hiddenGood" type="hidden">
                        <div class="modal fade" id="pplanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="exampleModalLabel">产品列表</h4>
                                    </div>
                                    <div class="modal-body">

                                            <form class="form-horizontal form-wrapper"  style="padding-right: 6%" accept-charset="utf-8">
                                                <table class="table table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th>甜品</th>
                                                        <th>描述</th>
                                                        <th>种类</th>
                                                        <th>建议零售价(元)</th>
                                                        <th>选择</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    <c:choose>
                                                        <c:when test="${goodList.size()==0}">
                                                            <tr>
                                                                <td style="font-weight: bolder;color: black">暂无销售计划！</td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${goodList}" var="item" varStatus="i">
                                                                <tr>
                                                                    <td style="width: 35%">
                                                                        <div class="row" >
                                                                            <div class="col-sm-3">
                                                                                <a href="#" >
                                                                                    <img  alt="100%x200" src="${item.pic}"  style="height: 50px; width: 50px; display: block;border: 1px #6f7be2 solid">
                                                                                </a>
                                                                            </div>
                                                                            <div class="col-sm-9">
                                                                                    ${item.gname}
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>${item.description}</td>
                                                                    <td>${item.category}</td>
                                                                    <td>${item.price}</td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-primary selectProduct" data-toggle="modal" data-target="#trueplanModal">
                                                                            选择<input type="hidden" value="${item.gid}">
                                                                        </button>



                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    </tbody>
                                                </table>

                                            </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="trueplanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="exampleModalLabel3">制定产品</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" accept-charset="utf-8">
                                            <div class="form-group form-line">
                                                <label for="beginDate" class="col-sm-2 control-label">销售开始日期：</label>
                                                <div class="col-sm-10">
                                                    <input type="date" class="form-control from-input" id="beginDate" name="beginDate" value=''>
                                                </div>
                                            </div>
                                            <div class="form-group form-line">
                                                <label for="deadline" class="col-sm-2 control-label">销售结束日期：</label>
                                                <div class="col-sm-10">
                                                    <input type="date" class="form-control from-input" id="deadline" name="deadline" value=''>
                                                </div>
                                            </div>
                                            <div class="form-group form-line">
                                                <label for="price" class="col-sm-2 control-label">零售价(元)：</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control from-input" id="price" name="price" value=''>
                                                </div>
                                            </div>
                                            <div id="postPanel">
                                                <input type="hidden" id="chart" value="">
                                                <div id="predicateChart" style="width: 550px;height: 300px"></div>
                                                <div id="predicateChartText" style="font-weight: bolder;font-family:Microsoft YaHei;color:black"></div>
                                            </div>
                                            <div class="form-group form-line">
                                                <label for="num" class="col-sm-2 control-label">每日可售出数量：</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control from-input" id="num" name="num" value=''>
                                                </div>
                                            </div>
                                            <div class="form-group form-line">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <input type="button"  value="添加甜品" class="btn btn-block post-btn" id="createPlanProduct">
                                                    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div style="padding-left: 35px;margin-top: 20px">
                        <button type="button" class="btn" style="background-color: #ffcd29;" id="buy"><a style="color: black" href="${pageContext.request.contextPath}/postPlan">确认通过</a></button>
                    </div>
                    <div style="min-height: 50px"></div>
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
<script src="js/echarts.min.js"></script>
<script src="js/addPlan.js"></script>
</body>
</html>