package com.loyal.weixin.module.weixin;

import org.nutz.NutException;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * Created by Loyal on 2015/5/18.
 */
@At("/wx/user")
public class UserModlue {

    @At("/")
    @Ok("jsp:weixin.user")
    public Object index(){

        return null;
    }
}
