package com.loyal.weixin.module.login;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ThreadContext;
import org.nutz.integration.shiro.CaptchaFormAuthenticationFilter;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.util.NutMap;
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
    public Object loginPage() {

        return null;
    }

    @At("/login")
    @POST
    @Ok(">>:/")
    @Fail(">>:500")
    @Filters(@By(type = CaptchaFormAuthenticationFilter.class))
    public Object login(@Attr("loginToken") AuthenticationToken token, HttpSession session) {
//        if ("admin".equals(username)&&"123".equals(password)) session.setAttribute("curruser",username);
        Object msg = null;
        try {
            Subject subject = SecurityUtils.getSubject();
            ThreadContext.bind(subject);
            subject.login(token);
            session.setAttribute("curruser", token);
            return new NutMap().setv("ok", true).setv("msg", "登录成功");
        } catch (UnknownAccountException e) {
            msg = "帐户不存在";
        } catch (IncorrectCredentialsException e) {
            msg = "密码错误";
        } catch (LockedAccountException e) {
            msg = "帐户已禁用";
        } catch (AuthenticationException e) {
            msg = "认证错误";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        session.setAttribute("loginMsg", msg);
        return msg;
    }

    @At("/logout")
    @GET
    @Ok(">>:/")
    @Fail(">>:500")
    @RequiresAuthentication
    public Object logout(HttpSession session) {
        SecurityUtils.getSubject().logout();
        return null;
    }

}
