package com.dessert.service.impl;

import com.dessert.dao.UserDao;
import com.dessert.model.User;
import com.dessert.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/2/16.
 */

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService{

    @Resource
    private UserDao userDao;

    @Override
    public boolean login(String email, String pswd) {
        return userDao.login(email,pswd);
    }

    @Override
    public boolean isExist(User user) {
        return userDao.isExist(user);
    }

    @Override
    public String addUser(User user) {
        return userDao.add(user);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public User checkPswd(String email, String password) {
        return userDao.checkPswd(email,password);
    }

    @Override
    public String checkEmail(String email) {
        return userDao.checkEmail(email);
    }

    @Override
    public String update(User user) {
        return userDao.update(user);
    }

    @Override
    public User checkVipPswd(String vid, String pswd) {
        return userDao.checkVipPswd(vid,pswd);
    }

    @Override
    public String resetPswd(String email, String oldPswd, String newPswd) {
        return userDao.resetPswd(email,oldPswd,newPswd);
    }
}
