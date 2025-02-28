package org.example.demo1.entity;

public class Subject
{
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
        return id;
    }

    public String getName() {
        return name;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setName(String subject_name) {
        this.name = subject_name;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "subject_id=" + id +
                ", subject_name='" + name + '\'' +
                '}';
    }
}


