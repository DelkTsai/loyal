package com.loyal.weixin.module.auth;

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
@AdaptBy(type=JsonAdaptor.class)
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
    public Object list(@Param("pager")Pager pager,@Param("user")User user){
        return  service.find(pager, null);
    }

    @At("/add")
    @Ok("json")
    public Object add(User user){
        return service.add(user);
    }

    @At("/delete")
    @Ok("jsp:auth.user")
    public Object delete(){

        return null;
    }

    @At("/edit")
    @Ok("jsp:auth.user")
    public Object edit(User user){
        return service.edit(user);
    }

}
