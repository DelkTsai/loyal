<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/25
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../assets/plugins/jstree/themes/default/style.css">
<link rel="stylesheet" href="../../assets/plugins/jstree/themes/default-dark/style.css">
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
                        角色分配
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="jstree1">
                        <ul>
                            <li id="{{name}}_{{id}}" data-jstree='{"type":"auth"}' v-repeat="page.roles">{{alias}}({{name}})</li>
                        </ul>

                    </div>
                </div>
                <div class="modal-footer no-padding">
                    <div class="btn btn-danger col-xs-6 btn-flat no-margin  btn-lg"
                         data-dismiss="modal">
                        <i class="fa fa-close"></i>&nbsp;关闭
                    </div>
                    <div class="btn btn-primary col-xs-6 pull-right btn-flat no-margin btn-lg"
                         v-on="click:save_role">
                        <i class="fa fa-save"></i>&nbsp;保存
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../assets/plugins/jstree/jstree.js"></script>

<style>
    .jstree-open > .jstree-anchor > .fa-folder:before {
        content: "\f07c";
    }

    .jstree-default .jstree-icon.none {
        width: 0;
    }
</style>
<script>
    //////////////////


</script>
