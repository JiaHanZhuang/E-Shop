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
    private int expend;     //支出
    private int earning;    //收入
    private Date time;      //创建时间

    public Financial() {
    }

    public Financial(Long id, int expend, int earning, Date time) {
        this.id = id;
        this.expend = expend;
        this.earning = earning;
        this.time = time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getExpend() {
        return expend;
    }

    public void setExpend(int expend) {
        this.expend = expend;
    }

    public int getEarning() {
        return earning;
    }

    public void setEarning(int earning) {
        this.earning = earning;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
