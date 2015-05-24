<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/15
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" isELIgnored="false" %>

<div class="row" id="vm-user">
    <div class="col-xs-12">
        <!-- Modal -->
        <div class="modal" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span v-show="dialog.isAdd"><i class="fa fa-plus"></i>&nbsp;新增</span><span
                                v-show="!dialog.isAdd"><i class="fa fa-edit"></i>&nbsp;编辑</span>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form id="user-editor">
                            <div class="form-group">
                                <label for="username">用户名</label> <input type="text"
                                                                         class="form-control"
                                                                         disabled="{{isEdit?'disabled':''}}"
                                                                         id="username" placeholder="用户名"
                                                                         v-model="dialog.form.username">
                            </div>
                            <div class="form-group">
                                <label for="roleid">角色</label> <select class="form-control"
                                                                       id="roleid" v-model="dialog.form.roleid"
                                                                       options="roleOptions" multiple
                                                                       placeholder="角色"></select>
                            </div>
                            <div class="form-group">
                                <label for="nickname">昵称</label> <input type="text"
                                                                        class="form-control" id="nickname"
                                                                        placeholder="昵称"
                                                                        v-model="dialog.form.nickname">
                            </div>

                            <div class="form-group">
                                <label for="comment">备注</label> <input type="text"
                                                                       class="form-control" id="comment"
                                                                       placeholder="备注"
                                                                       v-model="dialog.form.comment">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer no-padding">
                        <div class="btn btn-danger col-xs-6 btn-flat no-margin  btn-lg"
                             data-dismiss="modal">
                            <i class="fa fa-close"></i>&nbsp;关闭
                        </div>
                        <div class="btn btn-primary col-xs-6 pull-right btn-flat no-margin btn-lg"
                             v-on="click:save">
                            <i class="fa fa-save"></i>&nbsp;保存
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <div class="form-inline">
                    <select class="form-control" v-model="condition.roleid"
                            options="roleOptions" style="width: 100px; display: inline-block;"></select>
                    <input type="text" class="form-control"
                           v-model="condition.username" placeholder="用户名"
                           style="width: 100px; display: inline-block;"/>
                    <button class="btn btn-success btn-flat">
                        <i class="fa fa-search" v-on="click:search"></i>
                    </button>
                    <button class="btn btn-primary btn-flat" v-on="click:add">
                        <i class="fa fa-plus"></i> 新增
                    </button>
                </div>
            </div>
            <div class="box-body">
                <div class=" table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>用户名</th>
                            <th>角色</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>状态</th>
                            <th>备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-repeat="user:(page==null?[]:page.list)">
                            <td><a title="编辑" href="javascript:;"
                                   v-on="click:edit(user)"><i
                                    class="fa fa-edit  text-success fa-lg"></i></a> &nbsp;<a
                                    title="删除" v-on="click:data_delete(user)" href="javascript:;"><i
                                    class="fa fa-trash fa-lg text-danger"></i></a>
                                &nbsp;&nbsp;&nbsp;{{(page.pager.pageNumber-1)*page.pager.pageSize+$index+1}}
                            </td>
                            <td>{{user.username}}</td>
                            <td>
                                <span class="label label-waring flat" v-repeat="user.roles" style="margin-right: 3px;">
                                    {{alias}}
                                </span>
                            </td>
                            <td>{{user.createTime}}</td>
                            <td>{{user.updateTime}}</td>
                            <td><label
                                    class="flat label label-{{user.locked?'danger':'success'}}">{{user.locked?'已禁用':'已启用'}}</label>
                                <button
                                        class="btn btn-{{user.locked?'success':'danger'}} btn-xs btn-flat"
                                        v-on="click:switch_status(user)">{{user.locked?'启用':'禁用'}}
                                </button>
                            </td>
                            <td>{{user.comment}}</td>
                        </tr>
                        <tr v-show="page.list.length<1">
                            <td align="center" colspan="8">无数据</td>
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
</div>

<script>
    var vm_user = new Vue({
        el: "#vm-user",
        data: {
            dialog: {
                isAdd: true,
                form: {
                    username:null,
                    roleId:null,
                    comment:"测试数据"
                }
            },
            page: {
                ok: null,
                pager: null,
                list: [],
                roles: []
            }
        },
        methods: {
            add: function () {
                this.dialog.isAdd = true;
                $('#myModal').modal('show');
            },
            edit:function (user) {
                this.dialog.form = user;
                this.dialog.isAdd = false;
                $('#myModal').modal('show');
            },
            save: function () {
                var url  = this.dialog.isAdd?"auth/user/add":"auth/user/edit";
                $.post(url,JSON.stringify(this.dialog.form), function (data) {
                    alert(data);
                },"json");
            }
        }
    });

    $(function () {
        $.post("auth/user/list", JSON.stringify({pager: {pageSize: 10, pageNumber: 1}}), function (data) {
            vm_user.$set("page", data);
        }, "json");
    });
</script>