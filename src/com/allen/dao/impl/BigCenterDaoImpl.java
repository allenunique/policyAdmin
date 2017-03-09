package com.allen.dao.impl;

import com.allen.dao.BigCenterDao;

import com.allen.entity.BigCenter;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-03-02.
 */
@Repository("bigCenterDao")
public class BigCenterDaoImpl implements BigCenterDao {
    private SessionFactory sessionFactory;

    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<BigCenter> getBigCenters() {
        return sessionFactory.getCurrentSession().createQuery("from BigCenter").list();
    }

    @Override
    public void insertBigCenter(BigCenter bigCenter) {
        sessionFactory.getCurrentSession().save(bigCenter);
    }

    @Override
    public BigCenter queryBigCenterByName(String bigCenterName) {
        return (BigCenter) sessionFactory.getCurrentSession().createQuery("from BigCenter as b where b.bigCenterName=?").
                setParameter(0,bigCenterName).uniqueResult();
    }
}
