package com.allen.dao.impl;

import com.allen.dao.CenterDao;
import com.allen.entity.Center;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */
@Repository("centerDao")
public class CenterDaoImpl implements CenterDao {
    private SessionFactory sessionFactory;
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Center> getCentersByBigCenterName(String bigCenterName) {
        return sessionFactory.getCurrentSession().createQuery("from Center as c where c.bigCenter.bigCenterName = ?")
                .setParameter(0,bigCenterName).list();
    }

    @Override
    public Center getCenterById(int id) {
        Center center = (Center) sessionFactory.getCurrentSession().get(Center.class, id);
        center.getDepts();
        return center;
    }

    @Override
    public Center getCenterByName(String centerName) {
        return (Center) sessionFactory.getCurrentSession().createQuery("from Center as c where c.centerName = ?").
                setParameter(0,centerName).uniqueResult();
    }

    @Override
    public void updateCenter(Center center) {
        sessionFactory.getCurrentSession().update(center);
    }

    @Override
    public void deleteCenter(int id) {
        sessionFactory.getCurrentSession().createQuery("delete from Center where centerId = ?").
                setParameter(0, id).executeUpdate();
    }

    @Override
    public void insertCenter(Center center) {
        sessionFactory.getCurrentSession().save(center);
    }
}
