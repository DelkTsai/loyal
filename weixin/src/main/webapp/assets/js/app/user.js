/**
 * Created by Loyal on 2015/5/25.
 */
var vm_user = new Vue({
    el: "#vm-user",
    data: {
        condition: {
            form: {
                username: "",
                roleid: "admin"
            },
            option: []
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
            $("#username")[0].focus();
            this.panel.isAdd = true;
            this.panel.form = this.panel.deform;
        },
        edit: function (user) {
            $("#username")[0].focus();
            this.panel.isAdd = false;
            this.panel.form = user;
        },
        save: function () {
            var that = this;
            var url = this.panel.isAdd ? "auth/user/add" : "auth/user/edit";
            $.post(url, JSON.stringify(this.panel.form), function (data) {
                layer.alert(data.msg);
                that.list(that.page.pager, null);
            }, "json");
        },
        deleter: function (user) {
            var that = this;
            layer.confirm("删除用户&nbsp;&nbsp;<b class='text-red'>" + user.username + "</b>", {icon: 3,title: '<b>提示</b>'}, function (index) {
                $.post("auth/user/delete", JSON.stringify(user), function (data) {
                    that.list(that.page.pager, null);
                    layer.close(index);
                }, "json");
            });

        },
        list: function (pager, user) {
            $.post("auth/user/list", JSON.stringify({pager: pager, user: user}), function (data) {
                vm_user.$set("page", data);
            }, "json");
        },
        search: function () {
            this.list(this.page.pager, this.condition.form);
        },
        lock: function (user) {
            var that = this;
            user.locked = !user.locked;
            $.post("auth/user/edit", JSON.stringify(user), function (data) {
                that.list(that.page.pager, null);
            }, "json");
        },
        edit_role: function (user) {
            $("#myModal").modal("show");
            $("#myModalLabel").html("角色分配 - <b class='text-red'>" + user.username + "</b>");
            this.tree.uncheck_all();
            vm_user.$set("tree_user", user);
            var roles = [];
            $(user.roles).each(function (index, item) {
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
                layer.alert(data.msg);
                that.list(that.page.pager, null);
            }, "json");
        }
    },
    ready: function () {
        this.condition.option = [{text: "admin", value: "admin"}, {text: "user", value: "user"}];
        this.list({pageSize: 20, pageNumber: 1}, null);
        setTimeout(function () {
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
            vm_user.$set("tree", $.jstree.reference("#jstree1"));
        }, 1000);
    }
});
