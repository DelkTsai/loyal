<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/15
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" isELIgnored="false" %>

<div class="row" id="vm-role">

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
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-repeat="role:(page==null?[]:page.list)">
                            <td>{{(page.pager.pageNumber-1)*page.pager.pageSize+$index+1}}</td>
                            <td>{{role.name}}</td>
                            <td>{{role.alias}}</td>
                            <td>{{role.createTime}}</td>
                            <td>{{role.updateTime}}</td>
                            <td>{{role.comment}}</td>
                            <td><a title="编辑" href="javascript:;"
                                   v-on="click:edit(role)"><i
                                    class="fa fa-edit  text-green fa-lg"></i></a> &nbsp;<a
                                    title="删除" v-on="click:deleter(role)" href="javascript:;"><i
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
                <%--<%@include file="../share/pager.jsp" %>--%>
            </div>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="box box-{{panel.isAdd?'success':'primary'}}">
            <div class="box-header with-border">
                <h3 class="box-title">{{panel.isAdd?'新增':'编辑'}}</h3>

                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
                <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form id="role-editor">
                    <div class="col-md-3">
                        <%--<span class="input-group-addon"><b>角色名</b></span>--%>
                        <input class="form-control"
                               id="name" v-model="panel.form.name"
                               placeholder="角色名">
                    </div>
                    <div class="col-md-3">
                        <%--<span class="input-group-addon"><b>角色名</b></span>--%>
                        <input class="form-control"
                               id="alias" v-model="panel.form.alias"
                               placeholder="别名">
                    </div>
                    <div class="col-md-3">
                        <%--<span class="input-group-addon"><b>备注</b></span>--%>
                        <input type="text"
                               class="form-control" id="comment"
                               placeholder="备注"
                               v-model="panel.form.comment">
                    </div>

                    <div class="col-xs-12" style="margin-top: 5px;">
                        <%--<button type="reset" class="btn btn-primary btn-flat">--%>
                            <%--<i class="fa fa-undo"></i> 重置--%>
                        <%--</button>--%>
                        <button type="button" class="btn btn-success btn-flat" v-on="click:save">
                            <i class="fa fa-save"></i> 保存
                        </button>
                    </div>

                </form>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>

</div>

<script>
    $.AdminLTE.boxWidget.activate();
</script>

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
            }
        },
        methods: {
            add: function () {
                $("#name")[0].focus();
                this.panel.isAdd = true;
                this.panel.form = this.panel.deform;
            },
            edit: function (role) {
                $("#name")[0].focus();
                this.panel.isAdd = false;
                this.panel.form = role;
            },
            save: function () {
                var that = this;
                var url = this.panel.isAdd ? "auth/role/add" : "auth/role/edit";
                $.post(url, JSON.stringify(this.panel.form), function (data) {
                    layer.alert(data.msg);
                    that.list(that.page.pager, null);
                }, "json");
            },
            deleter: function (role) {
                var that = this;
                layer.confirm("删除角色&nbsp;&nbsp;<b class='text-red'>" + role.name + "</b>", {
                    icon: 3,
                    title: '<b>提示</b>'
                }, function (index) {
                    $.post("auth/role/delete", JSON.stringify(user), function (data) {
                        that.list(that.page.pager, null);
                    }, "json");
                    layer.close(index);
                });

            },
            list: function (pager, role) {
                $.post("auth/role/list", JSON.stringify({pager: pager, role: role}), function (data) {
                    vm_role.$set("page", data);
                }, "json");
            },
            search: function () {
                this.list(this.page.pager, this.condition.form);
            }
        },
        ready: function () {
            this.condition.option = [{text: "admin", value: "admin"}];
            this.list({pageSize: 100, pageNumber: 1}, null);
        }
    });
</script>