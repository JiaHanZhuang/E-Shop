package com.zjh.e.utils;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Value;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2017/8/4.
 * lucene配置类
 */
public class LuceneConfig {

    private LuceneConfig(){}

    public static String PATH ="/home/lucene";

    public static final Version VERSION = Version.LUCENE_30;

    public static final Analyzer ANALYZER = new IKAnalyzer(true);

    private static Directory directory;

    static {
        try {
            directory = FSDirectory.open(new File(PATH));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Directory getDirectory() {
        return directory;
    }

}
