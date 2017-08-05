package com.zjh.e.test;

import com.zjh.e.luceneDao.LuceneDao;
import com.zjh.e.pojo.Commodity;
import org.junit.Test;

import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public class LuceneDaoTest {

    @Test
    public void testSave() {
        Commodity commodity = new Commodity();
        commodity.setDetail("测试");
        commodity.setId(1L);
        LuceneDao luceneDao = new LuceneDao();
        luceneDao.saveCommodity(commodity);
    }

    @Test
    public void testSelect() {
        LuceneDao luceneDao = new LuceneDao();
        List<Commodity> list = luceneDao.selectCommodity("男士",1,5);
        for (Commodity commodity : list) {
            System.out.println(commodity);
        }
    }

}
