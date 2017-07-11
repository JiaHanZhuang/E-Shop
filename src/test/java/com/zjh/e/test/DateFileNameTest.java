package com.zjh.e.test;

import com.zjh.e.utils.DateFileNameUtil;
import org.junit.Test;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/11.
 */
public class DateFileNameTest {
    @Test
    public void testFileName() {
        System.out.println(DateFileNameUtil.getFileName(-5));
        System.out.println(DateFileNameUtil.creatFileName());
    }

}
