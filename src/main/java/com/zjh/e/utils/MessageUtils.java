package com.zjh.e.utils;

/**
 * Created by Administrator on 2017/7/6.
 * 用于JSON数据交互工具类
 */
public class MessageUtils {

    private String url;
    private String message;

    public MessageUtils() {
    }

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
