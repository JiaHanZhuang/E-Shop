package com.zjh.e.Converter;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/19.
 * 日期转换
 */
public class CustomDateConverter implements Converter<String,Date> {
    @Override
    public Date convert(String s) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try{
            return simpleDateFormat.parse(s);
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
