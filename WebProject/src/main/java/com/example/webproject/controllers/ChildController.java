package com.example.webproject.controllers;


import com.example.webproject.models.Child;
import com.example.webproject.models.Group;
import com.example.webproject.services.ChildService;
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
public class ChildController {
    private final GroupService groupService;
    private final ChildService childService;

    @PostMapping("/group/{groupId}/child/create")
    public String createChild(
            @PathVariable("groupId") Long groupId,
            @RequestParam("fname") String fname,
            @RequestParam("surname") String surname,
            @RequestParam("lastname") String lastname,
            @RequestParam("age") double age
    ) {
        Group group = groupService.getGroupById(groupId);
        Child child = new Child();
        child.setFname(fname);
        child.setSurname(surname);
        child.setLastname(lastname);
        child.setAge(age);
        child.setGroup(group);
        childService.saveChild(child);
        return "redirect:/group/" + groupId;
    }

    @PostMapping("/group/{groupId}/child/{childId}/delete")
    public String deleteChild(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId
    ) {
        Group group = groupService.getGroupById(groupId);
        if (group != null) {
            Child child = childService.getChildById(childId);
            if (child != null && group.getChildren().contains(child)) {
                group.getChildren().remove(child);
                childService.deleteChild(childId);
                groupService.saveGroup(group);
            }
        }
        return "redirect:/group/" + groupId;
    }

    @GetMapping("/group/{groupId}/child/{childId}/edit")
    public String editChild(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId,
            Model model
    ) {
        Child child = childService.getChildById(childId);
        Group group = groupService.getGroupById(groupId);

        model.addAttribute("child", child);
        model.addAttribute("group", group);

        return "edit-child";
    }

    @PostMapping("/group/{groupId}/child/{childId}/update")
    public String updateChild(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId,
            @RequestParam("fname") String fname,
            @RequestParam("surname") String surname,
            @RequestParam("lastname") String lastname,
            @RequestParam("age") double age
    ) {
        Child child = childService.getChildById(childId);
        if (child != null) {
            child.setFname(fname);
            child.setSurname(surname);
            child.setLastname(lastname);
            child.setAge(age);
            childService.saveChild(child);
        }
        return "redirect:/group/" + groupId;
    }


}
