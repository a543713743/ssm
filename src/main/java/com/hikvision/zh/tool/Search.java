package com.hikvision.zh.tool;

import com.hikvision.zh.entity.User;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhenghang on 2018/8/24.
 */
public class Search {
    public List<User> search(User user) {
        List list = new ArrayList();
        list.add(user);
        return list;
    }
}
