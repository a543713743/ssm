package com.hikvision.zh.web;

import com.hikvision.zh.entity.Admin;
import com.hikvision.zh.entity.User;
import com.hikvision.zh.service.AdminService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by zhenghang on 2018/8/22.
 */
@Controller
public class AdminController {


    @RequestMapping(value = "admin/login")
    public String adminLogin(Admin admin, HttpServletRequest request) {
        AdminService adminService = AdminService.getAdminService();
        System.out.println("555");
        Admin admin1 = adminService.login(admin);
        if (admin1 == null) {
            request.setAttribute("admin", admin);
            request.setAttribute("errorMsg", "请认真核对账号、密码！！！");
            return "login";
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("currentAdmin", admin1);
            return "redirect:/member-list.jsp";
        }
    }
}
