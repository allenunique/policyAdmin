package com.allen.service.impl;

import com.allen.dao.CenterDao;
import com.allen.entity.Center;
import com.allen.service.CenterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */
@Service("centerService")
public class CenterServiceImpl implements CenterService {
    private CenterDao centerDao;

    @Resource(name = "centerDao")
    public void setCenterDao(CenterDao centerDao) {
        this.centerDao = centerDao;
    }

    @Override
    public List<Center> getCentersByBigCenterName(String bigCenterName) {
        return centerDao.getCentersByBigCenterName(bigCenterName);
    }

    @Override
    public Center findCenterById(int id) {
        return centerDao.getCenterById(id);
    }

    @Override
    public Center findCenterByName(String centerName) {
        return centerDao.getCenterByName(centerName);
    }

    @Override
    public void updateCenter(Center center) {
        centerDao.updateCenter(center);
    }

    @Override
    public void deleteCenter(int id) {
        centerDao.deleteCenter(id);
    }

    @Override
    public void addCenter(Center center) {
        centerDao.insertCenter(center);
    }
}
