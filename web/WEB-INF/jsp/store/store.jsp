<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/3/14
  Time: 17:36
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

    <title>Dessert | 买买买！</title>

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
            <div class="col-sm-1 frame-left">
                <a href="${pageContext.request.contextPath}/store?category=cake&shopid=${shopid}"><div class="setting-left">糕点</div></a>
                <a href="${pageContext.request.contextPath}/store?category=biscuit&shopid=${shopid}"><div class="setting-left">饼干</div></a>
                <a href="${pageContext.request.contextPath}/store?category=drink&shopid=${shopid}"><div class="setting-left">饮品</div></a>
            </div>

            <div class="col-sm-10 frame-middle">

                <div class="title-box">store</div>

                <div class="white-box">

                    <div class="row cus-row">
                        <c:choose>
                            <c:when test="${list.size()==0}">
                                <p>暂无商品出售</p>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="item">
                                    <div class="col-sm-3">
                                        <div class="thumbnail">
                                            <a href="${pageContext.request.contextPath}/goodinfo?sgid=${item.sgid}">
                                                <img  alt="100%x200" src="${item.pic}"  style="height: 200px; width: 100%; display: block;">
                                            </a>
                                            <div class="caption">
                                                <p class="productPrice"><em title="45.00"><b>¥</b>${item.price}</em></p>
                                                <p class="productTitle"><a href="${pageContext.request.contextPath}/goodinfo?sgid=${item.sgid}" >${item.gname}</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </div>

            <div class="col-sm-1">
                <div class="well pinned" style="margin-top: 15%">
                    我是购物车！
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
<script src="js/jquery.pin.min.js"></script>

<script>
    $(".pinned").pin({containerSelector: ".container", minWidth: 940});
</script>
</body>
</html>
