package com.zjh.e.service;

import com.zjh.e.pojo.Financial;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;

/**
 * Created by Administrator on 2017/7/9.
 */
public interface FinancialService extends BaseService<Financial> {
    void importExcel(MultipartFile excel);

    void exportExcel(ServletOutputStream outputStream);
}
