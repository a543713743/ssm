package com.hikvision.zh.service;
import com.hikvision.zh.dao.UserDao;
import com.hikvision.zh.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
/**
 * Created by zhenghang6 on 2018/8/29.
 */
@Service("userService01")
public class UserService01 extends UserServiceFather{
    @Resource
    UserDao userDao;
    @Override
    public List<User> search(User user){
       return userDao.getAllUsers();
    }
}
