package com.zjh.e.pojo;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/10.
 * 活动类
 */
public class Activity {

    @Id
    private Long id;            //索引
    private String text;        //活动内容
    @Column(name="is_deadline")
    private Boolean deadline;     //活动是否过期

    public Activity() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getDeadline() {
        return deadline;
    }

    public void setDeadline(Boolean deadline) {
        this.deadline = deadline;
    }
}
