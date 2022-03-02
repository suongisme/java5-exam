package com.java5.exam.controller;

import com.java5.exam.constant.Constant;
import com.java5.exam.entity.Category;
import com.java5.exam.entity.Product;
import com.java5.exam.repository.ProductRepository;
import com.java5.exam.utils.FileUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.Objects;
import java.util.Optional;

@Controller
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductRepository productRepository;

    @GetMapping
    public String productView(Model model) {
        Object product = model.getAttribute("product");
        if (Objects.isNull(product)) {
            product = new Product();
        }
        model.addAttribute("listProduct", this.productRepository.findByAvailable(Constant.Product.AVAILABLE));
        model.addAttribute("product", product);
        return "product-view";
    }

    @GetMapping("/delete/{productId}")
    public String deleteCategory(@PathVariable Long productId, Model model) {
        Optional<Product> productOpt = this.productRepository.findById(productId);
        if (productOpt.isPresent()) {
            Product product = productOpt.get();
            product.setAvailable(Constant.Product.UNAVAILABLE);
            this.productRepository.save(product);
        }
        return "redirect:/products";
    }

    @GetMapping("/{productId}")
    public String findOne(@PathVariable Long productId, RedirectAttributes model) {
        model.addFlashAttribute("product", this.productRepository.findById(productId).orElse(new Product()));
        return "redirect:/products";
    }

    @PostMapping("/submit")
    public String addCategory(Product product, @RequestParam MultipartFile file, Model model) {
        String imageUrl = FileUtils.upload(file);
        if (Objects.nonNull(imageUrl)) {
            product.setImage(imageUrl);
        }
        product.setCreateDate(new Date());
        product.setAvailable(Constant.Product.AVAILABLE);
        this.productRepository.save(product);
        return "redirect:/products";
    }
}
