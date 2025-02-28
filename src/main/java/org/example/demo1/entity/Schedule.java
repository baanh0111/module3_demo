package org.example.demo1.entity;

import java.sql.Time;

public class Schedule {
    private int schedule_id;
    private int class_id;
    private int subject_id;
    private String day_of_week;
    private Time start_time;
    private Time end_time;
    private String class_name; // Thêm thuộc tính class_name
    private String subject_name; // Thêm thuộc tính subject_name

    public Schedule(int schedule_id, int class_id, int subject_id, String day_of_week, Time start_time, Time end_time) {}

    public Schedule(int schedule_id, int class_id, int subject_id, String day_of_week, Time start_time, Time end_time, String class_name, String subject_name) {
        this.schedule_id = schedule_id;
        this.class_id = class_id;
        this.subject_id = subject_id;
        this.day_of_week = day_of_week;
        this.start_time = start_time;
        this.end_time = end_time;
        this.class_name = class_name;
        this.subject_name = subject_name;
    }

    // Getters và Setters
    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public void setDay_of_week(String day_of_week) {
        this.day_of_week = day_of_week;
    }

    public Time getStart_time() {
        return start_time;
    }

    public void setStart_time(Time start_time) {
        this.start_time = start_time;
    }

    public Time getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Time end_time) {
        this.end_time = end_time;
    }

    public String getClass_name() { // Thêm getter cho class_name
        return class_name;
    }

    public void setClass_name(String class_name) { // Thêm setter cho class_name
        this.class_name = class_name;
    }

    public String getSubject_name() { // Thêm getter cho subject_name
        return subject_name;
    }

    public void setSubject_name(String subject_name) { // Thêm setter cho subject_name
        this.subject_name = subject_name;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "schedule_id=" + schedule_id +
                ", class_id=" + class_id +
                ", subject_id=" + subject_id +
                ", day_of_week='" + day_of_week + '\'' +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                ", class_name='" + class_name + '\'' +
                ", subject_name='" + subject_name + '\'' +
                '}';
    }
}