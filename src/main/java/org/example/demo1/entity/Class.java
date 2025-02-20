package org.example.demo1.entity;



public class Class {
    private int classId;
    private String className;
    private int teacherId;

    public Class() {
    }

    public Class(int classId, String className, int teacherId) {
        this.classId = classId;
        this.className = className;
        this.teacherId = teacherId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }
}

