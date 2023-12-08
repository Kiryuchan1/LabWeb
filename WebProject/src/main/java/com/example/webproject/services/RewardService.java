package com.example.webproject.services;

import com.example.webproject.models.Reward;
import com.example.webproject.repositories.RewardRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class RewardService {
    private final RewardRepository rewardRepository;

    public void saveReward(Reward reward) {
        log.info("Saving new reward: {}", reward);
        rewardRepository.save(reward);
    }

    public void deleteReward(Long id) {
        rewardRepository.deleteById(id);
    }

    public Reward getRewardById(Long id) {
        return rewardRepository.findById(id).orElse(null);
    }
}
