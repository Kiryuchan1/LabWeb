package com.example.webproject.repositories;

import com.example.webproject.models.Group;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group, Long> {
    List<Group> findByTitle(String title);
}
