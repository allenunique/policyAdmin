package com.allen.dao.telMessage.impl;

import com.allen.dao.telMessage.TelMessageDao;
import com.allen.entity.telMessage.Person;
import com.allen.entity.telMessage.TelMessage;
import com.allen.util.Conditions;
import com.allen.util.PageBean;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ad on 2017-02-23.
 */
@Repository("telMessageDao")
public class TelMessageDaoImpl implements TelMessageDao {


    private SessionFactory sessionFactory;
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void insertTelMessage(TelMessage telMessage) {
        String telNum = telMessage.getTelNum();
       Person person = (Person) sessionFactory.getCurrentSession().createQuery("from Person as p where p.tel = ?").
                setParameter(0, telNum).uniqueResult();
        telMessage.setPerson(person);
        sessionFactory.getCurrentSession().save(telMessage);
    }

    public List<TelMessage> getAll() {
       return sessionFactory.getCurrentSession().createQuery("from TelMessage ").list();
    }

    public List<TelMessage> getByDept(){
        Query query = sessionFactory.getCurrentSession().createQuery("from TelMessage as t where t.person.dept.deptId = 18");
        List<TelMessage> list = query.list();
        for (TelMessage telMessage:list
             ) {
            telMessage.getPerson().getDept().getCenter().getBigCenter().getBigCenterName();
        }
        return list;
    }

    public List<TelMessage> pageTelMessage1ByConditions(PageBean<TelMessage> pageBean, Conditions conditions,boolean all) {
        boolean first = true;
        List<String> args = new ArrayList<>();
        StringBuilder sqlbuilder = new StringBuilder();
        sqlbuilder.append("from TelMessage as t ");

        if (!"".equals(conditions.getDept()) && conditions.getDept() != null) {
            sqlbuilder.append(" where t.person.dept.deptName = ? ");
            first = false;
            args.add(conditions.getDept());
        }else if(!"".equals(conditions.getCenter()) && conditions.getCenter() != null){
            sqlbuilder.append(" where t.person.dept.center.centerName = ? ");
            first = false;
            args.add(conditions.getCenter());
        }else if(!"".equals(conditions.getBigCenter()) && conditions.getBigCenter() != null){
            sqlbuilder.append(" where t.person.dept.center.bigCenter.bigCenterName = ? ");
            first = false;
            args.add(conditions.getBigCenter());
        }

        if(!"".equals(conditions.getStartTime()) && conditions.getStartTime() != null){
            if(first) {
                sqlbuilder.append(" where t.date >= ? ");
                first = false;
            }else{
                sqlbuilder.append(" and t.date >= ? ");
            }
            args.add(conditions.getStartTime());
        }
        if(!"".equals(conditions.getEndTime()) && conditions.getEndTime() != null){
            if(first) {
                sqlbuilder.append(" where t.date <= ? ");
                first = false;
            }else{
                sqlbuilder.append(" and t.date <= ? ");
            }
            args.add(conditions.getEndTime());
        }
        Query q = sessionFactory.getCurrentSession().createQuery(sqlbuilder.toString());
        if(args.size()>0){
            for(int index = 0;index < args.size();index++){
                q.setParameter(index,args.get(index));
            }
        }
        if(all){
            List<TelMessage> telMessageList = q.list();
            for (TelMessage telMessage : telMessageList) {
                telMessage.getPerson().getDept().getCenter().getBigCenter().getBigCenterName();
//System.out.println(telMessage.getPerson().getDept().getDeptName());
            }
            return telMessageList;
        }
        ScrollableResults scroll = q.scroll();
        scroll.last();
        int totalCount = scroll.getRowNumber()+1;
        pageBean.setTotalCount(totalCount);
        if(pageBean.getCurrentPage()==0){
            pageBean.setCurrentPage(1);
        }
        if(pageBean.getCurrentPage()>pageBean.getTotalPage()){
            pageBean.setCurrentPage(pageBean.getTotalPage());
        }
        q.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageCount());
        q.setMaxResults(pageBean.getPageCount());
        List<TelMessage>telMessageList = q.list();
        for (TelMessage telMessage :telMessageList) {
            telMessage.getPerson().getDept().getCenter().getBigCenter().getBigCenterName();
        }
        pageBean.setPageData(telMessageList);
        return null;
    }
}
