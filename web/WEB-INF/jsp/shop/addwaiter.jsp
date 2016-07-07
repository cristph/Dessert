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

    <title>Dessert | 注册服务员</title>

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
                <li><a href="${pageContext.request.contextPath}/shoplist">店铺列表</a></li>
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
                <a href="${pageContext.request.contextPath}/editshop?shopid=${shopid}&shopauth=${shopauth}"><div class="setting-left">服务员列表</div></a>
                <a href="${pageContext.request.contextPath}/addwaiter?shopid=${shopid}&shopauth=${shopauth}"><div class="setting-left">注册服务员</div></a>
            </div>

            <div class="col-sm-10 frame-middle">

                <div class="title-box">注册服务员</div>

                <div class="white-box">

                    <form class="form-horizontal form-wrapper"  style="padding-right: 6%;padding-top: 1%" accept-charset="utf-8">

                        <div class="form-group form-line">
                            <label for="email" class="col-sm-2 control-label">邮箱：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="email" name="email" >
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="name" class="col-sm-2 control-label">昵称：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="name" name="name" >
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="pswd" class="col-sm-2 control-label">密码：</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control from-input" id="pswd" name="pswd" >
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="sex" class="col-sm-2 control-label">性别：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex"  value="2"> 女
                                </label>
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="address" class="col-sm-2 control-label">所在地：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="address" name="address" value="${user.address}">
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="birth" class="col-sm-2 control-label">生日：</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control from-input" id="birth" name="birth" value=${user.birth}>
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="selfintro" class="col-sm-2 control-label">个人简介：</label>
                            <div class="col-sm-10">
                                <textarea class="form-control from-input" id="selfintro" name="selfintro" rows="3">${user.selfintro}</textarea>
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <label for="contact" class="col-sm-2 control-label">联系方式：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="contact" name="contact" value="${user.contact}">
                            </div>
                        </div>

                        <div class="form-group form-line">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="hidden" id="shopid" value="${shopid}" />
                                <input type="hidden" id="shopauth" value="${shopauth}" />
                                <input type="button"  value="保存改动" class="btn btn-block post-btn" id="createwaiter">
                                <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                            </div>
                        </div>

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
<script src="js/addwaiter.js"></script>
</body>
</html>