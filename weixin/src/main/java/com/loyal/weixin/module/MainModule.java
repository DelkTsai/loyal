package com.loyal.weixin.module;

import com.loyal.weixin.MainSetup;
import com.loyal.weixin.mvc.SessionCheck;
import org.nutz.mvc.annotation.*;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

/**
 * Created by Loyal on 2015/5/12.
 */

@Modules(scanPackage = true)
@Ok("json")
@Fail("http:500")
@IocBy(type=ComboIocProvider.class,args={"*js", "ioc/",
        "*anno", "com.loyal.weixin",
        "*tx"})
@ChainBy(args= "mvc/mvc-chain.js")
@SetupBy(value=MainSetup.class)
@Filters(@By(type = SessionCheck.class, args = { "curruser", "/login" }))
public class MainModule {

}
