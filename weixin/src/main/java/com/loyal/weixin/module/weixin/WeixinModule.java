package com.loyal.weixin.module.weixin;

import com.loyal.weixin.module.weixin.handler.DefaultHandler;
import com.loyal.weixin.module.weixin.handler.WxHandler;
import me.chanjar.weixin.common.util.StringUtils;
import me.chanjar.weixin.mp.api.*;
import me.chanjar.weixin.mp.bean.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;

import me.chanjar.weixin.mp.bean.WxMpXmlOutTextMessage;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.adaptor.PairAdaptor;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Loyal on 2015/5/13.
 */
@At("weixin")
@IocBean
@AdaptBy(type = PairAdaptor.class)
public class WeixinModule {
    @Inject
    private WxHandler wxHandler;
    private WxMpInMemoryConfigStorage wxConfig;
    private WxMpService wxService;
    private WxMpMessageRouter wxRouter;

    public WeixinModule() {
        //微信配置参数的初始化
        wxConfig = new WxMpInMemoryConfigStorage();
        wxConfig.setAppId("wx7193c2d6b190a8eb");
        wxConfig.setAesKey("");
        wxConfig.setToken("loyal");
        wxConfig.setSecret("8cbf3298f61e426b5130f91b6eb9c7f5");

        //微信服务的初始化，注册配置
        wxService = new WxMpServiceImpl();
        wxService.setWxMpConfigStorage(wxConfig);

        //微信路由的配置，注册服务
        wxRouter = new WxMpMessageRouter(wxService);
        wxRouter.rule().async(false).content("哈哈").handler(wxHandler.testHandler).end()
                .rule().async(false).handler(wxHandler.defaultHandler).end();
    }

    @At({"/", "/?"})
    @Ok("raw:xml")
    @Filters
    public Object index(@Param("signature") String signature,
                        @Param("nonce") String nonce,
                        @Param("timestamp") String timestamp,
                        @Param("echostr") String echostr,
                        @Param("encrypt_type") String encrypt_type,
                        HttpServletRequest request) throws IOException {

        if (!wxService.checkSignature(timestamp, nonce, signature)) {
            // 消息签名不正确，说明不是公众平台发过来的消息
            return "非法请求";
        }
        if (StringUtils.isNotBlank(echostr)) {
            // 说明是一个仅仅用来验证的请求，回显echostr
            return echostr;
        }

        String encryptType = StringUtils.isBlank(encrypt_type) ? "raw" : encrypt_type;

        if ("raw".equals(encryptType)) {
            // 明文传输的消息
            WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(request.getInputStream());
            System.out.println(inMessage);
            WxMpXmlOutMessage outMessage = wxRouter.route(inMessage);
            System.out.println(outMessage.toXml());
            return outMessage != null ? outMessage.toXml(): WxMpXmlOutTextMessage
                    .TEXT()
                    .fromUser(inMessage.getToUserName())
                    .toUser(inMessage.getFromUserName())
                    .content("未找到规则")
                    .build();
        }

        if ("aes".equals(encryptType)) {
            // 是aes加密的消息
            String msgSignature = request.getParameter("msg_signature");
            WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(request.getInputStream(), wxConfig, timestamp, nonce, msgSignature);
            System.out.println(inMessage);
            WxMpXmlOutMessage outMessage = wxRouter.route(inMessage);
            return outMessage.toEncryptedXml(wxConfig);
        }
        return "不可识别的加密类型";
    }
}
