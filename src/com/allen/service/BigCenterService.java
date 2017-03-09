package com.allen.service;

import com.allen.entity.BigCenter;

import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */

public interface BigCenterService {
    List<BigCenter> getBigCenters();

    void addBigCenter(BigCenter bigCenter);

    BigCenter findBigCenterByName(String bigCenterName);
}
