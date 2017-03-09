package com.allen.service;

import com.allen.entity.Dept;

import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */
public interface DeptService {
    List<Dept> getDeptsByCenterName(String centerName);

    Dept findDeptById(int id);

    Dept findDeptByName(String deptName);

    void updateDept(Dept dept);

    void deleteDept(int id);

    void addDept(Dept dept);
}
