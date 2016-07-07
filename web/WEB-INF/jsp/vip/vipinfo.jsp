<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/3/13
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="_token" content="{!! csrf_token() !!}"/>
    <meta name="description" content="Ease Project">
    <meta name="author" content="cristph">
    <link rel="icon" href="../../favicon.ico">

    <title>Dessert | 会员信息</title>

    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/usersetting.css" rel="stylesheet">
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

                <div class="title-box">会员信息</div>

                <div class="white-box">

                    <form class="form-horizontal form-wrapper" accept-charset="utf-8">

                        <div class="form-group form-line">
                            <label for="vid" class="col-sm-2 control-label">会员卡号：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control from-input" id="vid" name="vid" value="${vip.vid}" disabled="true">
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${vip.vipstate=='not_active'}">
                                <div class="form-group form-line">
                                    <label for="vipstate" class="col-sm-2 control-label">会员状态：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="vipstate" name="vipstate" value="未激活会员" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="button"  value="激活会员" class="btn btn-block post-btn" id="invokevip" data-toggle="modal" data-target="#invokevipModal">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                                    </div>
                                </div>


                                <div class="modal fade" id="invokevipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="exampleModalLabel">激活会员</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-wrapper">
                                                    <div class="form-group">
                                                        <label for="money" class="control-label"  style="margin-left: 5%">充值金额：[至少充值200元方可激活会员]</label>
                                                        <input type="text" class="form-control" style="margin-left: 5%; width: 70%" id="money">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="bid" class="control-label" style="margin-left: 5%">银行卡号:</label>
                                                        <input type="text" class="form-control" style="margin-left: 5%; width: 70%" id="bid">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pswd" class="control-label" style="margin-left: 5%">密码:</label>
                                                        <input type="password" class="form-control" style="margin-left: 5%; width: 70%" id="pswd">
                                                    </div>

                                                    <div class="form-group">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left: 5%">取消</button>
                                                        <button type="button" class="btn btn-primary" style="margin-left: 5%" id="invoke">确认充值</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="form-group form-line">
                                    <label for="vipmoney" class="col-sm-2 control-label">会员余额：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="vipmoney" name="money" value="${vip.money}元" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <label for="vipstate" class="col-sm-2 control-label">会员状态：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="vipstate" name="vipstate" value="已激活会员" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <label for="level" class="col-sm-2 control-label">会员等级：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="level" name="level" value="${vip.level}" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <label for="discount" class="col-sm-2 control-label">可享折扣：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="discount" name="discount" value="${vip.discount*10}折" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <label for="score" class="col-sm-2 control-label">会员积分：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="score" name="score" value="${vip.score}" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <label for="signindate" class="col-sm-2 control-label">注册日期：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id=" signindate" name=" signindate" value="${vip.signindate}" disabled="true">
                                    </div>
                                </div>

                                <div class="form-group form-line">
                                    <label for="deadline" class="col-sm-2 control-label">有效期至：</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control from-input" id="deadline" name="deadline" value="${vip.deadline}" disabled="true">
                                    </div>
                                </div>


                                <div class="form-group form-line">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="button"  value="会员充值" class="btn btn-block post-btn" id="chargevip" data-toggle="modal" data-target="#chargevipModal">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                                    </div>
                                </div>


                                <div class="modal fade" id="chargevipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="exampleModalLabel2">会员充值</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-wrapper">
                                                    <div class="form-group">
                                                        <label for="cmoney" class="control-label"  style="margin-left: 5%">充值金额：</label>
                                                        <input type="text" class="form-control" style="margin-left: 5%; width: 70%" id="cmoney">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="cbid" class="control-label" style="margin-left: 5%">银行卡号:</label>
                                                        <input type="text" class="form-control" style="margin-left: 5%; width: 70%" id="cbid">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="cpswd" class="control-label" style="margin-left: 5%">密码:</label>
                                                        <input type="password" class="form-control" style="margin-left: 5%; width: 70%" id="cpswd">
                                                    </div>

                                                    <div class="form-group">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left: 5%">取消</button>
                                                        <button type="button" class="btn btn-primary" style="margin-left: 5%" id="charge">确认充值</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>


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
<script src="js/vipinfo.js"></script>
<script src="js/common.js"></script>
</body>
</html>