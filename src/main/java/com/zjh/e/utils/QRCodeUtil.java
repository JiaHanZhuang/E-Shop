package com.zjh.e.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.client.j2se.MatrixToImageWriter;

import java.io.File;
import java.nio.file.Path;
import java.util.HashMap;

/**
 * Created by Administrator on 2017/7/11.
 * 生成二维码工具类
 */
public class QRCodeUtil {
//    D:\IdeaProject\E-shop\src\main\webapp\WEB-INF\img\QRcode\
    public static final String PATH = File.separatorChar+"home"+File.separatorChar+"QR"+File.separatorChar;

    public static String creatQRCode(){
        int width = 300;//二维码图片的宽度
        int height = 300;//二维码图片的高度
        String format = "png";//二维码格式
        String content = "http://www.baidu.com";//二维码内容

        //定义二维码内容参数
        HashMap hints = new HashMap();
        //设置字符集编码格式
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        //设置容错等级，在这里我们使用M级别
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
        //设置边框距
        hints.put(EncodeHintType.MARGIN, 2);

        //生成二维码
        try {
            //指定二维码内容
            BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height,hints);
            //保存的文件夹
            String img_path = DateFileNameUtil.creatFileName();                 //图片路径
            File file = new File(PATH+img_path);
            if (!file.exists()){
                file.mkdirs();
            }
            //指定生成图片的保存路径
            Path filepath = new File(PATH+img_path).toPath();
            //生成二维码
            MatrixToImageWriter.writeToPath(bitMatrix, format, filepath);
            return img_path;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
