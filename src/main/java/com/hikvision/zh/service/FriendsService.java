package com.hikvision.zh.service;

import com.hikvision.zh.dao.FriendsDao;
import com.hikvision.zh.entity.Friend;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zhenghang on 2018/8/25.
 */
@Service(value = "friendsService")
public class FriendsService {
    @Resource
    FriendsDao friendsDao;

    public List<Friend> getAllFriends(String openid) {
        return friendsDao.getAllFriends(openid);
    }

    public void deleteFriends(String openid, String name) {
        friendsDao.deleteFriends(openid, name);
    }

    public List<String> gerStranger(String openid, int openid1) {
        return friendsDao.getStranger(openid, openid1);
    }

    public void addFriend(String openid, String name) {
        friendsDao.addFriend(openid, name);
    }
}
