package com.allen.service.telMessage;

import com.allen.entity.telMessage.Person;

import java.util.List;

/**
 * Created by ad on 2017-03-06.
 */
public interface PersonService {
    List<Person> getPersonsByDeptName(String deptName);

    Person findPersonById(int id);

    void updatePerson(Person person);

    void deletePerson(int id);

    void addPerson(Person person);
}
