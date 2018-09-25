package com.hikvision.zh.service;

import com.hikvision.zh.dao.UserDao;
import com.hikvision.zh.entity.User;
import com.hikvision.zh.tool.Search;
import com.hikvision.zh.tool.SearchByName;
import com.hikvision.zh.tool.SearchByOpenId;
import com.hikvision.zh.tool.SearchByPhone;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zhenghang on 2018/8/23.
 */
@Service("userService")
public class UserService extends UserServiceFather{
    @Resource
    UserDao userDao;

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public void addUser(String phone, String name, int userState, int point, int deposit) {
        userDao.addUser(phone, name, userState, point, deposit);
    }
    @Override
    public List<User> search(User user) {
        return userDao.searchUsersByName(user);
    }

    public List<User> searchUsers(User user) {
        Search serchByName = new SearchByName();
        Search searchByOpenid = new SearchByOpenId();
        Search searchByPhone = new SearchByPhone();
        if (user.getName() != null) {
            return change(serchByName, user);
        } else if (user.getName() != null) {
            return change(searchByOpenid, user);
        } else {
            return change(searchByPhone, user);
        }
    }

    public List<User> change(Search search, User user) {
        return search.search(user);
    }

    public void deleteUserByOpenid(int openid) {
        userDao.deleteUserByOpenid(openid);
    }

    public void updateUser(int openid, String name, String phone, int point, int deposit, int userState) {
        userDao.updateUser(openid, name, phone, point, deposit, userState);
    }
}
