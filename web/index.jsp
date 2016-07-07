<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/2/17
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <meta name="description" content="">
  <meta name="author" content="">

  <title>DESSERT Home Page</title>

  <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/homepage.css" rel="stylesheet">
  <link href="css/reset.css" rel="stylesheet">
</head>


<body>

<div class="home">
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <p style="font-size: large;font-weight: bold;color: white">Dessert</p>
      </div>
      <div class="col-sm-9 home-links">
        <a href="${pageContext.request.contextPath}/login" id="login">Login</a>
        <a href="${pageContext.request.contextPath}/register" class="home-register" id="register">Sign up</a>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
        <h1>加入DESSERT会员</h1>
        <h2>尊享超值优惠，享受极致美味</h2>
        <a href="${pageContext.request.contextPath}/register" class="btn btn-lg join-btn">现在就加入</a>
        <p style="height: 130px"></p>
      </div>
    </div>

  </div>
</div>

<div class="home-details">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 text-center">
        <h3>强大的功能和精美的界面？</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-4">
        <div class="feature">
          <img src="${pageContext.request.contextPath}/images/home1.svg" class="img-responsive">
          <strong>强大的功能</strong>
          <p>我应该说啥呢？怎么宣传呢？字数还不够吗？那就再凑一点！这是不标准的15字？</p>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="feature">
          <img src="${pageContext.request.contextPath}/images/home2.svg" class="img-responsive">
          <strong>精美的界面</strong>
          <p>我应该说啥呢？怎么宣传呢？字数还不够吗？那就再凑一点！这是不标准的15字？</p>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="feature">
          <img src="${pageContext.request.contextPath}/images/home3.svg" class="img-responsive">
          <strong>哈哈哈哈哈</strong>
          <p>我应该说啥呢？怎么宣传呢？字数还不够吗？那就再凑一点！这是不标准的15字？</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="home-example">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
        <img src="${pageContext.request.contextPath}/images/logo-mark-white.svg" width="12">
        <h3>这里有朋友圈，具体怎么宣传还没想好~</h3>
        <img src="${pageContext.request.contextPath}/images/1.png" class="img-responsive">
        <br><br><br>
        <h3>同上，这里应该说啥呢？</h3>
        <img src="${pageContext.request.contextPath}/images/2.png" class="img-responsive">
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <br><br><br><br>
  <h1>准备好加入我们了吗？</h1><br>
  <a href="${pageContext.request.contextPath}/register" class="btn btn-lg join-btn">马上加入我们</a>
  <br><br><br><br>
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
<script src="js/homepage.js"></script>

</body>
</html>