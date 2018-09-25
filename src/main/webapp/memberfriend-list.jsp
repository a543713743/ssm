<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="favicon.ico">
    <link rel="Shortcut Icon" href="favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css"
          href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css"
          href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css"
          href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css"
          href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css"
          href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>User v1.0</title>
    <meta name="keywords"
          content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description"
          content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
    <!-- 此处引入外部CSS,JS文件 -->
    <style>
        .panel{width:60%;margin:0 auto;text-align: center;}
        .form-inline{width:60%;margin:0 auto;}
    </style>
    <script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
    <script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js "></script>
    <link rel="stylesheet"; href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css ">
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>



<%
    int i;
    String s,x,openid;
    s=request.getParameter("userState").toString();
    String req = new String(s);
    openid=request.getParameter("userState").toString();
    x=req.trim();
    //System.out.print(req);	//由于前页面传递的是占位符，用trim方法没有办法去掉，打印出来就是有那么多的占位符
    String s1 = new String("男");
    String s2 = new String("女");
    if(x.equals(s1)){
        i = 0;
    }
    else {
        i = 1;
    }
%>
<div class="Hui-article" ng-app="myApp" ng-controller="editStoreItemController as vm" >
    <div class="cl pd-20">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span
                        class="c-red">*</span>openid:</label>
                <div class="formControls col-xs-8 col-sm-9">
                       <input type="text"   class="input-text" autocomplete="off" ng-model="openid" id="openid" />

                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span
                        class="c-red">*</span>用户姓名:</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text"   class="input-text" autocomplete="off"
                           value="<%=request.getParameter("name") %>" name="name" />
                </div>
            </div>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <button class="btn btn-success radius" id="openidtest" name="openidtest"
                            ng-click="search()">
                        <i class="Hui-iconfont">查询</i>
                    </button>
                </div>
            </div>
            <div style="float:left">
                <table >
                <thead>
                <tr>
                    <td colspan="2">陌生人</td>
                </tr>
                </thead>
                 <tbody>
                <tr class="text-c" ng-repeat="stranger in strangers">
                    <td>{{stranger}}</td>
                    <td><button type="button" ng-click="addFriend(stranger)">加为好友</button></td>
                </tr>
                 </tbody>
            </table>
            </div>
            <div style="float:right">
                <table align="right">
                    <thead>
                    <tr>
                        <td colspan="2">好友</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="text-c" ng-repeat="friend in friends">
                        <td>{{friend.name}}</td>
                        <td><button type="button" ng-click="deletefriend(friend.name)">删除</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
    </article>
</div>
</div>



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
    app.controller('editStoreItemController', function($scope, $http,NgTableParams) {
        var vm= this;
        $scope.openid=<%=request.getParameter("openid") %>;
        //页面加载自动执行，查询数据
        $http({
            method : 'GET',
            url : '${pageContext.request.contextPath}/user/getAllF',
            param : {
                openid : $scope.openid
            }
        }).then(function successCallback(response) {
            $scope.friends = response.data;
            datas = $scope.friends;
            var simpleList = datas ;
            vm.tableParams = new NgTableParams({}, {
                dataset: simpleList
            });
        }, function errorCallback(response) {
        });
        $scope.search = function() {
            $http({
                method : 'GET',
                url : '${pageContext.request.contextPath}/user/getAllFriends',
                params : {
                    openid : $scope.openid
                }
            }).then(function successCallback(response) {
                $scope.friends = response.data;
                datas = $scope.friends;
                var simpleList = datas ;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
            $scope.search1();
        };
        $scope.deletefriend = function(name) {
            $http({
                method : 'GET',
                url : '${pageContext.request.contextPath}/user/deleteFriends',
                params : {
                    openid : $scope.openid,
                    name : name
                }
            }).then(function successCallback(response) {
                $scope.friends = response.data;
                datas = $scope.friends;
                var simpleList = datas ;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
            $scope.search1();
        };
        $scope.search1 = function() {
            $http({
                method : 'GET',
                url : '${pageContext.request.contextPath}/user/getStranger',
                params : {
                    openid : $scope.openid
                }
            }).then(function successCallback(response) {
                $scope.strangers = response.data;
                datas = $scope.strangers;
                var simpleList = datas ;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
        };
        $scope.addFriend= function(stranger) {
            $http({
                method : 'GET',
                url : '${pageContext.request.contextPath}/user/addFriend',
                params : {
                    openid : $scope.openid,
                    name : stranger
                }
            }).then(function successCallback(response) {
                $scope.strangers = response.data;
                datas = $scope.strangers;
                var simpleList = datas ;
                vm.tableParams = new NgTableParams({}, {
                    dataset: simpleList
                });
            }, function errorCallback(response) {
            });
            $scope.search();
        };

    });
    function editStoreItemController(NgTableParams) {
        var simpleList = datas ;
        var vm= this;
        vm.tableParams = new NgTableParams({}, {
            dataset: simpleList
        });
    };
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>