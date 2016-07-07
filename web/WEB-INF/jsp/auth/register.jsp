<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/2/18
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="_token" content="{!! csrf_token() !!}"/>
    <meta name="description" content="Ease Project">
    <meta name="author" content="cristph">
    <link rel="icon" href="../../favicon.ico">

    <title>Ease Register</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/register.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
</head>

<body>
<div class="outer-wrapper">
    <div class="container inner-wrapper">
        <div class="row">
            <div class="col-md-7 register-right">
                <div class="form-title">
                    个人注册</br>

                </div>

                <form id="login" novalidate="novalidate"  accept-charset="UTF-8" >
                    <div class="form-group"id="emaildiv">
                        <label for="email">邮箱</label>
                        <input type="email" class="form-control" name="email" id="email">
                    </div>
                    <div class="form-group">
                        <label for="nickname">昵称</label>
                        <input type="text" class="form-control" name="nickname" id="nickname">
                    </div>
                    <div class="form-group">
                        <label for="pre-password">密码</label>
                        <input type="password" class="form-control" name="pre-password" id="pre-password">
                    </div>
                    <div class="form-group">
                        <label for="post-password">确认密码</label>
                        <input type="password" class="form-control" name="post-password" id="post-password">
                    </div>
                    <div class="form-group" id="validiv">
                        <label for="validationCode">验证码</label></br>
                        <input type="tetx" class="form-control validation" name="validationCode" id="validationCode">
                        <img src="${pageContext.request.contextPath}/register/getVerifyCodeImage" onclick="reloadVerifyCode()" id="verifyCodeImage"><a href="" class="change-valid">    换一张</a>
                    </div>
                    <input type="button"  value="注册" class="btn btn-block login-btn" id="submitForm">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                </form>

                <div class="form-footer">
                    已经拥有账号<br>
                    <a href="${pageContext.request.contextPath}/login">->直接登陆</a>
                </div>
            </div>
            <div class="col-md-5 register-left"></div>
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
<script src="js/register.js"></script>
</body>
</html>
