package com.loyal.weixin.bean.weixinex;

import me.chanjar.weixin.mp.bean.WxMpXmlOutVideoMessage;
import me.chanjar.weixin.mp.bean.outxmlbuilder.BaseBuilder;

/**
 * Created by Loyal on 2015/5/13.
 */
public final class ShortVideoBuilder extends BaseBuilder<ShortVideoBuilder,WxMpXmlOutShortVideoMessage> {

    private String mediaId;
    private String thumbMediaId;
    private String description;

    public ShortVideoBuilder thumbMediaId(String thumbMediaId) {
        this.thumbMediaId = thumbMediaId;
        return this;
    }

    public ShortVideoBuilder mediaId(String mediaId) {
        this.mediaId = mediaId;
        return this;
    }

    @Override
    public WxMpXmlOutShortVideoMessage build() {
        WxMpXmlOutShortVideoMessage m = new WxMpXmlOutShortVideoMessage();
        setCommon(m);
        m.setMediaId(mediaId);
        m.setThumbMediaId(thumbMediaId);
        return m;
    }
}
