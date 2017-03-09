package com.allen.entity;

import java.util.Set;

/**
 * Created by ad on 2017-02-13.
 *
 */
public class BigCenter {
    private int bigCenterId;
    private String bigCenterName;
    private Set<Center> centers;

    public int getBigCenterId() {
        return bigCenterId;
    }

    public void setBigCenterId(int bigCenterId) {
        this.bigCenterId = bigCenterId;
    }

    public String getBigCenterName() {
        return bigCenterName;
    }

    public void setBigCenterName(String bigCenterName) {
        this.bigCenterName = bigCenterName;
    }

    public Set<Center> getCenters() {
        return centers;
    }

    public void setCenters(Set<Center> centers) {
        this.centers = centers;
    }
}
