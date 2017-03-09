package com.allen.dao;

import com.allen.entity.BigCenter;
import java.util.List;

/**
 * Created by ad on 2017-03-02.
 *
 */
public interface BigCenterDao {
    List<BigCenter> getBigCenters();

    void insertBigCenter(BigCenter bigCenter);

    BigCenter queryBigCenterByName(String bigCenterName);
}
