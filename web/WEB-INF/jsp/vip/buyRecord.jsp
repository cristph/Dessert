<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/3/17
  Time: 15:43
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

    <title>Dessert | 消费记录</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
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
                <li><a href="${pageContext.request.contextPath}/viewshoplist">商店</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/setting">设置</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">登出</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="outer-frame">
    <div class="container inner-frame">
        <div class="row main-frame">
            <div class="col-sm-2 frame-left">
                <a href="${pageContext.request.contextPath}/setting"><div class="setting-left">基本信息</div></a>
                <a href="${pageContext.request.contextPath}/resetpswd"><div class="setting-left">重置密码</div></a>
                <a href="${pageContext.request.contextPath}/vipinfo"><div class="setting-left">会员信息</div></a>
                <a href="${pageContext.request.contextPath}/chargerecord"><div class="setting-left">充值记录</div></a>
                <a href="${pageContext.request.contextPath}/buyrecord"><div class="setting-left">消费记录</div></a>
            </div>

            <div class="col-sm-9 frame-middle">

                <div class="title-box">消费记录</div>

                <div class="white-box">

                    <form class="form-horizontal form-wrapper"  style="padding-right: 6%" accept-charset="utf-8">

                        <c:choose>
                            <c:when test="${orderlist.size()==0}">
                                <p style="font-weight: bolder;color: black">暂无消费记录</p>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${orderlist}" var="order">
                                    <p style="font-weight: bolder;color: black">订单编号:${order.saleorder.soid}</p>
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th>甜品名</th>
                                            <th>单价(元)</th>
                                            <th>数量</th>
                                            <th>小计(元)</th>
                                            <th>合计(元)</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:choose>
                                            <c:when test="${order.shoppingCartItemArrayList.size()==0}">
                                                <tr>
                                                    <td style="font-weight: bolder;color: black">暂无订单！</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${order.shoppingCartItemArrayList}" var="item" varStatus="i">
                                                    <tr>
                                                        <td style="width: 40%">
                                                            <div class="row" >
                                                                <div class="col-sm-3">
                                                                    <a href="#" >
                                                                        <img  alt="100%x200" src="${item.good.pic}"  style="height: 50px; width: 50px; display: block;border: 1px #6f7be2 solid">
                                                                    </a>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                        ${item.good.gname}
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${item.sorderitem.tprice/item.sorderitem.qty}</td>
                                                        <td>${item.sorderitem.qty}</td>
                                                        <td>${item.sorderitem.tprice}</td>
                                                        <c:choose>
                                                            <c:when test="${i.count!=order.shoppingCartItemArrayList.size()}">
                                                                <td>/</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td>${order.saleorder.totalprice}</td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                        </tbody>
                                    </table>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>



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
</body>
</html>
