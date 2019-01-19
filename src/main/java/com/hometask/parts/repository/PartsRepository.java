package com.hometask.parts.repository;

import com.hometask.parts.models.Part;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PartsRepository extends JpaRepository<Part, Integer> {
   List<Part> findPartsByNeedTrueOrderById();
   Part findPartByName(String name);
   Part findPartById(int id);

    @Override
    Page<Part> findAll(Pageable pageable);

    Page<Part> findPartsByNeedTrueOrderById(Pageable pageable);

    Page<Part> findPartsByNeedFalseOrderById(Pageable pageable);
}
