package com.allen.service.impl;

import com.allen.dao.BigCenterDao;
import com.allen.entity.BigCenter;
import com.allen.service.BigCenterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-03-02.
 */
@Service("bigCenterService")
public class BigCenterServiceImpl implements BigCenterService {
    private BigCenterDao bigCenterDao;

    @Resource(name = "bigCenterDao")
    public void setBigCenterDao(BigCenterDao bigCenterDao) {
        this.bigCenterDao = bigCenterDao;
    }

    @Override
    public List<BigCenter> getBigCenters() {
        return bigCenterDao.getBigCenters();
    }

    @Override
    public void addBigCenter(BigCenter bigCenter) {
        bigCenterDao.insertBigCenter(bigCenter);
    }

    @Override
    public BigCenter findBigCenterByName(String bigCenterName) {
        return bigCenterDao.queryBigCenterByName(bigCenterName);
    }
}
