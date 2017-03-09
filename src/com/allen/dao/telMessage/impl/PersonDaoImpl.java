package com.allen.dao.telMessage.impl;

import com.allen.dao.telMessage.PersonDao;
import com.allen.entity.telMessage.Person;
import com.allen.entity.telMessage.TelMessage;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * Created by ad on 2017-03-06.
 */
@Repository("personDao")
public class PersonDaoImpl implements PersonDao {

    private SessionFactory sessionFactory;
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Person> getPersonsByDeptName(String deptName) {
        return sessionFactory.getCurrentSession().createQuery("from Person as p where p.dept.deptName = ?")
                .setParameter(0,deptName).list();
    }

    @Override
    public Person getPersonById(int id) {
        Person person = (Person) sessionFactory.getCurrentSession().get(Person.class,id);
        Set<TelMessage> telMessages = person.getTelMessages();
        for (TelMessage telMessage: telMessages) {
            telMessage.toString();
        }
        return person;
    }

    @Override
    public void updatePerson(Person person) {
        sessionFactory.getCurrentSession().update(person);
    }

    @Override
    public void deletePerson(int id) {
        sessionFactory.getCurrentSession().createQuery("delete from Person where id = ?").
                setParameter(0, id).executeUpdate();
    }

    @Override
    public void insertPerson(Person person) {
        sessionFactory.getCurrentSession().save(person);
    }
}
