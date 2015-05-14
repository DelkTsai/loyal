package com.loyal.weixin.module.login;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;

/**
 * Created by Loyal on 2015/5/12.
 */
@IocBean
public class LoginModule {

    @At("/login")
    @GET
    @Ok(">>:/home")
    @Fail(">>:404")
    public Object login(){

        return null;
    }
}
