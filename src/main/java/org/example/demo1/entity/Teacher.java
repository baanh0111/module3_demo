package org.example.demo1.entity;

import java.sql.Date;

public class Teacher extends Person {


    public Teacher(int id, String name, Date dob, String gender, String address, String phone, String email) {
        super(id, name, dob, gender, address, phone, email);

    }




    @Override
    public String getRole() {
        return "Teacher";
    }


}
