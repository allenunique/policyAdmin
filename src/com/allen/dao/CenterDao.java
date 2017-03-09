package com.allen.dao;

import com.allen.entity.Center;

import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */
public interface CenterDao {
    List<Center> getCentersByBigCenterName(String bigCenterName);

    Center getCenterById(int id);

    Center getCenterByName(String centerName);

    void updateCenter(Center center);

    void deleteCenter(int id);
    
    void insertCenter(Center center);
}
