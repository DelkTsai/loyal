package com.loyal.weixin.module.sys;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * Created by Loyal on 2015/5/15.
 */

@At("/sys/role")
public class RoleModule {
    @At("/")
    @Ok("jsp:sys.role")
    public Object index(){

        return null;
    }
}
