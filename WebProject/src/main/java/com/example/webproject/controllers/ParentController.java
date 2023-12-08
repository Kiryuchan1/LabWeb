package com.example.webproject.controllers;

import com.example.webproject.models.Child;
import com.example.webproject.models.Group;
import com.example.webproject.models.Parent;
import com.example.webproject.services.ChildService;
import com.example.webproject.services.GroupService;
import com.example.webproject.services.ParentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/group/{groupId}/child/{childId}/parent")
public class ParentController {
    private final GroupService groupService;
    private final ChildService childService;
    private final ParentService parentService;

    @GetMapping
    public String parents(@PathVariable("groupId") Long groupId, @PathVariable("childId") Long childId, Model model) {
        Group group = groupService.getGroupById(groupId);
        Child child = childService.getChildById(childId);
        model.addAttribute("group", group);
        model.addAttribute("child", child);
        model.addAttribute("parents", child.getParents());
        return "parents";
    }

    @GetMapping("/{parentId}/edit")
    public String editParent(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId,
            @PathVariable("parentId") Long parentId,
            Model model
    ) {
        Group group = groupService.getGroupById(groupId);
        Child child = childService.getChildById(childId);
        Parent parent = parentService.getParentById(parentId);
        model.addAttribute("group", group);
        model.addAttribute("child", child);
        model.addAttribute("parent", parent);
        return "edit-parent";
    }

    @PostMapping("/{parentId}/update")
    public String updateParent(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId,
            @PathVariable("parentId") Long parentId,
            @RequestParam("fname") String fname,
            @RequestParam("surname") String surname,
            @RequestParam("lastname") String lastname,
            @RequestParam("phone") double phone,
            @RequestParam("mail") String mail
    ) {
        Parent parent = parentService.getParentById(parentId);
        if (parent != null) {
            parent.setFname(fname);
            parent.setSurname(surname);
            parent.setLastname(lastname);
            parent.setPhone(phone);
            parent.setMail(mail);
            parentService.saveParent(parent);
        }
        return "redirect:/group/" + groupId + "/child/" + childId + "/parent";
    }

    @PostMapping("/{parentId}/delete")
    public String deleteParent(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId,
            @PathVariable("parentId") Long parentId
    ) {
        Child child = childService.getChildById(childId);
        if (child != null) {
            Parent parent = parentService.getParentById(parentId);
            if (parent != null && child.getParents().contains(parent)) {
                child.getParents().remove(parent);
                parentService.deleteParent(parentId);
                childService.saveChild(child);
            }
        }
        return "redirect:/group/" + groupId + "/child/" + childId + "/parent";
    }

    @PostMapping("/create")
    public String createParent(
            @PathVariable("groupId") Long groupId,
            @PathVariable("childId") Long childId,
            @RequestParam("fname") String fname,
            @RequestParam("surname") String surname,
            @RequestParam("lastname") String lastname,
            @RequestParam("phone") double phone,
            @RequestParam("mail") String mail
    ) {
        Child child = childService.getChildById(childId);
        Parent parent = new Parent();
        parent.setFname(fname);
        parent.setSurname(surname);
        parent.setLastname(lastname);
        parent.setPhone(phone);
        parent.setMail(mail);
        parent.setChild(child);
        parentService.saveParent(parent);

        return "redirect:/group/" + groupId + "/child/" + childId + "/parent";
    }

}
