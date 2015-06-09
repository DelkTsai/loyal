package com.loyal.weixin.module.auth;

import com.loyal.weixin.bean.Permission;
import com.loyal.weixin.service.PermissionService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.adaptor.JsonAdaptor;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * Created by Loyal on 2015/5/15.
 */

@At("/auth/permission")
@IocBean
@AdaptBy(type = JsonAdaptor.class)
public class PermissionModule {
    @Inject("permissionService")
    private PermissionService service;

    @At("/")
    @Ok("jsp:auth.permission")
    @RequiresAuthentication
    public Object index() {
        return null;
    }

    @At("/list")
    @Ok("json")
    @RequiresAuthentication
    public Object list(@Param("pager") Pager pager, @Param("permission") Permission obj) {
        return service.find(pager);
    }

    @At("/add")
    @Ok("json")
    @RequiresAuthentication
    public Object add(Permission obj) {
        return service.add(obj);
    }

    @At("/delete")
    @Ok("json")
    @RequiresAuthentication
    public Object delete(Permission obj) {

        return service.delete(obj);
    }

    @At("/edit")
    @Ok("json")
    @RequiresAuthentication
    public Object edit(Permission obj) {
        return service.edit(obj);
    }


}
