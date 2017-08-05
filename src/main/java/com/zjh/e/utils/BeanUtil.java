package com.zjh.e.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.lucene.document.Document;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Created by Administrator on 2017/8/4.
 */
public class BeanUtil {

    public static Document beanToDocument(Object object) {
        Document document = new Document();
        Class clazz = object.getClass();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            String fieldName = field.getName();
            String methodName = "get"+fieldName.substring(0,1).toUpperCase()
                    + fieldName.substring(1);
            Method method = getMyMethod(clazz,methodName);
            if(method==null) {
                continue;
            }
            Object invoke = null;
            try{
                invoke = method.invoke(object,null);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(invoke==null) {
                continue;
            }
            document.add(new org.apache.lucene.document.Field(fieldName,invoke.toString(), org.apache.lucene.document.Field.Store.YES, org.apache.lucene.document.Field.Index.ANALYZED));
        }
        return document;
    }

    private static Method getMyMethod(Class clazz, String methodName) {
        Method method = null;
        try {
            method = clazz.getMethod(methodName,null);
        } catch (Exception e) {}
        return method;
    }


    public static Object documentToBean(Class clazz,Document document) {
        Object object = null;
        try {
            object = clazz.newInstance();
            Field[] fields = clazz.getDeclaredFields();
            for(Field field:fields) {
                field.setAccessible(true);
                String fieldName = field.getName();
                String fieldValue = document.get(fieldName);
                BeanUtils.setProperty(object,fieldName,fieldValue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return object;
    }

}
