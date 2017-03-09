package com.allen.dao.telMessage;

import com.allen.entity.telMessage.Person;

import java.util.List;

/**
 * Created by ad on 2017-03-06.
 */
public interface PersonDao {
    List<Person> getPersonsByDeptName(String deptName);

    Person getPersonById(int id);

    void updatePerson(Person person);

    void deletePerson(int id);

    void insertPerson(Person person);
}
