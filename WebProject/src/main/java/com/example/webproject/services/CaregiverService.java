package com.example.webproject.services;

import com.example.webproject.models.Caregiver;
import com.example.webproject.repositories.CaregiverRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class CaregiverService {
    private final CaregiverRepository caregiverRepository;

    public void saveCaregiver(Caregiver caregiver) {
        log.info("Saving new caregiver: {}", caregiver);
        caregiverRepository.save(caregiver);
    }

    public void deleteCaregiver(Long id) {
        caregiverRepository.deleteById(id);
    }

    public Caregiver getCaregiverById(Long id) {
        return caregiverRepository.findById(id).orElse(null);
    }
}
