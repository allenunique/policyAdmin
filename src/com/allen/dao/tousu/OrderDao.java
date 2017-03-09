package com.allen.dao.tousu;

import com.allen.entity.tousu.Order;
import com.allen.util.Conditions;
import com.allen.util.PageBean;

import java.util.List;

/**
 * Created by ad on 2017-02-13.
 *
 */
public interface OrderDao {

    void createOrder(Order order);

    void deleteOrder(int id);

    void updateOrder(Order order);


    void updateOrderStatus(int orderId, int status);

    Order findOrderById(int id);

    List<Order> findOrderByStatus(int Status);

//    void pageOrderByStatus(PageBean<Order> pageOrderByStatus);

//    void pageAllOrder(PageBean<Order> pageAllOrder);


    List<Order> pageOrderByCondition(PageBean<Order> pageByCondition, Conditions conditions, boolean all);






}
