package com.mall.controller;

import com.mall.pojo.Category;
import com.mall.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    private ICategoryService iCategoryService;

    @RequestMapping("list")
    public String list(Model model) {
        List<Category> categoryList = iCategoryService.list();
        model.addAttribute("categoryList", categoryList);
        return "manage/categoryList";
    }

}
