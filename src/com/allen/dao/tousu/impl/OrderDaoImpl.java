package com.allen.dao.tousu.impl;

import com.allen.dao.tousu.OrderDao;
import com.allen.entity.tousu.Order;
import com.allen.util.Conditions;
import com.allen.util.PageBean;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ad on 2017-02-15.
 */
@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {
    private SessionFactory sessionFactory;
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void createOrder(Order order) {
        sessionFactory.getCurrentSession().save(order);
    }

    public void deleteOrder(int id) {
        sessionFactory.getCurrentSession()//
                .createQuery("delete from Order where orderId=?")//
                .setParameter(0, id)//
                .executeUpdate();
    }

    public void updateOrder(Order order) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.update(order);
    }

    public void updateOrderStatus(int orderId, int status) {
        sessionFactory.getCurrentSession().createQuery("update Order o set o.status = ? where o.id = ?")
                .setParameter(0, status)
                .setParameter(1, orderId)
                .executeUpdate();
    }

    public Order findOrderById(int id) {
        Order order = (Order) sessionFactory.getCurrentSession().load(Order.class, id);
        order.getOrderMessage1().getUser().getDept().getCenter().getBigCenter().getBigCenterName();
        return order;
    }

    public List<Order> findOrderByStatus(int Status) {
        return  sessionFactory.getCurrentSession()//
                .createQuery("from Order o where o.status= ? ")//
                .setParameter(0,Status)//
                .list();
    }

//    public void pageOrderByStatus(PageBean<Order> pageOrderByStatus) {
//
//    }

//    public void pageAllOrder(PageBean<Order> pageAllOrder) {
//        Query q = sessionFactory.getCurrentSession().createQuery("from Order");
//        ScrollableResults scroll = q.scroll();
//        scroll.last();
//        int totalCount = scroll.getRowNumber()+1;
//        q.setFirstResult((pageAllOrder.getCurrentPage()-1)*pageAllOrder.getPageCount());
//        q.setMaxResults(pageAllOrder.getPageCount());
//        pageAllOrder.setPageData(q.list());
//        pageAllOrder.setTotalCount(totalCount);
//    }

    public List<Order> pageOrderByCondition(PageBean<Order> pageByCondition,Conditions conditions,boolean all) {
        boolean first = true;
        List<String> args = new ArrayList<>();
        StringBuilder sqlbuilder = new StringBuilder();
        sqlbuilder.append("from Order as o ");
        if(!"".equals(conditions.getStartTime())&&conditions.getStartTime()!=null){
            first = false;
            sqlbuilder.append(" where o.orderMessage1.createOrderTime > ? ");
            args.add(conditions.getStartTime());
        }
        if(!"".equals(conditions.getEndTime())&&conditions.getEndTime()!=null){
            if(first) {
                sqlbuilder.append(" where o.orderMessage1.createOrderTime < ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.createOrderTime < ? ");
            }
                args.add(conditions.getEndTime());
        }
        if(!"".equals(conditions.getUserName())&&conditions.getUserName()!=null){
            if(first){
                sqlbuilder.append(" where o.orderMessage1.userName like ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.userName like ? ");
            }
            args.add("%"+conditions.getUserName()+"%");
        }
        if(!"".equals(conditions.getDept())&&conditions.getDept()!=null){
            if(first){
                sqlbuilder.append(" where o.orderMessage1.user.dept.deptName like ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.user.dept.deptName like ? ");
            }
            args.add("%"+conditions.getDept()+"%");
        }

        if(!"".equals(conditions.getContact())&&conditions.getContact()!=null){
            if(first){
                sqlbuilder.append(" where o.orderMessage1.contact like ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.contact like ? ");
            }
            args.add("%"+conditions.getContact()+"%");
        }
        if(!"".equals(conditions.getClassify_one())&&conditions.getClassify_one()!=null){
            if(first){
                sqlbuilder.append(" where o.orderMessage1.classify_one like ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.classify_one like ? ");
            }
            args.add("%"+conditions.getClassify_one()+"%");
        }
        if(!"".equals(conditions.getCenter())&&conditions.getCenter()!=null){
            if(first){
                sqlbuilder.append(" where o.orderMessage1.user.dept.center.centerName like ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.user.dept.center.centerName like ? ");
            }
            args.add("%"+conditions.getCenter()+"%");
        }else if(!"".equals(conditions.getBigCenter())&&conditions.getBigCenter()!=null){
            if(first){
                sqlbuilder.append(" where o.orderMessage1.user.dept.center.bigCenter.bigCenterName  like ? ");
                first = false;
            }else{
                sqlbuilder.append(" and o.orderMessage1.user.dept.center.bigCenter.bigCenterName  like ? ");
            }
            args.add("%"+conditions.getBigCenter()+"%");
        }

        if(!"11".equals(conditions.getStatus())){
            if(first){
                sqlbuilder.append(" where o.status = ? ");
            }else {
                sqlbuilder.append(" and o.status = ? ");
            }
            args.add(conditions.getStatus());
        }

        Query q = sessionFactory.getCurrentSession().createQuery(sqlbuilder.toString());
        if(args.size()>0){
            if(args.size()==1 && !"11".equals(conditions.getStatus())){
                q.setParameter(0,Integer.parseInt(conditions.getStatus()));
            }else if(args.size() == 1){
                q.setParameter(0,args.get(0));
            }else{
                for(int index = 0;index < args.size()-1;index++){
                    q.setParameter(index,args.get(index));
                }
                if(!"11".equals(conditions.getStatus())){
                    q.setParameter(args.size()-1,Integer.parseInt(conditions.getStatus()));
                }
                else{
                    q.setParameter(args.size()-1,args.get(args.size()-1));
                }
            }

        }
        if(all){
            List<Order> orderList = q.list();
            for (Order order : orderList) {
                order.getOrderMessage1().getUser().getDept().getCenter().getBigCenter().getBigCenterName();
            }
            return orderList;
        }
        ScrollableResults scroll = q.scroll();
        scroll.last();
        int totalCount = scroll.getRowNumber()+1;
        pageByCondition.setTotalCount(totalCount);
        if(pageByCondition.getCurrentPage()==0){
            pageByCondition.setCurrentPage(1);
        }
        if(pageByCondition.getCurrentPage()>pageByCondition.getTotalPage()){
            pageByCondition.setCurrentPage(pageByCondition.getTotalPage());
        }
        q.setFirstResult((pageByCondition.getCurrentPage()-1)*pageByCondition.getPageCount());
        q.setMaxResults(pageByCondition.getPageCount());
        List<Order> pageData = q.list();
        for(Order order: pageData) {
            if (order.getStatus() == 0) {
                try {
                    String time = order.getOrderMessage1().getCreateOrderTime();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数
                    long nh = 1000 * 60 * 60;// 一小时的毫秒数
                    long date = sdf.parse(time).getTime();
                    long dateCurrent = new Date().getTime();
                    long diff = dateCurrent - date;
                    long day = diff / nd;//计算差多少天
                    long hour = diff % nd / nh + day * 24;// 计算差多少小时
                    int timeLimit = (int) (order.getOrderMessage2().getTimeAll() - hour);
                    if (timeLimit <= 0) {
                        order.getOrderMessage2().setTimeLimit(0);
                        order.setStatus(20);
                    }else{
                        order.getOrderMessage2().setTimeLimit(timeLimit);
                    }
                    updateOrder(order);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

            }
        }
        pageByCondition.setPageData(pageData);
        return null;
    }



}
