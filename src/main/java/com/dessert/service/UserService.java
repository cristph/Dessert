package com.dessert.service;

import com.dessert.model.User;

/**
 * Created by cristph on 2016/2/16.
 */
public interface UserService {

    public boolean login(String email,String pswd);

    public boolean isExist(User user);

    public String addUser(User user);

    public User findByEmail(String email);

    public User checkPswd(String email,String password);

    public String checkEmail(String email);

    public String update(User user);

    public User checkVipPswd(String vid, String pswd);

    public String resetPswd(String email,String oldPswd,String newPswd);
}
