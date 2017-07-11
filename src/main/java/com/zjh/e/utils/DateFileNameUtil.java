package com.zjh.e.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/11.
 * 以时间为文件夹名称的工具类
 */
public class DateFileNameUtil {


    /**
     * 找到**分钟前/后的时间
     * 用于quartz定时删除文件时找到文件名(存文件的文件夹皆以时间命名，例：yyyy/MM/dd/HH/mm/ss)
     * @param minute 几分钟前
     * @return      文件夹名称
     */
    public static String getFileName(int minute){
        Calendar calendar = Calendar.getInstance();

        calendar.add(Calendar.MINUTE, minute);

        return new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss").format(calendar.getTime())+".png";
    }

    public static  String creatFileName(){
        return new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss").format(new Date())+".png";
    }

}
