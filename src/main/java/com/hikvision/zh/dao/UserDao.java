package com.hikvision.zh.dao;

import com.hikvision.zh.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by zhenghang on 2018/8/23.
 */
@Repository("userDao")
public interface UserDao {
    public List<User> getAllUsers();

    public void addUser(String phone, String name, int userState, int point, int deposit);

    public List<User> searchUsersByName(User user);

    public List<User> searchUsersByPhone(User user);

    public List<User> searchUsersByOpneId(User user);

    public void deleteUserByOpenid(int openid);

    public void updateUser(int openid, String name, String phone, int point, int deposit, int userState);
}
