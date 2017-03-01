package cn.edu.jlxy.jinglingleague.util;

import java.io.UnsupportedEncodingException;

/**
 * Created by neo on 2017/3/1.
 */
public class EncodingUtils {
    public static String utf8_encoding(String para) throws UnsupportedEncodingException {
        String result = new String(para.getBytes("ISO8859-1"),"UTF-8");
        return result;
    }
}
