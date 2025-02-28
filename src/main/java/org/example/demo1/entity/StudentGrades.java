package org.example.demo1.entity;

import java.util.HashMap;
import java.util.Map;

public class StudentGrades {
    private int studentId;
    private String studentName;
    private Map<String, Double> scores; // Key: Tên môn học, Value: Điểm

    public StudentGrades(int studentId, String studentName) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.scores = new HashMap<>();
    }

    public void addScore(String subjectName, Double score) {
        scores.put(subjectName, score);
    }

    public int getStudentId() {
        return studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public Map<String, Double> getScores() {
        return scores;
    }
}
