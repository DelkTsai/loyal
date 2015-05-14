package com.loyal.weixin.module.weixin.handler;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpMessageHandler;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutTextMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutVideoMessage;
import org.nutz.ioc.loader.annotation.IocBean;

import java.util.Map;

/**
 * Created by Loyal on 2015/5/13.
 */
public class TestHandler implements WxMpMessageHandler {

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService, WxSessionManager sessionManager) throws WxErrorException {
        WxMpXmlOutTextMessage m = WxMpXmlOutMessage
                .TEXT()
                .content("拦截了内容："+wxMessage.getContent())
                .fromUser(wxMessage.getToUserName())
                .toUser(wxMessage.getFromUserName())
                .build();
        return m;
    }
}
