package com.allen.util;

/**
 * Created by ad on 2017-02-24.
 */
public class Conditions {
    private String startTime;
    private String endTime;
    private String dept;
    private String center;
    private String bigCenter;

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getCenter() {
        return center;
    }

    public void setCenter(String center) {
        this.center = center;
    }

    public String getBigCenter() {
        return bigCenter;
    }

    public void setBigCenter(String bigCenter) {
        this.bigCenter = bigCenter;
    }

    @Override
    public String toString() {
        return "Conditions{" +
                "startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", dept='" + dept + '\'' +
                ", center='" + center + '\'' +
                ", bigCenter='" + bigCenter + '\'' +
                '}';
    }
}
