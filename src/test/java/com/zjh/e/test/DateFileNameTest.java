package com.zjh.e.test;

import com.zjh.e.utils.DateFileNameUtil;
import com.zjh.e.utils.QRCodeUtil;
import org.junit.Test;

import java.io.File;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/11.
 */
public class DateFileNameTest {
    @Test
    public void testFileName() {
//        System.out.println(DateFileNameUtil.getFileName(-5));
//        System.out.println(DateFileNameUtil.creatFileName());
        File file = new File(QRCodeUtil.PATH);
        File[] files = file.listFiles();
        for(File file1: files){
            System.out.print(file1.getName());
        }
    }

}
