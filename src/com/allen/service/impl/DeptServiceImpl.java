package com.allen.service.impl;

import com.allen.dao.DeptDao;
import com.allen.entity.Dept;
import com.allen.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-02-28.
 */
@Service("deptService")
public class DeptServiceImpl implements DeptService {
    private DeptDao deptDao;

    @Resource(name = "deptDao")
    public void setDeptDao(DeptDao deptDao) {
        this.deptDao = deptDao;
    }

    public List<Dept> getDeptsByCenterName(String centerName) {
        return deptDao.getDeptsByCenterName(centerName);
    }

    @Override
    public Dept findDeptById(int id) {
        return deptDao.getDeptById(id);
    }

    @Override
    public Dept findDeptByName(String deptName) {
        return deptDao.getDeptByName(deptName);
    }

    @Override
    public void updateDept(Dept dept) {
        deptDao.updateDept(dept);
    }

    @Override
    public void deleteDept(int id) {
        deptDao.deleteDept(id);
    }

    @Override
    public void addDept(Dept dept) {
        deptDao.insertDept(dept);
    }
}
