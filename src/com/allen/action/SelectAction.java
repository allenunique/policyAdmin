package com.allen.action;

import com.allen.entity.BigCenter;
import com.allen.entity.Center;
import com.allen.entity.Dept;
import com.allen.service.BigCenterService;
import com.allen.service.CenterService;
import com.allen.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Allen on 2017/2/26.
 */
@Controller
@RequestMapping(value = "select")
public class SelectAction {
    private DeptService deptService;
    private CenterService centerService;
    private BigCenterService bigCenterService;

    @Resource(name = "bigCenterService")
    public void setBigCenterService(BigCenterService bigCenterService) {
        this.bigCenterService = bigCenterService;
    }

    @Resource(name = "centerService")
    public void setCenterService(CenterService centerService) {
        this.centerService = centerService;
    }

    @Resource(name = "deptService")
    public void setDeptService(DeptService deptService) {
        this.deptService = deptService;
    }

    @RequestMapping(value = "getBigCenter",method  = RequestMethod.POST)
    @ResponseBody
    public List<BigCenter> getBigCenter() throws Exception {
        List<BigCenter> bigCenters =  bigCenterService.getBigCenters();
        for (BigCenter bigCenter : bigCenters) {
            bigCenter.setCenters(null);
        }
        return bigCenters;
    }
       @RequestMapping(value = "getCenter",method  = RequestMethod.POST)
       @ResponseBody
    public Object getCenter(@RequestParam(value = "bigCenterName")String bigCenterName) throws Exception {
        List<Center> centers =  centerService.getCentersByBigCenterName(bigCenterName);
           for (Center center : centers) {
               center.setDepts(null);
               center.setBigCenter(null);
           }
           return centers;
    }
       @RequestMapping("getDept")
       @ResponseBody
    public Object getDept(String centerName) throws Exception {
        List<Dept> depts = deptService.getDeptsByCenterName(centerName);
           for (Dept dept:depts) {
               dept.setCenter(null);
               dept.setPersons(null);
               dept.setUser(null);
           }
           return depts;
    }
}
