package com.loyal.weixin.module.weixin.handler;

import me.chanjar.weixin.mp.api.WxMpMessageHandler;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * Created by Loyal on 2015/5/13.
 */
@IocBean
public class WxHandler {
    public static WxMpMessageHandler defaultHandler = new DefaultHandler();
    public static WxMpMessageHandler testHandler = new TestHandler();
}
