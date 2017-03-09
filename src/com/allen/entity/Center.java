package com.allen.entity;

import java.util.Set;

/**
 * Created by ad on 2017-02-13.
 *
 */
public class Center {
    private int centerId;
    private String centerName;
    private BigCenter bigCenter;
    private Set<Dept> depts;

    public int getCenterId() {
        return centerId;
    }

    public void setCenterId(int centerId) {
        this.centerId = centerId;
    }

    public String getCenterName() {
        return centerName;
    }

    public void setCenterName(String centerName) {
        this.centerName = centerName;
    }

    public BigCenter getBigCenter() {
        return bigCenter;
    }

    public void setBigCenter(BigCenter bigCenter) {
        this.bigCenter = bigCenter;
    }

    public Set<Dept> getDepts() {
        return depts;
    }

    public void setDepts(Set<Dept> depts) {
        this.depts = depts;
    }
}
