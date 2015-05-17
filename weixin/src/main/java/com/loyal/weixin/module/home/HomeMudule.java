package com.loyal.weixin.module.home;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;

import javax.servlet.http.HttpSession;

/**
 * Created by Loyal on 2015/5/15.
 */

public class HomeMudule {

    @At({"/"})
    @GET
    @Ok("jsp:index")
    @Fail(">>:404")
    public Object indexPage(HttpSession session) {

        return null;
    }

    @At({"/home"})
    @GET
    @Ok("jsp:home")
    @Fail(">>:404")
    public Object homePage(HttpSession session) {

        return null;
    }
}
