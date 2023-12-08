package com.example.webproject.services;


import com.example.webproject.models.Group;
import com.example.webproject.repositories.GroupRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class GroupService {
    private final GroupRepository groupRepository;

    public List<Group> listGroups(String title) {
        if (title != null) return groupRepository.findByTitle(title);
        return groupRepository.findAll();
    }

    public void saveGroup(Group group) {
        log.info("Saving new {}", group);
        groupRepository.save(group);
    }

    public void deleteGroup(Long id) {
        groupRepository.deleteById(id);
    }

    public Group getGroupById(Long id) {
        return groupRepository.findById(id).orElse(null);
    }
}
