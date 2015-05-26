package com.loyal.weixin.module.auth;

import com.loyal.weixin.bean.Role;
import com.loyal.weixin.bean.User;
import com.loyal.weixin.service.UserService;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.mapl.Mapl;
import org.nutz.mvc.adaptor.JsonAdaptor;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Loyal on 2015/5/15.
 */

@At("/auth/user")
@IocBean
@AdaptBy(type = JsonAdaptor.class)
public class UserModule {

    @Inject("userService")
    private UserService service;

    @At("/")
    @Ok("jsp:auth.user")
    @RequiresUser
    public Object index() {
        return null;
    }

    @At("/list")
    @Ok("json:{locked:'password|salt',ignoreNull:true}")
    public Object list(@Param("pager") Pager pager, @Param("user") User obj) {
        return service.find(pager, obj);
    }

    @At("/add")
    @Ok("json")
    public Object add(User obj) {
        return service.add(obj);
    }

    @At("/delete")
    @Ok("json")
    public Object delete(User obj) {

        return service.delete(obj);
    }

    @At("/edit")
    @Ok("json")
    public Object edit(User obj) {
        return service.edit(obj);
    }

    @At("/edit_role")
    @Ok("json")
    public Object edit(@Param("user")User obj,@Param("roles")List<Role>roles) {
        obj.setRoles(roles);
        return service.editRole(obj);
    }

}
