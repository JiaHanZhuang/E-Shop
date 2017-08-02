package com.zjh.e.test;

import com.zjh.e.utils.StringUtils;
import org.junit.Test;

/**
 * Created by Administrator on 2017/8/2.
 */
public class StringUtilsTest {
    @Test
    public void test (){
        String path = "D:\\IdeaProject\\E-shop\\target\\E-shop\\images\\";
        path = StringUtils.windowsPathReplaceLinusPath(path);
        System.out.println(path);
    }

}
