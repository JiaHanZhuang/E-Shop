package com.zjh.e.service.impl;

import com.zjh.e.mapper.FinancialMapper;
import com.zjh.e.pojo.Financial;
import com.zjh.e.service.FinancialService;
import com.zjh.e.utils.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.util.List;

/**
 * Created by Administrator on 2017/7/9.
 */
@Service
public class FinancialServiceImpl extends BaseServiceImpl<Financial> implements FinancialService {

    @Autowired
    private FinancialMapper financialMapper;

    public void importExcel(MultipartFile excel){
        ExcelUtil.importExcel(excel,financialMapper);
    }

    public void exportExcel(ServletOutputStream outputStream){
        List<Financial> financialList = this.queryAll();
        ExcelUtil.exportExcel(financialList,outputStream);
    }
}
