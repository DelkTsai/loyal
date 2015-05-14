package com.loyal.weixin.module.weixin.handler;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpMessageHandler;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.*;

import java.util.Map;

/**
 * Created by Loyal on 2015/5/13.
 */
public class DefaultHandler implements WxMpMessageHandler {

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService, WxSessionManager sessionManager) throws WxErrorException {
        WxMpXmlOutMessage m = null;
        if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_TEXT)) {
            m = WxMpXmlOutTextMessage
                    .TEXT()
                    .content("您刚才发送了：" + wxMessage.getContent())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_IMAGE)) {
            m = WxMpXmlOutImageMessage
                    .IMAGE()
                    .mediaId(wxMessage.getMediaId())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_LINK)) {
            m = WxMpXmlOutTextMessage
                    .TEXT()
                    .content(wxMessage.getTitle())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_EVENT)) {
            m = WxMpXmlOutTextMessage
                    .TEXT()
                    .content(wxMessage.getContent())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_VOICE)) {
            m = WxMpXmlOutVoiceMessage
                    .VOICE()
                    .mediaId(wxMessage.getMediaId())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_MUSIC)) {
            m = WxMpXmlOutMusicMessage
                    .MUSIC()
                    .title("动人的歌声")
                    .musicUrl(wxMessage.getUrl())
                    .description("您最爱的歌曲")
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_VIDEO)) {
            m = WxMpXmlOutVideoMessage
                    .VIDEO()
                    .mediaId(wxMessage.getMediaId())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_NEWS)) {
            m = WxMpXmlOutTextMessage
                    .TEXT()
                    .content("真是令人振奋的新闻")
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals(WxConsts.XML_MSG_LOCATION)) {
            m = WxMpXmlOutTextMessage
                    .TEXT()
                    .content("位置：" + wxMessage.getLabel())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else if (wxMessage.getMsgType().equals("shortvideo")) {
            m = WxMpXmlOutVideoMessage
                    .VIDEO()
                    .mediaId(wxMessage.getMediaId())
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        } else {
            m = WxMpXmlOutTextMessage
                    .TEXT()
                    .content("未知消息类型")
                    .fromUser(wxMessage.getToUserName())
                    .toUser(wxMessage.getFromUserName())
                    .build();
        }

        return m;
    }
}
