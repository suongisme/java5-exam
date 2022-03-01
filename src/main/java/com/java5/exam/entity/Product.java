package com.java5.exam.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "available")
    private Boolean available;

    @Column(name = "createDate")
    private Date createDate;

    @Column(name = "image")
    private String image;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private Float price;

    @ManyToOne(targetEntity = Category.class)
    private Category category;
}
