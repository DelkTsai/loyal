package com.loyal.weixin.module.sys;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * Created by Loyal on 2015/5/15.
 */

@At("/sys/user")
public class UserModule {
    @At("/")
    @Ok("jsp:sys.user")
    @RequiresUser
    public Object index() {

        return null;
    }
    @At("/list")
    @Ok("jsp:sys.user")
    public Object list(){

        return null;
    }

    @At("/add")
    @Ok("->:/sys/user/list")
    public Object add(){

        return null;
    }

    @At("/delete")
    @Ok("jsp:sys.user")
    public Object delete(){

        return null;
    }

    @At("/edit")
    @Ok("jsp:sys.user")
    public Object edit(){

        return null;
    }

}
