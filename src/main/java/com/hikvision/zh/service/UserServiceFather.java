package com.hikvision.zh.service;
import com.hikvision.zh.entity.User;

import java.util.ArrayList;
import java.util.List;
/**
 * Created by zhenghang6 on 2018/8/29.
 */
public class UserServiceFather {
    public List<User> search(User user){
        List<User> list=new ArrayList<User>();
        list.add(user);
        return list;
    }
}
