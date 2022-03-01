package com.java5.exam.repository;

import com.java5.exam.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepostory extends JpaRepository<Category, String> {
}
