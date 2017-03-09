package com.allen.service;


import com.allen.entity.Center;

import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */

public interface CenterService {
    List<Center> getCentersByBigCenterName(String bigCenterName);

    Center findCenterById(int id);

    Center findCenterByName(String centerName);

    void updateCenter(Center center);

    void deleteCenter(int id);

    void addCenter(Center center);
}
