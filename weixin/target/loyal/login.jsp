<%--
Created by IntelliJ IDEA.
User: Loyal
Date: 2015/5/15
Time: 10:55
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <title> 后台管理 - 登录</title>
    <link rel="shortcut icon" href="assets/img/logo.png">

    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">

    <link href="assets/css/animate.css" rel="stylesheet">
    <link href="assets/css/AdminLTE.css" rel="stylesheet">
    <link href="assets/plugins/iCheck/square/blue.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login-page" style="background: url('assets/img/boxed-bg.jpg');">

<div class="login-box animated">
    <div class="login-logo">
        <a href="#"><img src="../assets/img/logo.png" width="30%" class="img-circle" alt="User Image"/></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body" style="background-color: rgba(255,255,255,0.5);">
        <p class="login-box-msg text-bold">后台管理系统</p>

        <form action="login" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="username" placeholder="用户名" required/>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="password" placeholder="密码" required/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="rememberMe"> 记住我
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-sign-out"></i> 登录
                    </button>
                </div>
                <!-- /.col -->

            </div>
            <div class="row">
                <div class="col-xs-12">
                    <label class="label label-danger center-block flat <%=session.getAttribute("loginMsg") == null ? "hidden" : ""%>" style="line-height: 30px;">
                        <%=session.getAttribute("loginMsg") == null ? "" : session.getAttribute("loginMsg")%>
                    </label>
                    <%session.removeAttribute("loginMsg"); %>
                </div>
            </div>
        </form>

        <!--<div class="social-auth-links text-center">-->
        <!--<p>- OR -</p>-->
        <!--<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in-->
        <!--using Facebook</a>-->
        <!--<a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Sign-->
        <!--in using Google+</a>-->
        <!--</div>-->
        <!-- /.social-auth-links -->

        <%--<a href="#">忘记密码</a> <a href="#" class="text-center pull-right">注册</a>--%>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- Mainly scripts -->
<script src="assets/js/jquery-2.1.1.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/plugins/iCheck/icheck.js"></script>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>
