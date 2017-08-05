package com.zjh.e.utils;

import org.apache.lucene.index.IndexWriter;

import java.io.IOException;

/**
 * Created by Administrator on 2017/8/4.
 */
public class IndexWriterUtil {

    private static IndexWriter indexWriter;

    private IndexWriterUtil() {
    }

    static {
        try {
            indexWriter = new IndexWriter(LuceneConfig.getDirectory(), LuceneConfig.ANALYZER, IndexWriter.MaxFieldLength.LIMITED);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Runtime.getRuntime().addShutdownHook(new Thread(){
            public void run() {
                if(indexWriter!=null) {
                    try {
                        indexWriter.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }

    public static IndexWriter getIndexWriter() {
        return indexWriter;
    }

}
