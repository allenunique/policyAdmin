package com.allen.service.impl;

import com.allen.dao.UserDao;
import com.allen.entity.User;
import com.allen.service.UserService;
import com.allen.util.PageBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ad on 2017-02-10.
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    private UserDao userDao;
    @Resource(name = "userDao")
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public User login(User user) {
        return userDao.findUser(user);
    }

    public User findUserByDeptName(String deptName){
        return userDao.findUserByDeptName(deptName);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public void deleteUser(int id) {

    }

    public void createUser(User user) {
        userDao.createUser(user);
    }

    public User findUserById(int id) {
        return null;
    }

    public void pageUser(PageBean<User> pageBean) {
        userDao.pageUser(pageBean);
    }

}
