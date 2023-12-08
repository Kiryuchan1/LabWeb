package com.example.webproject.services;

import com.example.webproject.models.Parent;
import com.example.webproject.repositories.ParentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ParentService {
    private final ParentRepository parentRepository;

    public void saveParent(Parent parent) {
        log.info("Saving new parent: {}", parent);
        parentRepository.save(parent);
    }

    public void deleteParent(Long id) {
        parentRepository.deleteById(id);
    }

    public Parent getParentById(Long id) {
        return parentRepository.findById(id).orElse(null);
    }
}
