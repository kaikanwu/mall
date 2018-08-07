package com.mall.controller;


import com.mall.pojo.Category;
import com.mall.pojo.Product;
import com.mall.service.ICategoryService;
import com.mall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class ProductController {
    @Autowired
    ICategoryService iCategoryService;
    @Autowired
    IProductService iProductService;


    @RequestMapping("addProduct")
    public String addProduct(Product product) {
        product.setCreateDate(new Date());
        iProductService.addProduct(product);
        return "redirect:productList?cid=" + product.getCid();
    }


    @RequestMapping("deleteProduct")
    public String deleteProduct(int id) {
        Product product = iProductService.getProduct(id);
        iProductService.deleteProduct(id);
        return "redirect:productList?cid=" + product.getCid();
    }

    @RequestMapping("editProduct")
    public String editProduct(int id, Model model) {
        Product product = iProductService.getProduct(id);
        Category category = iCategoryService.editCategory(product.getCid());
        product.setCategory(category);
        model.addAttribute("product", product);
        return "manage/editProduct";

    }

    @RequestMapping("updateProduct")
    public String updateProduct(Product product) {
        iProductService.updateProduct(product);
        return "redirect:productList?cid=" + product.getCid();
    }


    @RequestMapping("productList")
    public String list(int cid, Model model){
        Category category = iCategoryService.editCategory(cid);
        List<Product> productList = iProductService.list(cid);

        model.addAttribute("productList", productList);
        model.addAttribute("category", category);

        return "manage/productList";

    }
}
