package com.example.webproject.services;


import com.example.webproject.models.Child;
import com.example.webproject.repositories.ChildRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChildService {
    private final ChildRepository childRepository;

    public void saveChild(Child child) {
        log.info("Saving new child: {}", child);
        childRepository.save(child);
    }

    public void deleteChild(Long id) {
        childRepository.deleteById(id);
    }

    public Child getChildById(Long id) {
        return childRepository.findById(id).orElse(null);
    }
}
