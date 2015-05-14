package com.loyal.weixin.bean.weixinex;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamConverter;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.util.xml.XStreamCDataConverter;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.outxmlbuilder.VideoBuilder;

/**
 * Created by Loyal on 2015/5/13.
 */
@XStreamAlias("xml")
public class WxMpXmlOutShortVideoMessage extends WxMpXmlOutMessage {
    @XStreamAlias("ShortVideo")
    protected final ShortVideo shortVideo = new ShortVideo();

    public WxMpXmlOutShortVideoMessage() {
        this.msgType = "shortvideo";
    }

    public String getMediaId() {
        return shortVideo.getMediaId();
    }

    public void setMediaId(String mediaId) {
        shortVideo.setMediaId(mediaId);
    }

    public String getThumbMediaId() {
        return shortVideo.getThumbMediaId();
    }

    public void setThumbMediaId(String thumbMediaId) {
        shortVideo.setThumbMediaId(thumbMediaId);
    }



    @XStreamAlias("ShortVideo")
    public static class ShortVideo {

        @XStreamAlias("MediaId")
        @XStreamConverter(value=XStreamCDataConverter.class)
        private String mediaId;

        @XStreamAlias("ThumbMediaId")
        @XStreamConverter(value=XStreamCDataConverter.class)
        private String thumbMediaId;


        public String getMediaId() {
            return mediaId;
        }

        public void setMediaId(String mediaId) {
            this.mediaId = mediaId;
        }

        public String getThumbMediaId() {
            return thumbMediaId;
        }

        public void setThumbMediaId(String thumbMediaId) {
            this.thumbMediaId = thumbMediaId;
        }

    }

    /**
     * 获得短视频消息builder
     * @return
     */
    public static ShortVideoBuilder SHROTVIDEO() {
        return new ShortVideoBuilder();
    }
}
