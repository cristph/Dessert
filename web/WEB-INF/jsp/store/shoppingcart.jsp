<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/3/15
  Time: 15:46
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

    <title>Dessert | 购物车</title>

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
            <div class="title-box">购物车</div>

            <div class="white-box">
                <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" accept-charset="utf-8">
                    <p style="color: black;font-size: 15px;font-weight: bolder">确认订单信息</p>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>甜品</th>
                            <th>单价(元)</th>
                            <th>数量</th>
                            <th>小计(元)</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:choose>
                            <c:when test="${shoppingcart.size()==0}">
                                <tr>
                                    <td style="font-weight: bolder;color: black">暂无订单！</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${shoppingcart}" var="item">
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
                                        <td>删除</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>
                    </table>

                    <div class="father">
                        <div id="J_CheckDue" class="due float">
                            <div class="realPay" id="realPay_1">
                                <p class="money">
                                    <span class="hd">实付款：</span>
                                <span class="bd">
                                    <span class="tc-rmb">¥</span>
                                    <strong id="J_RealPay">${total_price}</strong>
                                </span>
                                </p>
                            </div>
                            <div class="obtainedPoint" id="obtainedPoint_1">
                                可获得积分：
                            <span class="obtain">
                                <strong>242</strong>点
                            </span>
                            </div>
                        </div>
                    </div>

                    <div class="father">
                        <div id="submitOrder_1" class="go-wrapper">
                            <a  id="J_Go" role="button" class="go-btn"  title="提交订单" data-toggle="modal" data-target="#buyModal">提交订单<s></s></a>
                        </div>

                        <div class="modal fade" id="buyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="exampleModalLabel">订单付款</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-wrapper">
                                            <div class="form-group">
                                                <label for="money" class="control-label"  style="margin-left: 5%">应付金额</label>
                                                <input type="text" class="form-control" style="margin-left: 5%; width: 70%" id="money" value="${total_price}" disabled="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="bid" class="control-label" style="margin-left: 5%">会员卡号:</label>
                                                <input type="text" class="form-control" style="margin-left: 5%; width: 70%" id="bid" value="${vid}" disabled="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="pswd" class="control-label" style="margin-left: 5%">密码:</label>
                                                <input type="password" class="form-control" style="margin-left: 5%; width: 70%" id="pswd">
                                            </div>

                                            <div class="form-group">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left: 5%">取消</button>
                                                <button type="button" class="btn btn-primary" style="margin-left: 5%" id="buy">确认付款</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </form>
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
<script src="js/shoppingcart.js"></script>
</body>
</html>