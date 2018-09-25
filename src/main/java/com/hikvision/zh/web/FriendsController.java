package com.hikvision.zh.web;

import com.hikvision.zh.entity.Friend;
import com.hikvision.zh.service.FriendsService;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by zhenghang on 2018/8/25.
 */
@Controller
public class FriendsController {
    @Resource
    FriendsService friendsService;

    @RequestMapping(value = "user/getAllFriends", method = RequestMethod.GET)
    @ResponseBody
    public List<Friend> getAllFriends(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        final String openid = httpServletRequest.getParameter("openid");
//        openid = "1";
        return friendsService.getAllFriends(openid);
    }

    @RequestMapping(value = "user/deleteFriends", method = RequestMethod.GET)
    @ResponseBody
    public List<Friend> deleteFriends(@RequestParam String openid, @RequestParam String name) {
        System.out.println(openid + name);
        friendsService.deleteFriends(openid, name);
        return friendsService.getAllFriends(openid);
    }

    @RequestMapping(value = "user/getStranger", method = RequestMethod.GET)
    @ResponseBody
    public List<String> getStranger(@RequestParam String openid) {
        int openid1 = Integer.parseInt(openid);
        return friendsService.gerStranger(openid, openid1);
    }

    @RequestMapping(value = "user/addFriend", method = RequestMethod.GET)
    @ResponseBody
    public List<String> addFriend(@RequestParam String openid, @RequestParam String name) {
        friendsService.addFriend(openid, name);
        int openid1 = Integer.parseInt(openid);
        return friendsService.gerStranger(openid, openid1);
    }
}
