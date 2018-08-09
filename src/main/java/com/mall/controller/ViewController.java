package com.mall.controller;

import com.mall.pojo.Category;
import com.mall.pojo.User;
import com.mall.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

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


    @RequestMapping("registerCheck")
    public String registerCheck(Model model, User user) {

        String userName = user.getName();
        userName = HtmlUtils.htmlEscape(userName);

        boolean check = iUserService.checkUsername(userName);

        if (check){
            String message ="The username already exists!";
            model.addAttribute("message", message);
            model.addAttribute("user",null);

            return "view/registerPage";
        }

        // if the username can be use
        iUserService.add(user);

        return "redirect:registerFinishPage";

    }
}
