<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/3/15
  Time: 13:17
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

    <title>Dessert | 商品信息</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
    <link href="css/buttons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/goodinfo.css" rel="stylesheet">
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

            <div class="col-sm-3 col-sm-offset-1 frame-left">
                <img  alt="100%x200" src="${salegood.pic}"  style="height: 100%; width: 100%; display: block;border: 2px solid #2588ff">
            </div>

            <div class="col-sm-6 col-sm-offset-1 frame-left">
                <div class="tb-detail-hd">
                    <h1 data-spm="1000983">${salegood.gname}</h1>
                    <p class="newp">踏青总动员 囤吃正当时 300款零食 3折开抢</p>
                </div>

                <div class="good-description">
                    <div class="col-sm-2" style="padding-left: 0">
                        <p class="tb-metatit">描述:</p>
                    </div>
                    <div class="col-sm-10" style="padding-left: 0">
                        <div style="color: white" >${salegood.description}</div>
                    </div>
                </div>

                <div class="tm-promo-price">
                    <p class="tb-metatit">价格:</p>
                   <em class="tm-yen">¥</em> <span class="tm-price">${salegood.price}</span>
                </div>

                <div class="tb-amount tm-clear">
                    <p class="tb-metatit-amount" >数量:</p>
                    <div id="J_Amount">
                        <span class="tb-amount-widget mui-amount-wrap">
                            <input type="text" class="tb-text mui-amount-input" value=1  maxlength="8" title="请输入购买量" id="buy-amount">
                            <span class="mui-amount-btn">
                                <span class="mui-amount-increase" id="mui-amount-increase">+</span>
                                <span class="mui-amount-decrease" id="mui-amount-decrease">-</span>
                            </span>
                            <span class="mui-amount-unit">件</span>
                        </span>
                        <em id="J_EmStock" class="tb-hidden" style="display: inline;">库存${salegood.num}件</em>
                    </div>
                </div>

                <div class="tb-btn-basket tb-btn-sku ">
                    <input type="hidden" value="${salegood.sgid}" id="good-id">
                    <a  rel="nofollow" id="J_LinkBasket" role="button" data-spm-anchor-id="a220o.1000855.0.0">
                        加入购物车
                    </a>
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
<script src="js/goodinfo.js"></script>
</body>
</html>
