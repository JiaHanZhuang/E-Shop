package com.zjh.e.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2017/7/11.
 * 以时间为文件夹名称的工具类
 */
public class DateFileNameUtil {


    /**
     * 找到**分钟前/后的时间
     * 用于quartz定时删除文件时找到文件名(存文件的文件夹皆以时间命名，例：yyyy:MM:dd:HH:mm\)
     * @param minute 几分钟前
     * @return      文件夹名称
     */
    public static String getFileName(int minute){
        Calendar calendar = Calendar.getInstance();

        calendar.add(Calendar.MINUTE, minute);

        return new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(calendar.getTime());
    }

    /**
     * 创建文件存放目录及文件名
      * @return
     */
    public static  String creatFileName(){
        return new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date())+ File.separatorChar+ UUID.randomUUID()+".png";
    }



}
