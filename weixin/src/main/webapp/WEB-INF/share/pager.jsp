<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<nav class="" v-if="page.pager!=null">
    <ul class="pagination" style="margin: 0;">
        <li class="{{page.pager.pageNumber==1?'disabled':''}}">
            <a href="javascript:;" v-on="click:firstPage"><i
                class="fa fa-angle-double-left"></i>
            </a>
        </li>
        <li class="{{page.pager.pageNumber==1?'disabled':''}}">
            <a href="javascript:;" v-on="click:prevPage"><i
                class="fa fa-angle-left"></i>
            </a>
        </li>
        <li><span>
		{{page.pager.pageNumber}}/{{page.pager.pageCount}}</span></li>
        <li class="{{page.pager.pageNumber==page.pager.pageCount?'disabled':''}}"><a href="javascript:;"
                                                                                     v-on="click:nextPage"><i
                class="fa fa-angle-right"></i> </a></li>
        <li class="{{page.pager.pageNumber==page.pager.pageCount?'disabled':''}}"><a href="javascript:;"
                                                                                     v-on="click:lastPage"><i
                class="fa fa-angle-double-right"></i> </a></li>
        <li>
            <span style="padding: 0;"> <input class="text-center" id="pageNumber" type="text" value=""
                                              style="height: 32px;width: 50px;border-radius:0;border: none;"
                                              placeholder="页码"/>
		    </span>
        </li>
        <li>
            <a href="javascript:;" v-on="click:goPage">
                Go
            </a>
        </li>
    </ul>

    <ul class="pagination pull-right hidden-xs" style="margin: 0;">
        <li><span style="padding-bottom: 5px;">
		<select class="text-center" id="pageSize" style="width:40px;height:21px;border: none;" v-on="change:size_change()">
            <option value="5" selected="{{page.pager.pageSize==5?'selected':''}}">5</option>
            <option value="10" selected="{{page.pager.pageSize==10?'selected':''}}">10</option>
            <option value="15" selected="{{page.pager.pageSize==15?'selected':''}}">15</option>
            <option value="20" selected="{{page.pager.pageSize==20?'selected':''}}">20</option>
        </select>条/页
		</span></li>
        <li>
            <span>
			 共 <font class="text-danger">{{page.pager.recordCount}}</font> 条
		</span>
        </li>
        <!--
         -->
    </ul>
</nav>