package cn.edu.jlxy.jinglingleague.filter;

import cn.edu.jlxy.jinglingleague.util.EncodingUtils;
import cn.edu.jlxy.jinglingleague.util.MD5Util;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by neo on 2017/3/9.
 */
public class RequestFilter extends OncePerRequestFilter {
    @Override
    protected void initFilterBean() throws ServletException {
        super.initFilterBean();
        System.out.println("启动字符统一过滤器");
    }
    public String filter(HttpServletRequest request, String input) {

        String ret = input;

        if (input == null || input.trim().equals("(null)")) {
            ret=null;
            return ret;
        }
        final String method = request.getMethod();
        //该处可以实现各种业务的自定义的过滤机制
        if (method.equalsIgnoreCase("get")) {
            try {
                ret = EncodingUtils.utf8_encoding(input);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return ret;
    }


    protected void doFilterInternal(final HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        httpServletResponse.setContentType("text/html;charset=UTF-8");
        filterChain.doFilter(new HttpServletRequestWrapper(httpServletRequest) {
            public String getParameter(String s) {
                String value =super.getParameter(s);
                return filter(this,value);
            }

            public String[] getParameterValues(String s) {
                String[] values = super.getParameterValues(s);
                if (values == null){
                    return null;
                }
                for (int i = 0; i < values.length; i++){
                    values[i] = filter(this, values[i]);
                }
                return values;
            }
        },httpServletResponse);
    }
}
