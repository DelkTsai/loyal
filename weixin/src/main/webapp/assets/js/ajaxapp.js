/**
 * Created by Loyal on 2015/5/16.
 */
//  eg:
//  <aside class="main-sidebar" id="my-sidebar"></aside>
//  <script>
//      ajaxLoad("#my-sidebar");
//  </script>
function ajaxLoad(sidebar) {
    this.selector = sidebar + ".main-sidebar .sidebar ul.sidebar-menu li";

    function linkTo(href) {
        var loading;
        $.ajax({
            url: href + "?" + new Date().getTime(),
            type: "GET",
            beforeSend: function () {
                loading = layer.load(1,{shade: [0.5,'#333']});
                //此处用setTimeout演示ajax的回调
            },
            success: function (data) {
                layer.close(loading);
                $(".content-wrapper .content").html(data);
            }
        });

    }

    function activeSidebar(obj) {
        $(obj).addClass("active");
        $(".breadcrumb li:first").after('<li class="active">' + $(obj).children("a:first").text() + '</li>');
        if (($(obj).parent().attr("class") + "").indexOf("sidebar-menu") > -1) return false;
        activeSidebar($(obj).parents("li").first());
    }

    function update(obj, href) {
        $(selector).removeClass("active");
        $(".breadcrumb").html('<li class="active"><i class="fa fa-home"></i></li>');
        activeSidebar($(obj).parent());
        linkTo(href.substr(1));
        document.title = $(obj).text() + " - 后台管理";
    }

    function init() {
        (function(){
            var href = window.location.href;
            href.indexOf("#")>-1?href = href.substr(href.indexOf("#")):href="#home";
            if(href=="#")href="#home";
            var obj = $(selector + " a[href='" + href + "']");
            update(obj, href);
        })();

        $(selector + " a").click(function () {
            var href = $(this).attr("href");
            if (href.trim() == null || href.trim() == "" || href.trim() == "#") return false;
            update(this, href);
        });
    }

    init();
}