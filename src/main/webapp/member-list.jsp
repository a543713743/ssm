<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="favicon.ico">
    <link rel="Shortcut Icon" href="favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css"
          href="static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css"
          href="lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css"
          href="static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css"
          href="static/h-ui.admin/css/style.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>User v1.0</title>
    <meta name="keywords"
          content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description"
          content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
    <!-- 此处引入外部CSS,JS文件 -->
    <style>
        .panel {
            width: 60%;
            margin: 0 auto;
            text-align: center;
        }

        .form-inline {
            width: 60%;
            margin: 0 auto;
        }
    </style>
    <script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
    <script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js "></script>
    <link rel="stylesheet" ; href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css ">
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!--_header 作为公共模版分离出去-->
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <a class="logo navbar-logo f-l mr-10 hidden-xs"
               href="/aboutHui.shtml">User</a> <a
                class="logo navbar-logo-m f-l mr-10 visible-xs"
                href="/aboutHui.shtml">H-ui</a> <span
                class="logo navbar-slogan f-l mr-10 hidden-xs">V1.0</span> <a
                aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
                href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;"
                                                           class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i
                            class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;"
                                   onclick="member_add('添加用户','member-add.jsp','','510')"><i
                                    class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>超级管理员</li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"><a
                            href="javascript:;" class="dropDown_A" title="换肤"><i
                            class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">

    <div class="menu_dropdown bk_2">

        <dl id="menu-member">
            <dt>
                <i class="Hui-iconfont"></i> <a href="member-list.jsp"
                                                title="用户管理">用户管理</a><i
                    class="Hui-iconfont menu_dropdown-arrow"></i>
            </dt>
        </dl>

    </div>
</aside>
<div class="dislpayArrow hidden-xs">
    <a class="pngfix" href="javascript:void(0);"
       onClick="displaynavbar(this)"></a>
</div>
<!--/_menu 作为公共模版分离出去-->
<section class="Hui-article-box">
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i> <a href="index.jsp">首页</a> <span class="c-gray en">&gt;</span>
        <a href="index.jsp">用户中心</a> <span class="c-gray en">&gt;</span> 用户列表<a
            class="btn btn-success radius r"
            style="line-height: 1.6em; margin-top: 3px"
            href="member-list.jsp" title="刷新"><i
            class="Hui-iconfont">&#xe68f;</i>返回列表 </a></nav>


    <!-- 此处ng-cotroller进行更改 -->
    <div class="Hui-article" ng-app="myApp" ng-controller="editStoreItemController as vm">
        <article class="cl pd-20">
            <div class="text-c">
                <input type="text" class="input-text" style="width: 250px"
                       placeholder="输入用户姓名或电话号码" id="keyword" name="keyword" ng-model="keyword">
                <button class="btn btn-success radius" id="" name=""
                        ng-click="search()">
                    <i class="Hui-iconfont">&#xe665;</i> <spring:message code="search"/>
                </button>


            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="bathDelete()"
                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a href="javascript:;"
                                onclick="member_add('添加用户','member-add.jsp','600','670')"
                                class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加用户</a></span> <span class="r">共有数据：<strong>{{users.length}}</strong>
				条
			</span>
            </div>

            <div class="mt-20">

                <table ng-table="vm.tableParams" id="11"
                       class="table table-border table-bordered table-hover table-bg table-sort ">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="100">openid</th>
                        <th width="100">用户姓名</th>
                        <th width="150">用户手机</th>
                        <th width="100">用户年龄</th>
                        <th width="100">身高</th>
                        <th width="70">用户性别</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 这里的for-each 要更改为$data -->
                    <tr class="text-c" ng-repeat="user in $data">
                        <td><input type="checkbox" value="1" name=""
                                   onclick="clicked(this)"></td>
                        <td>{{user.openid}}</td>
                        <td>{{user.name}}</td>
                        <td>{{user.phone}}</td>
                        <td>{{user.point}}</td>
                        <td>{{user.deposit}}</td>
                        <td>
                            <div ng-app="" ng-init="points=['男','女']">
                                <p><span class="label label-success radius" ng-bind="points[user.userState]"></span></p>
                            </div>
                        </td>


                        <td class="td-manage"><a style="text-decoration: none"
                                                 class="ml-5"
                                                 onclick="member_change('好友关系','memberfriend-list.jsp',this,'600','670')"
                                                 href="javascript:;" title="好友"><i class="Hui-iconfont">&#xe61f;</i></a>
                            &nbsp&nbsp<a style="text-decoration: none" class="ml-5"
                                         onclick="member_change('修改','member-change.jsp',this,'600','670')"
                                         href="javascript:;" title="修改"><i class="Hui-iconfont">&#xe63f;</i></a>
                            &nbsp &nbsp<a title="删除" href="javascript:;"
                                          onclick="member_del(this)" class="ml-5"
                                          style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/angularjs/1.6.0/angular.min.js"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
        src="static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
        src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    /*用户-查询*/
    var array = new Array();
    var app = angular.module('myApp', ['ngTable']);
    var datas;
    editStoreItemController.$inject = ["NgTableParams"];
    app.controller("editStoreItemController", editStoreItemController);
    app.controller('editStoreItemController', function ($scope, $http, NgTableParams) {
        var vm = this;
        //页面加载自动执行，查询数据
        $http({
            method: 'GET',
            url: '${pageContext.request.contextPath}/user/getAllUser'
        }).then(function successCallback(response) {
            $scope.users = response.data;
            datas = $scope.users;
            var simpleList = datas;
            vm.tableParams = new NgTableParams({}, {
                dataset: simpleList
            });
        }, function errorCallback(response) {
        });
        $scope.search = function () {
            $http({
                method: 'GET',
                url: '${pageContext.request.contextPath}/user/search',
                params: {
                    name: $scope.keyword
                }
            }).then(function successCallback(response) {
                $scope.users = response.data;
                datas = $scope.users;
                var simpleList = datas;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
        };
        $scope.search2 = function () {
            $http({
                method: 'GET',
                url: '${pageContext.request.contextPath}/user/search',
                params: {
                    openid: $scope.keyword
                }
            }).then(function successCallback(response) {
                $scope.users = response.data;
                datas = $scope.users;
                var simpleList = datas;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
        };
        $scope.search1 = function () {
            $http({
                method: 'GET',
                url: '${pageContext.request.contextPath}/user/search',
                params: {
                    phone: $scope.keyword
                }
            }).then(function successCallback(response) {
                $scope.users = response.data;
                datas = $scope.users;
                var simpleList = datas;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
        };
    });
    function editStoreItemController(NgTableParams) {
        var simpleList = datas;
        var vm = this;
        vm.tableParams = new NgTableParams({}, {
            dataset: simpleList
        });
    };


    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-修改*/
    function member_change(title, url, obj, w, h) {
        var u = url + "?openid="
            + $(obj).parents("tr").children().eq(1).text() + "&name="
            + $(obj).parents("tr").children().eq(2).text() + "&phone="
            + $(obj).parents("tr").children().eq(3).text() + "&point="
            + $(obj).parents("tr").children().eq(4).text()
            + "&deposit="
            + $(obj).parents("tr").children().eq(5).text()
            + "&userState="
            + $(obj).parents("tr").children().eq(6).text();
        layer_show(title, u, w, h);

    }
    //批量删除
    function bathDelete() {
        //array转成字符串 作为参数
        var stringarray = array.toString();
        var i = 0;
        layer.confirm('确认要删除吗？', function (index) {
            $.get("${pageContext.request.contextPath}/user/bathDelete", {
                checked: stringarray
            });
            window.parent.location.reload();
        });
    }

    //checkbox 被选中的那行的openid存进arrary
    function clicked(obj) {
        array.push($(obj).parents("tr").children().eq(1).text());
    }

    /*用户-删除*/
    function member_del(obj) {
        layer.confirm('确认要删除吗？', function (index) {
            $.get("./user/deleteUser", {
                openid: $(obj).parents("tr").children().eq(1).text()
            });
            window.parent.location.reload();
        });
        //var tr1 = node.parentNode.parentNode;
        //var name = tr1.cells[2].innerText
        //alert(tr1.rowIndex);
        //alert(tr1.cells[1].innerText); //获取的方法二
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>