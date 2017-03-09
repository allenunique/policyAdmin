package com.allen.service.telMessage.impl;

import com.allen.dao.telMessage.PersonDao;
import com.allen.entity.telMessage.Person;
import com.allen.service.telMessage.PersonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ad on 2017-03-06.
 */
@Service("personService")
public class PersonServiceImpl implements PersonService {
    private PersonDao personDao;

    @Resource(name = "personDao")
    public void setPersonDao(PersonDao personDao) {
        this.personDao = personDao;
    }

    @Override
    public List<Person> getPersonsByDeptName(String deptName) {
        return personDao.getPersonsByDeptName(deptName);
    }

    @Override
    public Person findPersonById(int id) {
        return personDao.getPersonById(id);
    }

    @Override
    public void updatePerson(Person person) {
        personDao.updatePerson(person);
    }

    @Override
    public void deletePerson(int id) {
        personDao.deletePerson(id);
    }

    @Override
    public void addPerson(Person person) {
        personDao.insertPerson(person);
    }
}
