package com.zjh.e.utils;

/**
 * Created by Administrator on 2017/8/2.
 */
public class StringUtils {

    public static String windowsPathReplaceLinusPath(String path) {
        path = path.replaceAll("\\\\","/");
        return path;
    }

}
