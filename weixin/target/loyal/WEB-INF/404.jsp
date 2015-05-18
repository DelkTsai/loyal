<%--
  Created by IntelliJ IDEA.
  User: Loyal
  Date: 2015/5/15
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    response.setStatus(HttpServletResponse.SC_OK);
%>
<div class="error-page">
    <h2 class="headline text-yellow"> 404</h2>

    <div class="error-content">
        <h3 class="text-center"><i class="fa fa-warning text-yellow"></i> 抱歉! 页面没有找到。</h3>
        <br>

        <p class="text-center">
            该页面不存在或者正在开发......
        </p>
        <br>

        <div class="input-group">
            <div class="input-group-btn text-center">
                <a href="" class="btn btn-warning btn-flat" type="submit" name="submit">返回首页 <i
                        class="fa fa-undo"></i></a>
            </div>
        </div>
        <!-- /.input-group -->
    </div>
    <!-- /.error-content -->
</div>
