package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/7.
 * 整合UserBasic和UserExpand
 */
public class User {

    private UserBasic userBasic;
    private UserExpand userExpand;

    public User() {
    }

    public User(UserBasic userBasic, UserExpand userExpand) {
        this.userBasic = userBasic;
        this.userExpand = userExpand;
    }

    public UserBasic getUserBasic() {
        return userBasic;
    }

    public void setUserBasic(UserBasic userBasic) {
        this.userBasic = userBasic;
    }

    public UserExpand getUserExpand() {
        return userExpand;
    }

    public void setUserExpand(UserExpand userExpand) {
        this.userExpand = userExpand;
    }
}
