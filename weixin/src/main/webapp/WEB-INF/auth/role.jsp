<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/15
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" isELIgnored="false" %>

<link rel="stylesheet" href="../../assets/plugins/jstree/themes/default/style.css">
<link rel="stylesheet" href="../../assets/plugins/jstree/themes/default-dark/style.css">

<div class="row" id="vm-role">

    <div class="col-xs-12">
        <div class="box box-{{panel.isAdd?'success':'primary'}}" id="box-edit" style="display: none;">
            <div class="box-header with-border">
                <h3 class="box-title">{{panel.isAdd?'新增':'编辑'}}</h3>

                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times fa-lg"></i></button>
                </div>
                <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form>
                    <span>
                        <%--<span class="input-group-addon"><b>角色名</b></span>--%>
                        <input class="form-control"
                               id="name" v-model="panel.form.name"
                               placeholder="角色名">
                    </span>
                    <span>
                        <%--<span class="input-group-addon"><b>角色名</b></span>--%>
                        <input class="form-control"
                               id="alias" v-model="panel.form.alias"
                               placeholder="别名">
                    </span>
                    <span>
                        <%--<span class="input-group-addon"><b>备注</b></span>--%>
                        <input type="text"
                               class="form-control" id="comment"
                               placeholder="备注"
                               v-model="panel.form.comment">
                    </span>

                    <span>
                        <%--<button type="reset" class="btn btn-primary btn-flat">--%>
                        <%--<i class="fa fa-undo"></i> 重置--%>
                        <%--</button>--%>
                        <button type="button" class="btn btn-success btn-flat" v-on="click:save">
                            <i class="fa fa-save"></i> 保存
                        </button>
                    </span>

                </form>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>

    <%--模态对话框，用于权限分配--%>
    <div class="col-xs-12">
        <!-- Modal -->
        <div class="modal" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding: 8px;">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            权限分配
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div id="jstree1">
                            <ul v-if="page.permissions!=null">
                                <li id="{{name}}_{{id}}" data-jstree='{"type":"auth"}' v-repeat="page.permissions">
                                    {{alias}}({{name}})
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button class="btn btn-default btn-flat"
                                data-dismiss="modal">
                            <i class="fa fa-close"></i>&nbsp;关闭
                        </button>
                        <button class="btn btn-success btn-flat"
                                v-on="click:save_permission">
                            <i class="fa fa-save"></i>&nbsp;保存
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="box box-success">
            <div class="box-header">
                <div class="form-inline">
                    <input type="text" class="form-control"
                           v-model="condition.form.name" placeholder="角色名"
                           style="width: 100px; display: inline-block;"/>
                    <button class="btn btn-primary btn-flat">
                        <i class="fa fa-search" v-on="click:search"></i>
                    </button>
                    <button class="btn btn-success btn-flat" v-on="click:add">
                        <i class="fa fa-plus"></i> 新增
                    </button>
                </div>
            </div>

            <div class="box-body">
                <div class=" table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>角色名</th>
                            <th>别名</th>
                            <th>权限</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-repeat="obj:(page==null?[]:page.list)">
                            <td>{{(page.pager.pageNumber-1)*page.pager.pageSize+$index+1}}</td>
                            <td>{{obj.name}}</td>
                            <td>{{obj.alias}}</td>
                            <td>
                                <span class="label label-default" v-if="obj.permissions.length<1"
                                      style="margin-right: 3px;border-radius: 10px;cursor: pointer;" title="点击分配权限"
                                      v-on="click:edit_permission(obj)">
                                    未分配
                                </span>
                                <span class="label label-waring" v-if="obj.permissions.length>0"
                                      v-on="click:edit_permission(obj)"
                                      style="margin-right: 3px;border-radius: 10px;cursor: pointer;" title="点击分配权限">
                                   <template v-repeat="permission:obj.permissions">
                                       {{$index==0?permission.alias:'、'+permission.alias}}
                                   </template>
                                </span>
                            </td>
                            <td>{{obj.createTime}}</td>
                            <td>{{obj.updateTime}}</td>
                            <td>{{obj.comment}}</td>
                            <td><a title="编辑" href="javascript:;"
                                   v-on="click:edit(obj)"><i
                                    class="fa fa-edit  text-blue fa-lg"></i></a> &nbsp;<a
                                    title="删除" v-on="click:deleter(obj)" href="javascript:;"><i
                                    class="fa fa-trash fa-lg text-red"></i></a>
                            </td>
                        </tr>
                        <tr v-show="page.list.length<1">
                            <td align="center" colspan="7">无数据</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="box-footer">
                <%@include file="../share/pager.jsp" %>
            </div>
        </div>
    </div>
</div>

<style>
    form span {
        display: inline-block;
        width: 150px;
    }

    .jstree-open > .jstree-anchor > .fa-folder:before {
        content: "\f07c";
    }

    .jstree-default .jstree-icon.none {
        width: 0;
    }
</style>

<script>
    $.AdminLTE.boxWidget.activate();
</script>

<script src="../../assets/plugins/jstree/jstree.js"></script>

<script>
    var vm_role = new Vue({
        el: "#vm-role",
        data: {
            condition: {
                form: {
                    name: "",
                    alias: "admin",
                    comment: ""
                },
                option: []
            },
            panel: {
                isAdd: true,
                form: {
                    name: null,
                    alias: null,
                    comment: null
                },
                deform: {
                    name: null,
                    alias: null,
                    comment: "测试数据"
                }
            },
            page: {
                ok: null,
                pager: null,
                list: []
            },
            tree: null,
            tree_role: null
        },
        methods: {
            add: function () {
                $("#box-edit").slideDown();
                $("#name")[0].focus();
                this.panel.isAdd = true;
                this.panel.form = this.panel.deform;
            },
            edit: function (obj) {
                $("#box-edit").slideDown();
                $("#name")[0].focus();
                this.panel.isAdd = false;
                this.panel.form = obj;
            },
            save: function () {
                var that = this;
                var url = this.panel.isAdd ? "auth/role/add" : "auth/role/edit";
                $.post(url, JSON.stringify(this.panel.form), function (data) {
                    layer.msg(data.msg);
                    that.list(that.page.pager, null);
                }, "json");
            },
            deleter: function (obj) {
                var that = this;
                layer.confirm("删除角色&nbsp;&nbsp;<b class='text-red'>" + obj.name + "</b>", {
                    icon: 3,
                    title: '<b>提示</b>'
                }, function (index) {
                    layer.close(index);
                    $.post("auth/role/delete", JSON.stringify(obj), function (data) {
                        layer.msg(data.msg);
                        datathat.list(that.page.pager, null);
                    }, "json");
                });

            },
            list: function (pager, obj) {
                $.post("auth/role/list", JSON.stringify({pager: pager, role: obj}), function (data) {
                    vm_role.$set("page", data);
                }, "json");
            },
            search: function () {
                this.list(this.page.pager, this.condition.form);
            },
            edit_permission: function (obj) {
                $("#myModal").modal("show");
                $("#myModalLabel").html("角色分配 - <b class='text-red'>" + obj.name + "</b>");
                this.tree.uncheck_all();
                vm_role.$set("tree_role", obj);
                var permissions = [];
                $(obj.permissions).each(function (index, item) {
                    permissions.push(item.name + "_" + item.id);
                });
                this.tree.check_node(permissions);
            },
            save_permission: function () {
                var checked = this.tree.get_checked();
                var permissions = [];
                $(this.page.permissions).each(function (index, item) {
                    if (checked.indexOf(item.name + "_" + item.id) > -1) permissions.push(item);
                });
                var that = this;

                $.post("auth/role/edit_permission", JSON.stringify({
                    permissions: permissions,
                    role: that.tree_role
                }), function (data) {
                    $("#myModal").modal("hide");
                    layer.msg(data.msg);
                    that.list(that.page.pager, null);
                }, "json");
            },
            firstPage: function () {
                this.page.pager.pageNumber = 1;
                this.list(this.page.pager, null);
            },
            lastPage: function () {
                this.page.pager.pageNumber = this.page.pager.pageCount;
                this.list(this.page.pager, null);
            },
            prevPage: function () {
                this.page.pager.pageNumber = this.page.pager.pageNumber - 1;
                if (this.page.pager.pageNumber < 1) this.page.pager.pageNumber = 1;
                this.list(this.page.pager, null);
            },
            nextPage: function () {
                this.page.pager.pageNumber = this.page.pager.pageNumber + 1;
                if (this.page.pager.pageNumber > this.page.pager.pageCount) this.page.pager.pageNumber = this.page.pager.pageCount;
                this.list(this.page.pager, null);
            },
            goPage: function () {
                this.page.pager.pageNumber = $("#pageNumber").val();
                if (this.page.pager.pageNumber < 1) this.page.pager.pageNumber = 1;
                if (this.page.pager.pageNumber > this.page.pager.pageCount) this.page.pager.pageNumber = this.page.pager.pageCount;
                this.list(this.page.pager, null);
            },
            size_change: function () {
                this.page.pager.pageNumber = 1;
                this.page.pager.pageSize = $("#pageSize").val();
                this.list(this.page.pager, null);
            },
            initTree: function () {
                $('#jstree1').jstree({
                    'core': {
                        'check_callback': true
                    },
                    'plugins': ['types', 'dnd', 'checkbox'],
                    'types': {
                        'default': {
                            'icon': 'fa fa-folder'
                        },
                        'auth': {
                            'icon': 'fa fa-user-secret'
                        }
                    }
                });
                this.tree = $.jstree.reference("#jstree1");
            }
        },
        ready: function () {
            this.list({pageSize: 5, pageNumber: 1}, null);
            var that = this;
            setTimeout(function () {
                that.initTree();
            }, 500);
        }
    });
</script>