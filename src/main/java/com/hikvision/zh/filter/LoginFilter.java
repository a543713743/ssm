package com.hikvision.zh.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by zhenghang on 2018/8/22.
 */
public class LoginFilter implements Filter {
    private FilterConfig config;

    public void init(FilterConfig config) {
        this.config = config;
    }

    public void destroy() {
        this.config = null;
    }

    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding("utf-8");
//        System.out.println("------LoginFilter");
        HttpServletRequest requ = (HttpServletRequest) req;
        HttpSession session = requ.getSession(true);
        String requstpath = requ.getServletPath();
        if (session.getAttribute("currentAdmin") == null && !requstpath.endsWith("admin/login") && !requstpath.endsWith("login.jsp") && !requstpath.endsWith(".jpg")) {
//            req.setAttribute("tip", "您还没有登录，请先登录");
            req.getRequestDispatcher("/login.jsp").forward(req, res);
        } else {
            chain.doFilter(req, res);
        }
    }
}
