package com.java5.exam.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Categories")
public class Category {

    @Id
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(targetEntity = Product.class, mappedBy = "category")
    private List<Product> products;
}
