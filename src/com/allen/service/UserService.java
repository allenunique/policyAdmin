package com.allen.service;

import com.allen.entity.User;
import com.allen.util.PageBean;

import java.util.List;

/**
 * Created by ad on 2017-02-10.
 *
 */
public interface UserService {
    User login(User user);

    void updateUser(User user);

    void deleteUser(int id);

    void createUser(User user);

    User findUserById(int id);

    User findUserByDeptName(String deptName);

    void pageUser(PageBean<User> pageBean);
}
