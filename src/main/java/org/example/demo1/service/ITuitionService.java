package org.example.demo1.service;

import org.example.demo1.entity.Tuition;
import java.util.List;

public interface ITuitionService {
    List<Tuition> getAllTuition();
    Tuition getTuitionById(int tuitionId);
    boolean addTuition(Tuition tuition);
    boolean updateTuition(Tuition tuition);
    boolean deleteTuition(int tuitionId);
}
