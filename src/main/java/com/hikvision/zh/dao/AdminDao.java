package com.hikvision.zh.dao;

import com.hikvision.zh.entity.Admin;
import org.springframework.stereotype.Repository;

/**
 * Created by zhenghang on 2018/8/22.
 */
@Repository("adminDao")
public interface AdminDao {
    public Admin login(Admin admin);
}