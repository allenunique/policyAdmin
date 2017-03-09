package com.allen.service.tousu.impl;

import com.allen.dao.BigCenterDao;
import com.allen.dao.tousu.OrderDao;
import com.allen.entity.BigCenter;
import com.allen.entity.tousu.Order;
import com.allen.entity.tousu.OrderMessage1;
import com.allen.entity.tousu.OrderMessage2;
import com.allen.service.tousu.OrderService;
import com.allen.util.Conditions;
import com.allen.util.PageBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-02-15.
 *
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao;
    private BigCenterDao bigCenterDao;
     @Resource(name = "orderDao")
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
    @Resource(name = "bigCenterDao")
    public void setBigCenterDao(BigCenterDao bigCenterDao) {
        this.bigCenterDao = bigCenterDao;
    }

    public List<BigCenter> getBigCenter (){
        return bigCenterDao.getBigCenters();
    }
    public void createOrder(OrderMessage1 orderMessage1, OrderMessage2 orderMessage2) {
        Order order = new Order();
        order.setStatus(0);
        order.setOrderMessage1(orderMessage1);
        order.setOrderMessage2(orderMessage2);
        orderDao.createOrder(order);
    }

    public void updateOrder(Order order){
        orderDao.updateOrder(order);
    }

    public void updateStatus(int id, int status) {
        orderDao.updateOrderStatus(id,status);
    }

    @Override
    public Order findById(int id) {
        return orderDao.findOrderById(id);
    }

//    public void pageAllOrder(PageBean<Order> pageAllOrder){
//        orderDao.pageAllOrder(pageAllOrder);
//    }

    public void pageOrderByCondition(PageBean<Order> pageConditionOrder, Conditions condition,boolean all) {
        orderDao.pageOrderByCondition(pageConditionOrder,condition,false);

    }

    public List<Order> getExportData(Conditions condition, boolean all) {
        return orderDao.pageOrderByCondition(null,condition,true);
    }

    public void deleteOrder(int id) {
        orderDao.deleteOrder(id);
    }
}
