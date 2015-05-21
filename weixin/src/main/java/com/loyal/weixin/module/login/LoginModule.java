package com.loyal.weixin.module.login;

import org.apache.shiro.authc.AuthenticationToken;
import org.nutz.integration.shiro.CaptchaFormAuthenticationFilter;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by Loyal on 2015/5/12.
 */
@IocBean

public class LoginModule {

    @At("/login")
    @GET
    @Ok("jsp:/login")
    @Fail(">>:404")
    @Filters
    public Object loginPage(){

        return null;
    }

    @At("/login")
    @POST
    @Ok(">>:/")
    @Fail(">>:500")
    @Filters(@By(type = CaptchaFormAuthenticationFilter.class))
    public Object login(@Attr("loginToken")AuthenticationToken token,HttpSession session){
//        if ("admin".equals(username)&&"123".equals(password)) session.setAttribute("curruser",username);
        session.setAttribute("msg","用户名或密码错误");
        return null;
    }

    @At("/logout")
    @GET
    @Ok(">>:/")
    @Fail(">>:500")
    public Object logout(HttpSession session){
        session.removeAttribute("curruser");
        return null;
    }

}
