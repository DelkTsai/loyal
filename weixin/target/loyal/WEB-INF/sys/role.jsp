<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/15
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" id="vm-role">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <button class="btn btn-primary btn-flat" v-on="click:data_add">
                    <i class="fa fa-plus"></i> 新增
                </button>
            </div>
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>角色名</th>
                            <th>别名</th>
                            <th>更新时间</th>
                            <th>创建时间</th>
                            <th>备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-repeat="role:page.list">
                            <td><a title="编辑" href="javascript:;"
                                   v-on="click:data_edit(role)"><i
                                    class="fa fa-edit  text-success fa-lg"></i></a> &nbsp;<a
                                    title="删除" v-on="click:data_delete(role)" href="javascript:;"><i
                                    class="fa fa-trash fa-lg text-danger"></i></a>
                                &nbsp;&nbsp;&nbsp;{{(page.pager.pageNumber-1)*page.pager.pageSize+$index+1}}
                            </td>
                            <td>{{role.name}}</td>
                            <td>{{role.alias}}</td>
                            <td>{{role.updateTime}}</td>
                            <td>{{role.createTime}}</td>
                            <td>{{role.comment}}</td>
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
    var vm_role = new Vue({
        el:"#vm-role",
        data:{
            page:{
                list:[
                    {name:"admin",alias:"管理员"}
                ],
                pager:{
                    pageNumber:1,
                    pageSize:10,
                    pageCount:2,
                    recordCount:15
                }
            }
        },
        methods:{

        }
    });
</script>