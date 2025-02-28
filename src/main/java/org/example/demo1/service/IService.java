package org.example.demo1.service;


import org.example.demo1.entity.Person;

import java.util.List;

public interface IService <T extends Person>{
    List<T> getAll();

    void save(T t);

    void remove(int id);

    void update(int id, T t);

    T findById(int id);

    List<T> findAllByName(String name);





}
