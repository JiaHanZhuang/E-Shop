package com.zjh.e.task;

import com.zjh.e.utils.DateFileNameUtil;
import com.zjh.e.utils.QRCodeUtil;

import java.io.File;

/**
 * Created by Administrator on 2017/7/11.
 * 定时调度此类
 */
public class QRCodeTask {

    /**
     * 调用此方法，检测是否有二维码图片已存在5分钟，有则清除，无则不清除
     */
    public void execute() {
        String path= DateFileNameUtil.getFileName(-5);
        File file = new File(QRCodeUtil.PATH+path);
        if(file.exists()) {
            File[] files = file.listFiles();
            String imgName = files[0].getName();
            File deleteFile = new File(QRCodeUtil.PATH+path+"\\"+imgName);
            if(deleteFile.exists()){
                deleteFile.delete();
            }
            file.delete();
        }
    }

}
