package com.loyal.weixin.module.auth;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * Created by Loyal on 2015/5/15.
 */

@At("/auth/role")
public class RoleModule {
    @At("/")
    @Ok("jsp:auth.role")
    public Object index(){

        return null;
    }
}
