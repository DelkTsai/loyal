package com.loyal.weixin.module.sys;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * Created by Loyal on 2015/5/15.
 */

@At("/sys/user")
public class UserModule {
    @At("/")
    @Ok("jsp:sys.user")
    public Object index(){

        return null;
    }
}
