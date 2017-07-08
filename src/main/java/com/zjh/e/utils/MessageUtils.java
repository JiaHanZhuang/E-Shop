package com.zjh.e.utils;

/**
 * Created by Administrator on 2017/7/6.
 */
public class MessageUtils {

    private String url;
    private String message;

    public MessageUtils(String url, String message) {
        this.url = url;
        this.message = message;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
