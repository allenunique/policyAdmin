package com.allen.dao.telMessage;


import com.allen.entity.telMessage.TelMessage;
import com.allen.util.Conditions;
import com.allen.util.PageBean;

import java.util.List;

/**
 * Created by ad on 2017-02-23.
 */
public interface TelMessageDao {

    List<TelMessage> getAll();

    List<TelMessage> getByDept();

    List<TelMessage> pageTelMessage1ByConditions(PageBean<TelMessage> pageBean, Conditions conditions, boolean all);

    void insertTelMessage(TelMessage telMessage);

}
