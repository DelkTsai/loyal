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

    <title>后台管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="../assets/img/logo.png">

    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/css/font-awesome.css" rel="stylesheet">

    <link href="../assets/css/animate.css" rel="stylesheet">
    <link href="../assets/css/AdminLTE.css" rel="stylesheet">
    <link href="../assets/plugins/iCheck/square/blue.css" rel="stylesheet">
    <link href="../assets/css/ionicons.css" rel="stylesheet">
    <link href="../assets/css/skins/_all-skins.css" rel="stylesheet">
    <link href="../assets/plugins/layer/skin/layer.css">
    <link href="../assets/plugins/layer/skin/layer.ext.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--required js-->
    <script src="../assets/js/jquery-2.1.1.min.js"></script>
    <script src="../assets/js/vue.js"></script>

</head>

<body class="skin-blue sidebar-mini fixed">
<!-- Site wrapper -->
<div class="wrapper">

    <!-- Main Header. Contains page header -->
    <header class="main-header">
        <!-- Logo -->
        <a href="index.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b style="font-family: 'STLiti';font-size: 2em;"><img src="../assets/img/logo.png"
                                                                                          width="50"></b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b style="font-family: 'STLiti';font-size: 2em;"><img src="../assets/img/logo.png"
                                                                                        width="50"></b> <b>后台管理</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <!--<div class="navbar-text hidden-xs">日期时间</div>-->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">您有4条未读消息</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="../assets/img/user2-160x160.jpg" class="img-circle"
                                                     alt="User Image"/>
                                            </div>
                                            <h4>
                                                支持团队
                                                <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                            </h4>
                                            <p>为什么不买个新的框架？</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">查看全部消息</a></li>
                        </ul>
                    </li>
                    <!-- Notifications: style can be found in dropdown.less -->
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">您有10条通知</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5个新成员加入
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">查看全部成员</a></li>
                        </ul>
                    </li>
                    <!-- Tasks: style can be found in dropdown.less -->
                    <li class="dropdown tasks-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">您有9个任务</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                设计按钮UI
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%"
                                                     role="progressbar" aria-valuenow="20" aria-valuemin="0"
                                                     aria-valuemax="100">
                                                    <span class="sr-only">20% 完成</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">查看全部任务</a>
                            </li>
                        </ul>
                    </li>
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="../assets/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                            <span class="hidden-xs">Loyal</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="../assets/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>

                                <p>
                                    开发人员
                                    <small>2015-5-14 加入</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="col-xs-4 text-center">
                                    <a href="#">粉丝</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">成就</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">好友</a>
                                </div>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">个人资料</a>
                                </div>
                                <div class="pull-right">
                                    <a href="logout" class="btn btn-default btn-flat"><i
                                            class="fa fa-sign-out"></i>退出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar" id="my-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../assets/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
                </div>
                <div class="pull-left info">
                    <p>Loyal</p>

                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">功能导航</li>
                <li v-repeat="menu:menus" class="treeview">
                    <template v-if="menu.child.length>0">
                        <a href="#">
                            <i class="{{menu.icon}}"></i>
                            <span>{{menu.text}}</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li v-repeat="menu.child">
                                <a href="#{{menu.name+'/'+name}}">
                                    <i class="{{icon}}"></i>
                                    <span>{{text}}</span>
                                </a>
                            </li>
                        </ul>
                    </template>
                    <template v-if="menu.child.length==0">
                        <a href="#{{menu.name}}">
                            <i class="{{menu.icon}}"></i> <span>{{menu.text}}</span>
                        </a>
                    </template>
                </li>
                <li class="header">快速导航</li>
                <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>重要事项</span></a></li>
                <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>警告</span></a></li>
                <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>信息</span></a></li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <!-- breadcrumb content -->
            <div>
                <ol class="breadcrumb">
                    <li class="active">
                        <i class="fa fa-home"></i>
                    </li>

                </ol>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- content -->
        </section>
        <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->
    <!-- =============================================== -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="#">Loyal</a>.</strong> 版权所有.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-light" id="control-con">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">

        </ul>
        <!-- Tab panes -->
        <div class="tab-content">

        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class='control-sidebar-bg'></div>
</div>
<!-- ./wrapper -->

<!-- Mainly scripts -->
<script src="../assets/js/bootstrap.js"></script>
<script src="../assets/plugins/iCheck/icheck.js"></script>
<script src="../assets/plugins/slimScroll/jquery.slimscroll.js"></script>
<script src="../assets/plugins/fastclick/fastclick.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/control-setting.js"></script>
<script src="../assets/plugins/layer/layer.js"></script>
<script src="../assets/plugins/layer/extend/layer.ext.js"></script>
<script src="../assets/js/ajaxapp.js"></script>
<script>

    var vm_sidebar = new Vue({
        el: "#my-sidebar",
        data: {
            menus: [
                {name: "home", text: "首页", icon: "fa fa-dashboard", child: []},
                {
                    name: "sys", text: "系统管理", icon: "fa fa-cog", child: [
                    {name: "user", text: "用户管理", icon: "fa fa-user", child: []},
                    {name: "role", text: "角色管理", icon: "fa fa-users", child: []}
                ]
                },
                {
                    name: "wx", text: "微信管理", icon: "fa fa-weixin", child: [
                    {name: "user", text: "微信用户", icon: "fa fa-user", child: []},
                    {name: "menu", text: "自定义菜单", icon: "fa fa-list", child: []}
                ]
                }
            ]
        },
        methods: {}
    });


    ajaxLoad("#my-sidebar");
    <%--Ajax load page--%>

</script>


</body>

</html>
