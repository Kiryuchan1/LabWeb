package com.example.webproject.controllers;

import com.example.webproject.models.Caregiver;
import com.example.webproject.models.Group;
import com.example.webproject.services.CaregiverService;
import com.example.webproject.services.GroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class CaregiverController {
    private final GroupService groupService;
    private final CaregiverService caregiverService;

    @PostMapping("/group/{groupId}/caregiver/create")
    public String createCaregiver(
            @PathVariable("groupId") Long groupId,
            @RequestParam("fname") String fname,
            @RequestParam("surname") String surname,
            @RequestParam("lastname") String lastname,
            @RequestParam("phone") double phone,
            @RequestParam("mail") String mail,
            @RequestParam("stage") double stage
    ) {
        Group group = groupService.getGroupById(groupId);
        Caregiver caregiver = new Caregiver();
        caregiver.setFname(fname);
        caregiver.setSurname(surname);
        caregiver.setLastname(lastname);
        caregiver.setPhone(phone);
        caregiver.setMail(mail);
        caregiver.setStage(stage);
        caregiver.setGroup(group);
        caregiverService.saveCaregiver(caregiver);
        return "redirect:/group/" + groupId + "/caregivers";
    }

    @PostMapping("/group/{groupId}/caregiver/{caregiverId}/delete")
    public String deleteCaregiver(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId
    ) {
        Group group = groupService.getGroupById(groupId);
        if (group != null) {
            Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
            if (caregiver != null && group.getCaregivers().contains(caregiver)) {
                group.getCaregivers().remove(caregiver);
                caregiverService.deleteCaregiver(caregiverId);
                groupService.saveGroup(group);
            }
        }
        return "redirect:/group/" + groupId + "/caregivers";
    }

    @GetMapping("/group/{groupId}/caregiver/{caregiverId}/edit")
    public String editCaregiver(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId,
            Model model
    ) {
        Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
        Group group = groupService.getGroupById(groupId);

        model.addAttribute("caregiver", caregiver);
        model.addAttribute("group", group);

        return "edit-caregiver";
    }

    @PostMapping("/group/{groupId}/caregiver/{caregiverId}/update")
    public String updateCaregiver(
            @PathVariable("groupId") Long groupId,
            @PathVariable("caregiverId") Long caregiverId,
            @RequestParam("fname") String fname,
            @RequestParam("surname") String surname,
            @RequestParam("lastname") String lastname,
            @RequestParam("phone") double phone,
            @RequestParam("mail") String mail,
            @RequestParam("stage") double stage
    ) {
        Caregiver caregiver = caregiverService.getCaregiverById(caregiverId);
        if (caregiver != null) {
            caregiver.setFname(fname);
            caregiver.setSurname(surname);
            caregiver.setLastname(lastname);
            caregiver.setPhone(phone);
            caregiver.setMail(mail);
            caregiver.setStage(stage);
            caregiverService.saveCaregiver(caregiver);
        }
        return "redirect:/group/" + groupId + "/caregivers";
    }
}
