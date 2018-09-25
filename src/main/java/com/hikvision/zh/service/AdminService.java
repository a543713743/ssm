package com.hikvision.zh.service;

import com.hikvision.zh.dao.AdminDao;
import com.hikvision.zh.entity.Admin;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * Created by zhenghang on 2018/8/22.
 */

public class AdminService {
    public AdminDao adminDao;
    private static AdminService adminService = null;
    static{
        adminService = new AdminService();
    }
    private AdminService(){}
    public static AdminService getAdminService(){
        return adminService;
    }

    public Admin login(Admin admin) {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        adminDao= (AdminDao) ac.getBean("adminDao");
        return adminDao.login(admin);
    }
}
