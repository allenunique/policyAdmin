package com.allen.dao;

import com.allen.entity.Dept;

import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */
public interface DeptDao {
    List<Dept> getDeptsByCenterName(String centerName);

    Dept getDeptById(int id);

    Dept getDeptByName(String deptName);

    void updateDept(Dept dept);

    void deleteDept(int id);

    void insertDept(Dept dept);
}
