package com.allen.entity.tousu;

import com.allen.entity.User;

/**
 * Created by ad on 2017-02-07.
 * Order的第一部分
 */
public class OrderMessage1 {
    private String createOrderTime;				//  `creadOrderTime` datetime DEFAULT NULL ,	受理时间
    private String orderFrom;					//  `orderFrom` varchar(255) DEFAULT NULL,		流转渠道
    private String orderType;					//  `orderType` varchar(255) DEFAULT NULL,		流转类别
    private String danger;						//  `idDenger` varchar(255) DEFAULT NULL,		高危选项
    private String classify_one;				//  `classify_one` varchar(255) DEFAULT NULL,	一级分类
    private String classify_two;				//  `classify_two` varchar(255) DEFAULT NULL,	二级分类
    private String classify_three;				//  `classify_three` varchar(255) DEFAULT NULL,	三级分类
    private String userName;					//  `userName` varchar(255) DEFAULT NULL,		客户用户名
    private String tousuren;					//  `tousuren` varchar(255) DEFAULT NULL,		投诉人
    private String contact;						//  `contact` varchar(255) DEFAULT NULL,		联系方式
    private String eventDetail;				//  `enventDetail` varchar(500) DEFAULT NULL,	事件详情
    private String fatherUser;					//  `fatherUser` varchar(255) DEFAULT NULL,		父用户
    private String firstContact;				//  `firstContact` varchar(255) DEFAULT NULL,	首次联系情况
    private User user;
    private String beitousuren;

    public String getCreateOrderTime() {
        return createOrderTime;
    }

    public void setCreateOrderTime(String createOrderTime) {
        this.createOrderTime = createOrderTime;
    }

    public String getOrderFrom() {
        return orderFrom;
    }

    public void setOrderFrom(String orderFrom) {
        this.orderFrom = orderFrom;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getDanger() {
        return danger;
    }

    public void setDanger(String danger) {
        this.danger = danger;
    }

    public String getClassify_one() {
        return classify_one;
    }

    public void setClassify_one(String classify_one) {
        this.classify_one = classify_one;
    }

    public String getClassify_two() {
        return classify_two;
    }

    public void setClassify_two(String classify_two) {
        this.classify_two = classify_two;
    }

    public String getClassify_three() {
        return classify_three;
    }

    public void setClassify_three(String classify_three) {
        this.classify_three = classify_three;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTousuren() {
        return tousuren;
    }

    public void setTousuren(String tousuren) {
        this.tousuren = tousuren;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEventDetail() {
        return eventDetail;
    }

    public void setEventDetail(String eventDetail) {
        this.eventDetail = eventDetail;
    }

    public String getFatherUser() {
        return fatherUser;
    }

    public void setFatherUser(String fatherUser) {
        this.fatherUser = fatherUser;
    }

    public String getFirstContact() {
        return firstContact;
    }

    public void setFirstContact(String firstContact) {
        this.firstContact = firstContact;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getBeitousuren() {
        return beitousuren;
    }

    public void setBeitousuren(String beitousuren) {
        this.beitousuren = beitousuren;
    }

    @Override
    public String toString() {
        return "OrderMessage1{" +
                "createOrderTime='" + createOrderTime + '\'' +
                ", orderFrom='" + orderFrom + '\'' +
                ", orderType='" + orderType + '\'' +
                ", danger='" + danger + '\'' +
                ", classify_one='" + classify_one + '\'' +
                ", classify_two='" + classify_two + '\'' +
                ", classify_three='" + classify_three + '\'' +
                ", userName='" + userName + '\'' +
                ", tousuren='" + tousuren + '\'' +
                ", contact='" + contact + '\'' +
                ", eventDetail='" + eventDetail + '\'' +
                ", fatherUser='" + fatherUser + '\'' +
                ", firstContact='" + firstContact + '\'' +
                ", user=" + user +
                ", beitousuren='" + beitousuren + '\'' +
                '}';
    }
}
