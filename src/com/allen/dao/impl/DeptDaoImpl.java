package com.allen.dao.impl;

import com.allen.dao.DeptDao;
import com.allen.entity.Dept;
import com.allen.entity.telMessage.Person;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * Created by ad on 2017-02-28.
 */
@Repository("deptDao")
public class DeptDaoImpl implements DeptDao {

    private SessionFactory sessionFactory;
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Dept> getDeptsByCenterName(String centerName) {
        return sessionFactory.getCurrentSession().createQuery("from Dept as d where d.center.centerName = ?")
                .setParameter(0,centerName).list();
    }

    @Override
    public Dept getDeptById(int id) {
        Dept dept = (Dept) sessionFactory.getCurrentSession().get(Dept.class,id);
        Set<Person> persons = dept.getPersons();
        for (Person person : persons) {
            person.toString();
        }
        return dept;
    }

    @Override
    public Dept getDeptByName(String deptName) {
        return (Dept) sessionFactory.getCurrentSession().createQuery("from Dept as d where d.deptName = ?").
                setParameter(0,deptName).uniqueResult();
    }

    @Override
    public void updateDept(Dept dept) {
        sessionFactory.getCurrentSession().update(dept);
    }

    @Override
    public void deleteDept(int id) {
        sessionFactory.getCurrentSession().createQuery("delete from Dept where deptId = ?").
                setParameter(0, id).executeUpdate();
    }

    @Override
    public void insertDept(Dept dept) {
        sessionFactory.getCurrentSession().save(dept);
    }
}
