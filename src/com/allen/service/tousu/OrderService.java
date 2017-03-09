package com.allen.service.tousu;
import com.allen.entity.BigCenter;
import com.allen.entity.tousu.Order;
import com.allen.entity.tousu.OrderMessage1;
import com.allen.entity.tousu.OrderMessage2;
import com.allen.util.Conditions;
import com.allen.util.PageBean;

import java.util.List;

/**
 * Created by ad on 2017-02-15.
 *
 */
public interface OrderService {

    List<BigCenter> getBigCenter();

    void createOrder(OrderMessage1 orderMessage1, OrderMessage2 orderMessage2);

//    void pageAllOrder(PageBean<Order> pageAllOrder);

    void pageOrderByCondition(PageBean<Order> pageConditionOrder, Conditions condition, boolean all);

    List<Order> getExportData(Conditions condition, boolean all);

    void updateOrder(Order order);

    void updateStatus(int id, int status);

    Order findById(int id);

    void deleteOrder(int id);
}
