package com.zjh.e.utils;

import com.zjh.e.mapper.FinancialMapper;
import com.zjh.e.pojo.Financial;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.io.*;
import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 * 导入导出excel表工具类
 */
public class ExcelUtil {

    /**
     * 导出
     * @param financials        财务类
     * @param servletOutputStream       输入流
     * @throws Exception
     */
    public static void exportExcel(List<Financial> financials, ServletOutputStream servletOutputStream) {
        try{
            //1,创建工作簿
            HSSFWorkbook workbook = new HSSFWorkbook();
           //1.1创建合并单元格对象
           CellRangeAddress cellRangeAddress = new CellRangeAddress(0,0,0,2);
           //1.2创建头标题行样式并创建字体
           HSSFCellStyle hssfCellStyle1 = createCellStyle(workbook,(short) 16);
           //1.3创建标题样式
           HSSFCellStyle hssfCellStyle2 = createCellStyle(workbook,(short)13);
           //2创建工作表
           HSSFSheet sheet = workbook.createSheet();
           //2.1加载合并单元格对象
           sheet.addMergedRegion(cellRangeAddress);
           //2.2设置默认列宽
           sheet.setDefaultColumnWidth(15);
           //3创建行
           //3.1创建头标题行并写入头标题
           HSSFRow row1 = sheet.createRow(0);
           HSSFCell cell1 = row1.createCell(0);
           cell1.setCellStyle(hssfCellStyle1);
           cell1.setCellValue("财务情况");
           //3.2创建列标题行并写入列标题
           HSSFRow row2 = sheet.createRow(1);
           String[] title = {"支出","收入","创建时间"};
           for (int i = 0;i<title.length;i++) {
               HSSFCell cell2 = row2.createCell(i);
               cell2.setCellStyle(hssfCellStyle2);
               cell2.setCellValue(title[i]);
           }
           //4创建单元格，写入用户数据到excel
           if (financials.size()>0 && financials != null) {
               for (int i = 0; i < financials.size();i++) {
                   HSSFRow row = sheet.createRow(i+2);
                   row.createCell(0).setCellValue(financials.get(i).getExpend());
                   row.createCell(1).setCellValue(financials.get(i).getEarning());
                   row.createCell(2).setCellValue(financials.get(i).getTime());
               }
           }
           //5输出
           workbook.write(servletOutputStream);
            //6关闭
            workbook.close();
       } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 导出
     * @param userExcel         excel文件
     * @param financialMapper      调用dao层的insert
     */
    public static void importExcel(MultipartFile userExcel, FinancialMapper financialMapper) {
        try{
            InputStream inputStream = userExcel.getInputStream();
            //1读取工作薄
            Workbook workbook = WorkbookFactory.create(inputStream);
            //2读取工作表
            Sheet sheet = workbook.getSheetAt(0);
            //3读取行
            if (sheet.getPhysicalNumberOfRows() > 2) {
                Financial financial = null;
                Row row = null;
                for (int i = 2;i < sheet.getPhysicalNumberOfRows();i++) {
                    //4读取单元格
                    row = sheet.getRow(i);
                    financial = new Financial();
                    int expend;
                    try{
                        expend = Integer.parseInt(row.getCell(0).getStringCellValue());
                    }catch (Exception e){
                        expend = 0;
                    }
                    financial.setExpend(expend);

                    int earning;
                    try{
                        earning = Integer.parseInt(row.getCell(1).getStringCellValue());
                    }catch (Exception e){
                        earning = 0;
                    }
                    financial.setEarning(earning);

                    financial.setTime(row.getCell(2).getDateCellValue());
                    financialMapper.insert(financial);
                }
            }
            workbook.close();
            inputStream.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    /**
     * 创建样式
     * @param workbook      工作薄
     * @param fontSize      字体大小
     * @return
     */
    public static HSSFCellStyle createCellStyle (HSSFWorkbook workbook,short fontSize) {
        HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
        hssfCellStyle.setAlignment(HorizontalAlignment.CENTER);   //水平居中
        hssfCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);   //垂直居中
        //创建字体
        HSSFFont font = workbook.createFont();
        font.setBold(true);     //加粗
        font.setFontHeightInPoints(fontSize);
        //在样式中加载字体
        hssfCellStyle.setFont(font);
        return hssfCellStyle;
    }

}
