package com.example.webproject.controllers;


import com.example.webproject.models.Group;
import com.example.webproject.services.GroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class GroupController {
    private final GroupService groupService;

    @GetMapping("/")
    public String groups(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("groups", groupService.listGroups(title));
        return "groups";
    }

    @GetMapping("/group/{groupId}")
    public String groupInfo(@PathVariable("groupId") Long groupId, Model model) {
        Group group = groupService.getGroupById(groupId);
        model.addAttribute("group", group);
        model.addAttribute("children", group.getChildren());
        return "group-info";
    }

    @GetMapping("/group/{groupId}/caregivers")  // Updated URL to be distinct
    public String caregiverInfo(@PathVariable("groupId") Long groupId, Model model) {
        Group group = groupService.getGroupById(groupId);
        model.addAttribute("group", group);
        model.addAttribute("caregivers", group.getCaregivers());
        return "caregiver-info";
    }

    @PostMapping("/group/create")
    public String createGroup(Group group) {
        groupService.saveGroup(group);
        return "redirect:/";
    }

    @PostMapping("/group/delete/{groupId}")
    public String deleteGroup(@PathVariable("groupId") Long groupId) {
        groupService.deleteGroup(groupId);
        return "redirect:/";
    }

    @GetMapping("/group/edit/{groupId}")
    public String editGroup(@PathVariable("groupId") Long groupId, Model model) {
        Group group = groupService.getGroupById(groupId);
        model.addAttribute("group", group);
        return "edit-group";
    }

    @PostMapping("/group/update/{groupId}")
    public String updateGroup(@PathVariable("groupId") Long groupId, Group updatedGroup) {
        Group existingGroup = groupService.getGroupById(groupId);
        if (existingGroup != null) {
            existingGroup.setTitle(updatedGroup.getTitle());
            groupService.saveGroup(existingGroup);
        }
        return "redirect:/";
    }

}
