package cn.edu.jlxy.jinglingleague.util;
import com.google.gson.Gson;

import java.util.List;

/**
 * Created by neo on 2017/3/1.
 */

/**
 *
 * 说明：json处理
 *
 * 邮件： 1240306775@qq.com
 *
 */
public class JsonUtils {

    private static Gson gson = new Gson();

    public static Gson getGson() {
        return gson;
    }

    /**
     * 返回一个对象的 json 字符串
     *
     * @param obj
     * @return
     */
    public static String objectToJson(Object obj) {
        return getGson().toJson(obj);

    }

    /**
     * 返回一个集合的 json 字符串
     *
     * @param list
     * @return
     */
    @SuppressWarnings("unchecked")
    public static String listToJson(List list) {
        return getGson().toJson(list);

    }

    /**
     * 将 json 字符串封装成对象
     *
     * @param json,clazz
     * @return
     */
    @SuppressWarnings("unchecked")
    public static Object jsonToObject(String json, Class clazz) {
        return getGson().fromJson(json, clazz);

    }

}
