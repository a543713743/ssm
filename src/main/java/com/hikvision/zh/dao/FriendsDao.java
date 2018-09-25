package com.hikvision.zh.dao;

import com.hikvision.zh.entity.Friend;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zhenghang on 2018/8/25.
 */
@Repository(value = "friendsDao")
public interface FriendsDao {
    public List<Friend> getAllFriends(String openid);

    public void deleteFriends(@Param("openid") String openid1, @Param("name") String name);

    public List<String> getStranger(String openid, int openid1);

    public void addFriend(String openid, String name);
}
