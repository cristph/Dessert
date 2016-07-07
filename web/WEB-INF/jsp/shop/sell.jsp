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

    <title>Dessert | 销售</title>

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


            <div class="title-box">销售</div>

            <div class="white-box">
                <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" accept-charset="utf-8" action="/Dessert/sellgood" method="post">
                    <div class="form-group form-line">
                        <label for="sgid" class="col-sm-2 control-label">商品ID：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control from-input" id="sgid" name="sgid" >
                        </div>
                    </div>

                    <div class="form-group form-line">
                        <label for="num" class="col-sm-2 control-label">商品数量：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control from-input" id="num" name="num" >
                        </div>
                    </div>

                    <div class="form-group form-line">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="hidden" id="shopid" value="${shopid}" />
                            <input type="hidden" id="shopauth" value="${shopauth}" />
                            <input type="submit"  value="出售" class="btn btn-block post-btn" id="sell">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}" />
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
</body>
</html>
</body>
</html>


</body>
</html>
