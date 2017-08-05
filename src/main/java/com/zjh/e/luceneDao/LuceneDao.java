package com.zjh.e.luceneDao;

import com.zjh.e.pojo.Commodity;
import com.zjh.e.utils.HighlighterUtil;
import com.zjh.e.utils.IndexWriterUtil;
import com.zjh.e.utils.LuceneConfig;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public class LuceneDao {

    public void saveCommodity(Commodity commodity) {
        Document document = new Document();
        //将商品的描述存进lucene
        document.add(new Field("CommodityDetail",commodity.getDetail(), Field.Store.YES, Field.Index.ANALYZED));
        document.add(new Field("CommodityId",commodity.getId().toString(),Field.Store.YES, Field.Index.ANALYZED));
        IndexWriter indexWriter = IndexWriterUtil.getIndexWriter();
        try {
            indexWriter.addDocument(document);
            //将产生的.cfs文档和原来的压缩成一个
            indexWriter.optimize();
            //提交索引库
            indexWriter.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public List<Commodity> selectCommodity(String keyWord,int page,int rows) {
        List<Commodity> list = new ArrayList<Commodity>();
        IndexSearcher indexSearcher = null;
        //查询开始的记录号
        int start = (page-1)*rows;
        //查询结束的记录号
        int end = page*rows;

        QueryParser parser = new QueryParser(LuceneConfig.VERSION,"CommodityDetail",LuceneConfig.ANALYZER);
        try {
            Query query = parser.parse(keyWord);
            indexSearcher = new IndexSearcher(LuceneConfig.getDirectory());
            TopDocs topDocs = indexSearcher.search(query,end);
            ScoreDoc[] scoreDocs = topDocs.scoreDocs;
            //判断
            if(topDocs.totalHits < end) {
                //总记录数小于结束的记录号
                end = topDocs.totalHits;
            }
            if(topDocs.totalHits < start) {
                //总记录小于开始的记录号
                return null;
            }

            for (int i = start;i < end;i++) {
                Document document = indexSearcher.doc(scoreDocs[i].doc);
                document.getField("CommodityDetail")
                        .setValue(HighlighterUtil.doHighLight(query,"CommodityDetail",document.get("CommodityDetail"),20));
                Commodity commodity = new Commodity();
                commodity.setId(Long.parseLong(document.get("CommodityId")));
                commodity.setDetail(document.get("CommodityDetail"));
                list.add(commodity);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(indexSearcher!=null) {
                try {
                    indexSearcher.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
}
