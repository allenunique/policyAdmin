package com.allen.dao.impl;

import com.allen.dao.UserDao;
import com.allen.entity.User;
import com.allen.util.PageBean;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * Created by ad on 2017-02-07.
 *
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {
    // 容器注入
    private SessionFactory sessionFactory;

    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void createUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    public void deleteUser(int id) {
        // HQL查询区分大小写： 对象/对象属性严格区分大小写
        // 数据库关键字不区分
        sessionFactory.getCurrentSession()//
                .createQuery("delete from User where userId=?")//
                .setParameter(0, id)//
                .executeUpdate();
    }

    public void updateUser(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    public User findUserByDeptName(String deptName) {
        User user = (User)sessionFactory.getCurrentSession().createQuery("from User as u where u.dept.deptName = ?")
                .setParameter(0, deptName).uniqueResult();
        if(user!=null) {
            user.getDept().getCenter().getBigCenter().getBigCenterName();
        }

        return user;
    }


    public User findUser(User user) {
         User user_ = (User)sessionFactory.getCurrentSession()//
                .createQuery("from User where username=? and password=?")//
                .setString(0, user.getUsername())//
                .setString(1, user.getPassword())//
                .uniqueResult();
        if(user_!=null && !"admin".equals(user_.getType())) {
            user_.getDept().getCenter().getBigCenter().getBigCenterName();
        }
         return user_;
    }

    public void pageUser(PageBean<User> pageBean) {
        Query q = sessionFactory.getCurrentSession().createQuery("from User");
        ScrollableResults scroll = q.scroll();
        scroll.last();
        int totalCount = scroll.getRowNumber()+1;
        q.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageCount());
        q.setMaxResults(pageBean.getPageCount());
        pageBean.setPageData(q.list());
        pageBean.setPageCount(totalCount);
    }
}
