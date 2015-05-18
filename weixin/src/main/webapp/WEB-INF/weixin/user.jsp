<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/15
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" id="vm-user">
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
                        <tr v-repeat="user:page.list">
                            <td><a title="编辑" href="javascript:;"
                                   v-on="click:data_edit(user)"><i
                                    class="fa fa-edit  text-success fa-lg"></i></a> &nbsp;<a
                                    title="删除" v-on="click:data_delete(user)" href="javascript:;"><i
                                    class="fa fa-trash fa-lg text-danger"></i></a>
                                &nbsp;&nbsp;&nbsp;{{(page.pager.pageNumber-1)*page.pager.pageSize+$index+1}}
                            </td>
                            <td>{{user.username}}</td>
                            <td><span class="label label-warning"><template v-repeat="user.roles">{{$index==0?alias:","+alias}}
                            </template></span></td>
                            <td>{{user.createTime}}</td>
                            <td>{{user.updateTime}}</td>
                            <td><label
                                    class="label label-{{user.locked?'success':'danger'}}">{{user.locked?'已启用':'已禁用'}}</label>
                                <button
                                        class="btn btn-{{!user.locked?'success':'danger'}} btn-xs"
                                        v-on="click:switch_status(user)">{{!user.locked?'启用':'禁用'}}
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
                <%@include file="../share/pager.jsp" %>
            </div>
        </div>
    </div>
</div>

<script>
    var vm_user = new Vue({
        el: "#vm-user",
        data: {
            page: {
                list: [
                    {username: "loyal", roles: [{alias: "admin"}, {alias: "test"}]}
                ],
                pager: {
                    pageNumber: 1,
                    pageSize: 10,
                    pageCount: 2,
                    recordCount: 15
                }
            }
        },
        methods: {
            add: function () {

            }
        }
    });
</script>