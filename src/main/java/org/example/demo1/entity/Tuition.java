package org.example.demo1.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Tuition {
    private int tuitionId;
    private Student student; // Remplace studentId par Student
    private BigDecimal amount;
    private Date dueDate;
    private String paidStatus;
    private Date paymentDate;

    // Constructor
    public Tuition(int tuitionId, Student student, BigDecimal amount, Date dueDate, String paidStatus, Date paymentDate) {
        this.tuitionId = tuitionId;
        this.student = student;
        this.amount = amount;
        this.dueDate = dueDate;
        this.paidStatus = paidStatus;
        this.paymentDate = paymentDate;
    }
    // Thêm phương thức getter cho ID
    public int getId() {
        return tuitionId;
    }

    // Getters & Setters
    public int getTuitionId() {
        return tuitionId;
    }

    public void setTuitionId(int tuitionId) {
        this.tuitionId = tuitionId;
    }

    public Student getStudent() { // ✅ Ajout du getter
        return student;
    }

    public void setStudent(Student student) { // ✅ Ajout du setter
        this.student = student;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getPaidStatus() {
        return paidStatus;
    }

    public void setPaidStatus(String paidStatus) {
        this.paidStatus = paidStatus;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
}
