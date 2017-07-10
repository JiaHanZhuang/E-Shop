package com.zjh.e.pojo;

import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/7.
 * 评论/回复类
 */
public class Comment {

    @Id
    private Long id;        //索引
    private Long userId;    //用户id
    private Long CommentId;     //自关联
    private Long shopId;        //商家id
    private String text;        //回复内容

    public Comment() {
    }

    public Comment(Long id, Long userId, Long commentId, Long shopId, String text) {
        this.id = id;
        this.userId = userId;
        CommentId = commentId;
        this.shopId = shopId;
        this.text = text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCommentId() {
        return CommentId;
    }

    public void setCommentId(Long commentId) {
        CommentId = commentId;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
