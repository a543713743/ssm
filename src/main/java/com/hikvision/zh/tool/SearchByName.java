package com.hikvision.zh.tool;

import com.hikvision.zh.dao.UserDao;
import com.hikvision.zh.entity.User;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zhenghang on 2018/8/24.
 */
public class SearchByName extends Search {
    @Resource
    UserDao userDao;
    @Override
    public List<User> search(User user) {
       return userDao.searchUsersByName(user);
    }
}
