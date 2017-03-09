package com.allen.service.telMessage;


import com.allen.entity.telMessage.TelMessage;
import com.allen.util.Conditions;
import com.allen.util.PageBean;

import java.util.List;

/**
 * Created by ad on 2017-02-23.
 */
public interface TelMessageService {
    List<TelMessage> getAllList();

    List<TelMessage> getByDept();

    List<TelMessage> getTelMessageByConditions(Conditions conditions);

    void pageTelMessageByConditions(PageBean<TelMessage> telMessagePageBean, Conditions conditions);

    void addTelMessageByList(List<TelMessage> telMessages);
}
