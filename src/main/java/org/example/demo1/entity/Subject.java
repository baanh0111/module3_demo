//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package org.example.demo1.entity;

public class Subject {
    private int id;
    private String name;

    public Subject(int subject_id, String subject_name) {
        this.id = subject_id;
        this.name = subject_name;
    }

    public Subject(String subject_name) {
        this.name = subject_name;
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String subject_name) {
        this.name = subject_name;
    }

    public String toString() {
        return "Subject{subject_id=" + this.id + ", subject_name='" + this.name + '\'' + '}';
    }
}
