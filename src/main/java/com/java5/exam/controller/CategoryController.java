package com.java5.exam.controller;

import com.java5.exam.entity.Category;
import com.java5.exam.repository.CategoryRepostory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/categories")
public class CategoryController {

    private final CategoryRepostory categoryRepostory;

    @GetMapping
    public String categoryView(Model model) {
        Object category = model.getAttribute("category");
        if (Objects.isNull(category)) {
            category = new Category();
        }
        model.addAttribute("listCategory", this.categoryRepostory.findAll());
        model.addAttribute("category", category);
        return "category-view";
    }

    @GetMapping("/delete/{categoryId}")
    public String deleteCategory(@PathVariable String categoryId, Model model) {
        this.categoryRepostory.deleteById(categoryId);
        return "redirect:/categories";
    }

    @GetMapping("/{categoryId}")
    public String findOne(@PathVariable String categoryId, RedirectAttributes model) {
        model.addFlashAttribute("category", this.categoryRepostory.findById(categoryId).orElse(new Category()));
        return "redirect:/categories";
    }

    @PostMapping("/submit")
    public String addCategory(Category category, Model model) {
        Category saved = this.categoryRepostory.save(category);
        return "redirect:/categories";
    }
}
