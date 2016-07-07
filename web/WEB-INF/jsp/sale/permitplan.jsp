<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
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

    <title>Dessert | 批准产品计划</title>

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
                <div class="title-box">批准产品计划</div>
                <div class="white-box" style="padding: 5%">
                    <form class="form-horizontal form-wrapper"  style="padding:0" accept-charset="utf-8">
                        <p style="color: black;font-size: 15px;font-weight: bolder">批准产品计划</p>

                        <c:choose>
                            <c:when test="${list.size()==0}">
                                暂无产品计划
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="productPlan" varStatus="i">
                                    <p>
                                        店铺名：${productPlan.shop.shopname}   |地址： ${productPlan.shop.address}
                                        |<c:choose>
                                        <c:when test="${productPlan.permission=='permitted'}">
                                            已批准
                                        </c:when>
                                        <c:otherwise>
                                            <a data-toggle="modal" data-target="#planModal${i.count}" style="cursor: pointer">批准</a>
                                        </c:otherwise>
                                    </c:choose>
                                    </p>
                                    <div class="modal fade" id="planModal${i.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="exampleModalLabel">确认通过</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-wrapper">

                                                        <div class="form-group">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left: 5%">取消</button>
                                                            <button type="button" class="btn btn-primary" style="margin-left: 5%" id="buy"><a style="color: white" href="${pageContext.request.contextPath}/permit?planid=${productPlan.planid}">确认通过</a></button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>甜品</th>
                                            <th>描述</th>
                                            <th>种类</th>
                                            <th>单价(元)</th>
                                            <th>库存数量</th>
                                            <th>销售开始日期</th>>
                                            <th>销售截止日期</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:choose>
                                            <c:when test="${productPlan.saleGoodArrayList.size()==0}">
                                                <tr>
                                                    <td style="font-weight: bolder;color: black">计划内暂无产品！</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${productPlan.saleGoodArrayList}" var="item">
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
                                    <div style="height: 50px"></div>
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
</body>
</html>
</body>
</html>
