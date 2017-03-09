package com.allen.dao;
import com.allen.entity.User;
import com.allen.util.PageBean;

/**
 * Created by ad on 2017-02-07.
 *
 */
public interface UserDao {
    void createUser(User user);

    void deleteUser(int id);

    void updateUser(User user);

    User findUserByDeptName(String deptName);

    User findUser(User user);

    void pageUser(PageBean<User> pageBean);
}
