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
    <h2 class="headline text-red">500</h2>

    <div class="text-center">
        <h3 text-center><i class="fa fa-warning text-red"></i> 抱歉! 服务器内部出错。</h3>
        <br>

        <p class="text-center">
            我们会尽快解决该问题......
        </p>
        <br>

        <div class="input-group">
            <div class="input-group-btn text-center">
                <a class="btn btn-danger btn-flat" href="">返回首页 <i class="fa fa-undo"></i></a>
            </div>
        </div>
        <!-- /.input-group -->
    </div>
</div>
