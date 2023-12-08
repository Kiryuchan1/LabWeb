package com.example.webproject.controllers;

import com.example.webproject.models.Caregiver;
import com.example.webproject.models.Group;
import com.example.webproject.models.Reward;
import com.example.webproject.services.CaregiverService;
import com.example.webproject.services.GroupService;
import com.example.webproject.services.RewardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/group/{groupId}/caregiver/{caregiverId}/reward")
public class RewardController {
    private final GroupService groupService;
    private final CaregiverService caregiverService;
    private final RewardService rewardService;

    @GetMapping
    public String rewards(@PathVariable("groupId") Long groupId, @PathVariable("caregiverId") Long caregiverId, Model model) {
        Group group = groupService.getGroupById(groupId);
        Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
        model.addAttribute("group", group);
        model.addAttribute("caregiver", caregiver);
        model.addAttribute("rewards", caregiver.getRewards());
        return "rewards";
    }

    @GetMapping("/{rewardId}/edit")
    public String editReward(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId,
            @PathVariable("rewardId") Long rewardId,
            Model model
    ) {
        Group group = groupService.getGroupById(groupId);
        Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
        Reward reward = rewardService.getRewardById(rewardId);
        model.addAttribute("group", group);
        model.addAttribute("caregiver", caregiver);
        model.addAttribute("reward", reward);
        return "edit-reward";
    }

    @PostMapping("/{rewardId}/update")
    public String updateReward(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId,
            @PathVariable("rewardId") Long rewardId,
            @RequestParam("name") String name,
            @RequestParam("description") String description
    ) {
        Reward reward = rewardService.getRewardById(rewardId);
        if (reward != null) {
            reward.setName(name);
            reward.setDescription(description);
            rewardService.saveReward(reward);
        }
        return "redirect:/group/" + groupId + "/caregiver/" + caregiverId + "/reward";
    }

    @PostMapping("/{rewardId}/delete")
    public String deleteReward(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId,
            @PathVariable("rewardId") Long rewardId
    ) {
        Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
        if (caregiver != null) {
            Reward reward = rewardService.getRewardById(rewardId);
            if (reward != null && caregiver.getRewards().contains(reward)) {
                caregiver.getRewards().remove(reward);
                rewardService.deleteReward(rewardId);
                caregiverService.saveCaregiver(caregiver);
            }
        }
        return "redirect:/group/" + groupId + "/caregiver/" + caregiverId + "/reward";
    }

    @PostMapping("/create")
    public String createReward(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId,
            @RequestParam("name") String name,
            @RequestParam("description") String description
    ) {
        Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
        Reward reward = new Reward();
        reward.setName(name);
        reward.setDescription(description);
        reward.setCaregiver(caregiver);
        rewardService.saveReward(reward);
        return "redirect:/group/" + groupId + "/caregiver/" + caregiverId + "/reward";
    }
}
