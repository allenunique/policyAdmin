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

    private String userName;
    private String contact;
    private String classify_one;
    private String status;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getClassify_one() {
        return classify_one;
    }

    public void setClassify_one(String classify_one) {
        this.classify_one = classify_one;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Conditions{" +
                "startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", dept='" + dept + '\'' +
                ", center='" + center + '\'' +
                ", bigCenter='" + bigCenter + '\'' +
                ", userName='" + userName + '\'' +
                ", contact='" + contact + '\'' +
                ", classify_one='" + classify_one + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
