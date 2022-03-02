package com.java5.exam.repository;

import com.java5.exam.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByAvailable(Boolean available);
}
