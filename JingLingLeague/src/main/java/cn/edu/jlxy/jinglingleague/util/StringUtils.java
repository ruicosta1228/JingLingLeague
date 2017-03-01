package cn.edu.jlxy.jinglingleague.util;

/**
 * Created by neo on 2017/3/1.
 */
public class StringUtils {
    //判断字符串为空
    public static boolean isEmpty(String str) {
        if (str == null || str.length() == 0)
            return true;
        return false;
    }
}
