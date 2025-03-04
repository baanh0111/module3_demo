package org.example.demo1.service.impl;

import org.example.demo1.entity.Tuition;
import org.example.demo1.repository.TuitionRepository;
import org.example.demo1.service.ITuitionService;

import java.util.List;

public class TuitionService implements ITuitionService {
    private final TuitionRepository tuitionRepository = new TuitionRepository();

    @Override
    public List<Tuition> getAllTuition() {
        return tuitionRepository.getAllTuition();
    }

    @Override
    public Tuition getTuitionById(int tuitionId) {
        return tuitionRepository.getTuitionById(tuitionId);
    }

    @Override
    public boolean addTuition(Tuition tuition) {
        return tuitionRepository.addTuition(tuition);
    }

    @Override
    public boolean updateTuition(Tuition tuition) {
        return tuitionRepository.updateTuition(tuition);
    }

    @Override
    public boolean deleteTuition(int tuitionId) {
        return tuitionRepository.deleteTuition(tuitionId);
    }
}

