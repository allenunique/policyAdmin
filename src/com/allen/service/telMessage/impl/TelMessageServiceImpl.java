package com.allen.service.telMessage.impl;

import com.allen.dao.telMessage.TelMessageDao;
import com.allen.entity.telMessage.TelMessage;
import com.allen.service.telMessage.TelMessageService;
import com.allen.util.Conditions;
import com.allen.util.PageBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-02-23.
 */
@Service("telMessageService")
public class TelMessageServiceImpl implements TelMessageService {

    private TelMessageDao telMessageDao;
    @Resource(name = "telMessageDao")
    public void setTelMessageDao(TelMessageDao telMessageDao) {
        this.telMessageDao = telMessageDao;
    }

    public List<TelMessage> getAllList() {
        return telMessageDao.getAll();
    }

    public List<TelMessage> getByDept(){
        return telMessageDao.getByDept();
    }

    public List<TelMessage> getTelMessageByConditions(Conditions conditions) {
//        setConditions(conditions);

        return telMessageDao.pageTelMessage1ByConditions(null,conditions,true);
    }
    public void pageTelMessageByConditions(PageBean<TelMessage> telMessagePageBean,Conditions conditions) {
//        setConditions(conditions);
        System.out.println(conditions);
        telMessageDao.pageTelMessage1ByConditions(telMessagePageBean,conditions,false);
    }

    private void setConditions(Conditions conditions) {
        if("kefu".equals(conditions.getBigCenter())){
            conditions.setBigCenter("客服中心");
            if ("kefu1".equals(conditions.getCenter())) {
                conditions.setCenter("VIP维护中心");
            }
            if ("kefu2".equals(conditions.getCenter())) {
                conditions.setCenter("客户发展中心");
            }
            if ("kefu3".equals(conditions.getCenter())) {
                conditions.setCenter("客户开发中心");
            }
            if ("kefu4".equals(conditions.getCenter())) {
                conditions.setCenter("运营支持中心");
            }
            if ("kefu5".equals(conditions.getCenter())) {
                conditions.setCenter("直通车增值中心");
            }
        }
        if ("shangwuzhongxin".equals(conditions.getBigCenter())) {
            conditions.setBigCenter("商务中心");
            if ("shangwuzhongxin1".equals(conditions.getCenter())) {
                conditions.setCenter("商务A区");
            }
            if ("shangwuzhongxin2".equals(conditions.getCenter())) {
                conditions.setCenter("商务K区");
            }
            if ("shangwuzhongxin3".equals(conditions.getCenter())) {
                conditions.setCenter("商务F区");
            }
            if ("shangwuzhongxin4".equals(conditions.getCenter())) {
                conditions.setCenter("开封分公司");
            }
        }
    }

    @Override
    public void addTelMessageByList(List<TelMessage> telMessages) {
        for (TelMessage telMessage : telMessages) {
            telMessageDao.insertTelMessage(telMessage);
        }
    }
}
