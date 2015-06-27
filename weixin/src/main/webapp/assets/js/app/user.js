/**
 * Created by Loyal on 2015/5/25.
 */
var vm_user = new Vue({
    el: "#vm-user",
    data: {
        condition: {
            form: {
                username: "",
                roleId: "0"
            },
            option:[]
        },
        panel: {
            isAdd: true,
            form: {
                username: null,
                roleId: null,
                comment: null
            },
            deform: {
                username: null,
                roleId: null,
                comment: "测试数据"
            }
        },
        page: {
            ok: null,
            pager: null,
            list: [],
            roles: []
        },
        tree: null,
        tree_user: null
    },
    methods: {
        add: function () {
            $("#box-edit").slideDown();
            $("#username")[0].focus();
            this.panel.isAdd = true;
            this.panel.form = this.panel.deform;
        },
        edit: function (obj) {
            $("#box-edit").slideDown();
            $("#username")[0].focus();
            this.panel.isAdd = false;
            this.panel.form = obj;
        },
        save: function () {
            var that = this;
            var url = this.panel.isAdd ? "auth/user/add" : "auth/user/edit";
            $.post(url, JSON.stringify(this.panel.form), function (data) {
                layer.msg(data.msg);
                if(that.panel.isAdd)
                that.page.pager.pageNumber = 1;
                that.list(that.page.pager, null);
            }, "json");
        },
        deleter: function (obj) {
            var that = this;
            layer.confirm("删除用户&nbsp;&nbsp;<b class='text-red'>" + obj.username + "</b>", {
                icon: 3,
                title: '<b>提示</b>'
            }, function (index) {
                layer.close(index);
                $.post("auth/user/delete", JSON.stringify(obj), function (data) {
                    layer.msg(data.msg);
                    that.list(that.page.pager, null);
                }, "json");
            });

        },
        list: function (pager, obj) {
            $.post("auth/user/list", JSON.stringify({pager: pager, user: obj}), function (data) {
                vm_user.$set("page", data);
            }, "json");
        },
        search: function () {
            this.list(this.page.pager, this.condition.form);
        },
        lock: function (obj) {
            var that = this;
            obj.locked = !obj.locked;
            $.post("auth/user/edit", JSON.stringify(obj), function (data) {
                that.list(that.page.pager, null);
            }, "json");
        },
        edit_role: function (obj) {
            $("#myModal").modal("show");
            $("#myModalLabel").html("角色分配 - <b class='text-red'>" + obj.username + "</b>");
            this.tree.uncheck_all();
            vm_user.$set("tree_user", obj);
            var roles = [];
            $(obj.roles).each(function (index, item) {
                roles.push(item.name + "_" + item.id);
            });
            this.tree.check_node(roles);
        },
        save_role: function () {
            var checked = this.tree.get_checked();
            var roles = [];
            $(this.page.roles).each(function (index, item) {
                if (checked.indexOf(item.name + "_" + item.id) > -1) roles.push(item);
            });
//                alert(JSON.stringify(roles));
            var that = this;
            $.post("auth/user/edit_role", JSON.stringify({roles: roles, user: that.tree_user}), function (data) {
                $("#myModal").modal("hide");
                layer.msg(data.msg);
                that.list(that.page.pager, null);
            }, "json");
        },
        firstPage: function () {
            this.page.pager.pageNumber = 1;
            this.list(this.page.pager, null);
        },
        lastPage: function () {
            this.page.pager.pageNumber = this.page.pager.pageCount;
            this.list(this.page.pager, null);
        },
        prevPage: function () {
            this.page.pager.pageNumber = this.page.pager.pageNumber - 1;
            if (this.page.pager.pageNumber < 1) this.page.pager.pageNumber = 1;
            this.list(this.page.pager, null);
        },
        nextPage: function () {
            this.page.pager.pageNumber = this.page.pager.pageNumber + 1;
            if (this.page.pager.pageNumber > this.page.pager.pageCount) this.page.pager.pageNumber = this.page.pager.pageCount;
            this.list(this.page.pager, null);
        },
        goPage: function () {
            this.page.pager.pageNumber = $("#pageNumber").val();
            if (this.page.pager.pageNumber < 1) this.page.pager.pageNumber = 1;
            if (this.page.pager.pageNumber > this.page.pager.pageCount) this.page.pager.pageNumber = this.page.pager.pageCount;
            this.list(this.page.pager, null);
        },
        size_change: function () {
            this.page.pager.pageNumber = 1;
            this.page.pager.pageSize = $("#pageSize").val();
            this.list(this.page.pager, null);
        },
        initOption: function () {
            var opts = [{text:"—选择—",value:"0"}];
            $(this.page.roles).each(function (index,item) {
                opts.push({text:item.name,value:item.id});
            });
            this.condition.option =opts ;
        },
        initTree: function () {
            $('#jstree1').jstree({
                'core': {
                    'check_callback': true
                },
                'plugins': ['types', 'dnd', 'checkbox'],
                'types': {
                    'default': {
                        'icon': 'fa fa-folder'
                    },
                    'auth': {
                        'icon': 'fa fa-user-secret'
                    }
                }
            });
            this.tree = $.jstree.reference("#jstree1");
        }
    },
    ready: function () {
        this.list({pageSize: 5, pageNumber: 1}, null);
        var that = this;
        setTimeout(function () {
            that.initOption();
            that.initTree();
        },500);
    }
});
