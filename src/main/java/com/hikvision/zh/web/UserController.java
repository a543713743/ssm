package com.hikvision.zh.web;

import com.hikvision.zh.entity.User;
import com.hikvision.zh.service.UserService;
import com.hikvision.zh.service.UserService01;
import com.hikvision.zh.service.UserServiceFather;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by zhenghang on 2018/8/23.
 */
@Controller
public class UserController {
    @Resource
    UserService userService;
    @Resource
    UserService01 userService01;
    @Resource
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    User user01;

    @RequestMapping(value = "user/getAllUser", method = RequestMethod.GET)
    @ResponseBody
    public List<User> getAllUsers(HttpServletRequest httpServletRequest) {
//        return userService.getAllUsers();
        return getUsers(userService01, user01);
    }

    @RequestMapping(value = "user/addUser", method = RequestMethod.GET)
    @ResponseBody
    public String addUser(@RequestParam String phone, @RequestParam String name, @RequestParam int userState, @RequestParam int point, @RequestParam int deposit, HttpServletResponse httpServletResponse) throws Throwable {
        userService.addUser(phone, name, userState, point, deposit);
        return "<script>window.parent.location.reload()</script>";
    }

    @RequestMapping(value = "user/search", method = RequestMethod.GET)
    @ResponseBody
    public List<User> getUsersByIdOrNameOrPhone(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        User user = new User();
        user.setName(httpServletRequest.getParameter("name"));
        return getUsers(userService, user);
    }

    @RequestMapping(value = "user/deleteUser", method = RequestMethod.GET)
    @ResponseBody
    public void deleteUser(@RequestParam int openid, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        userService.deleteUserByOpenid(openid);
    }

    @RequestMapping(value = "user/bathDelete", method = RequestMethod.GET)
    @ResponseBody
    public void bathDeleteUser(@RequestParam String checked, HttpServletResponse httpServletResponse) {
        final String[] openidArray = checked.split(",");
        for (int i = 0; i < openidArray.length; i++) {
            final int finalI = i;
            threadPoolTaskExecutor.execute(new Runnable() {
                public void run() {
                    userService.deleteUserByOpenid((Integer.parseInt(openidArray[finalI])));
                }
            });
        }
    }

    @RequestMapping(value = "user/update", method = RequestMethod.POST)
    @ResponseBody
    public String updateUser(@RequestParam int openid, @RequestParam String name, @RequestParam String phone, @RequestParam int point, @RequestParam int deposit, @RequestParam int userState, HttpServletResponse httpServletResponse) {
        userService.updateUser(openid, name, phone, point, deposit, userState);
        return "<script>window.parent.location.reload()</script>";
    }

    public List<User> getUsers(UserServiceFather userServiceFather, User user) {
        return userServiceFather.search(user);
    }
}
