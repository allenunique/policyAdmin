package com.allen.entity.tousu;

/**
 * Created by ad on 2017-02-07.
 */
public class Order {
    private int orderId;
    private OrderMessage1 orderMessage1;
    private OrderMessage2 orderMessage2;
    private OrderMessage3 orderMessage3;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public OrderMessage1 getOrderMessage1() {
        return orderMessage1;
    }

    public void setOrderMessage1(OrderMessage1 orderMessage1) {
        this.orderMessage1 = orderMessage1;
    }

    public OrderMessage2 getOrderMessage2() {
        return orderMessage2;
    }

    public void setOrderMessage2(OrderMessage2 orderMessage2) {
        this.orderMessage2 = orderMessage2;
    }

    public OrderMessage3 getOrderMessage3() {
        return orderMessage3;
    }

    public void setOrderMessage3(OrderMessage3 orderMessage3) {
        this.orderMessage3 = orderMessage3;
    }
}
