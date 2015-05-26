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

<div class="row" id="vm-user">

    <%--<%@include file="../share/modal.jsp" %>--%>

    <%--模态对话框，用于角色分配--%>
    <div class="col-xs-12">
        <!-- Modal -->
        <div class="modal" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">
                            角色分配
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div id="jstree1">
                            <ul>
                                <li id="{{name}}_{{id}}" data-jstree='{"type":"auth"}' v-repeat="page.roles">
                                    {{alias}}({{name}})
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="modal-footer no-padding">
                        <div class="btn btn-default col-xs-6 btn-flat no-margin  btn-lg"
                             data-dismiss="modal">
                            <i class="fa fa-close"></i>&nbsp;关闭
                        </div>
                        <div class="btn btn-success col-xs-6 pull-right btn-flat no-margin btn-lg"
                             v-on="click:save_role">
                            <i class="fa fa-save"></i>&nbsp;保存
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--页面的主要内容部分    --%>
    <div class="col-xs-12">
        <div class="box box-success">
            <div class="box-header">
                <div class="form-inline">
                    <select class="form-control" v-model="condition.form.roleid"
                            options="condition.option" style="width: 100px; display: inline-block;"></select>
                    <input type="text" class="form-control"
                           v-model="condition.form.username" placeholder="用户名"
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
                            <th>用户名</th>
                            <th>角色</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>状态</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-repeat="user:(page==null?[]:page.list)" class="{{user.locked?'bg-warning':''}}">
                            <td>{{(page.pager.pageNumber-1)*page.pager.pageSize+$index+1}}</td>
                            <td><b>{{user.username}}</b></td>
                            <td>
                                <span class="label label-default" v-if="user.roles.length<1"
                                      style="margin-right: 3px;border-radius: 10px;cursor: pointer;" title="点击分配角色"
                                      v-on="click:edit_role(user)">
                                    未分配
                                </span>
                                <span class="label label-waring" v-on="click:edit_role(user)" v-repeat="role:user.roles"
                                      style="margin-right: 3px;border-radius: 10px;cursor: pointer;" title="点击修改角色">
                                    {{role.alias}}
                                </span>
                            </td>
                            <td>{{user.createTime}}</td>
                            <td>{{user.updateTime}}</td>
                            <td>
                                <button class="btn btn-{{user.locked?'warning':'success'}} btn-xs"
                                        v-on="click:lock(user)" title="{{user.locked?'点击启用':'点击锁定'}}">
                                    {{user.locked?'已锁定':'已启用'}}
                                </button>
                            </td>
                            <td>{{user.comment}}</td>
                            <td><a title="编辑" href="javascript:;"
                                   v-on="click:edit(user)"><i
                                    class="fa fa-edit  text-green fa-lg"></i></a> &nbsp;<a
                                    title="删除" v-on="click:deleter(user)" href="javascript:;"><i
                                    class="fa fa-trash fa-lg text-red"></i></a>
                            </td>
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

    <%--用户编辑form--%>
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
                <form id="user-editor">
                    <div class="col-md-3">
                        <%--<span class="input-group-addon"><b>用户名</b></span>--%>
                        <input type="text"
                               class="form-control"
                               disabled="{{isEdit?'disabled':''}}"
                               id="username" placeholder="用户名"
                               v-model="panel.form.username">
                    </div>
                    <%--<div class="col-md-3">--%>
                    <%--&lt;%&ndash;<span class="input-group-addon"><b>角色</b></span>&ndash;%&gt;--%>
                    <%--<select class="form-control multiselect" multiple placeholder="角色">--%>
                    <%--<option value="{{name}}" v-repeat="page.roles">{{alias}}</option>--%>
                    <%--</select>--%>
                    <%--</div>--%>
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

<style>
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

<script src="../../assets/js/app/user.js"></script>
