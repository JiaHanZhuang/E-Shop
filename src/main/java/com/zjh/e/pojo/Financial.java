package com.zjh.e.pojo;

import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/9.
 * 财务记录类
 */
public class Financial {

    @Id
    private Long id;        //主键
    private Integer expend;     //支出
    private Integer earning;    //收入
    private Date time;      //创建时间

    public Financial() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getExpend() {
        return expend;
    }

    public void setExpend(Integer expend) {
        this.expend = expend;
    }

    public Integer getEarning() {
        return earning;
    }

    public void setEarning(Integer earning) {
        this.earning = earning;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
