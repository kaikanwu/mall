package com.mall.controller;

import com.mall.pojo.Category;
import com.mall.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class ViewController {
    @Autowired
    ICategoryService iCategoryService;

    @Autowired
    IProductService iProductService;
    @Autowired
    IUserService iUserService;
    @Autowired
    IProductImageService iProductImageService;

    @Autowired
    IOrdersService iOrdersService;
    @Autowired
    IOrderItemService iOrderItemService;


    @RequestMapping("homepage")
    public String homePage(Model model) {

        List<Category> categoryList =iCategoryService.list();

        iProductService.fill(categoryList);

        model.addAttribute("categoryList", categoryList);

        return "view/homePage";
    }
}
