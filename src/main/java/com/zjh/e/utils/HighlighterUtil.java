package com.zjh.e.utils;

import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.*;

import java.io.IOException;

/**
 * Created by Administrator on 2017/8/4.
 */
public class HighlighterUtil {

    public static String doHighLight(Query query,String fieldName,String fieldValue,int size) {
        Formatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
        Scorer scorer = new QueryScorer(query);

        Highlighter highlighter = new Highlighter(formatter,scorer);
        highlighter.setTextFragmenter(new SimpleFragmenter(size));
        String result = null;
        try {
            result = highlighter.getBestFragment(LuceneConfig.ANALYZER,fieldName,fieldValue);
        } catch (InvalidTokenOffsetsException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        if(result != null) {
            return result;
        } else  {
            if(fieldValue!=null&&fieldValue.length()>=size) {
                return fieldValue.substring(0,size);
            } else {
                return fieldValue;
            }
        }
    }

}
