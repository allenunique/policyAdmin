package com.allen.entity.telMessage;

import com.allen.entity.Dept;

import java.util.Set;

/**
 * Created by ad on 2017-02-22.
 */
public class Person {
   private int id;
   private Dept dept;
   private String name;
   private String crm;
   private String tel;
   private Set<TelMessage> telMessages;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCrm() {
        return crm;
    }

    public void setCrm(String crm) {
        this.crm = crm;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Set<TelMessage> getTelMessages() {
        return telMessages;
    }

    public void setTelMessages(Set<TelMessage> telMessages) {
        this.telMessages = telMessages;
    }
}
