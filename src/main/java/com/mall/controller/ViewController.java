package com.mall.controller;

import com.mall.pojo.*;
import com.mall.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
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



    @RequestMapping("loginCheck")
    public String loginCheck(Model model, HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password){
        username = HtmlUtils.htmlEscape(username);
        User user = iUserService.checkLogin(username, password);

        if (user == null) {
            model.addAttribute("message", "wrong username/password");
            return  "view/loginPage";
        }
        session.setAttribute("user", user);

        return "redirect:homepage";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:homepage";
    }


    @RequestMapping("viewProduct")
    public String viewProduct(Model model, int pid) {
        Product product = iProductService.getProduct(pid);

        List<ProductImage> firstProductImage = iProductImageService.list(product.getId(), IProductImageService.firstImage );
        List<ProductImage> detailProductImage = iProductImageService.list(product.getId(), IProductImageService.detailImage );

        product.setFirstProductImageList(firstProductImage);
        product.setDetailProductImageList(detailProductImage);

        model.addAttribute("product", product);

        return "view/productPage";


    }



    @RequestMapping("buyProduct")
    public String buyProduct(HttpSession session, int pid, int number){
        Product product = iProductService.getProduct(pid);

        int orderItemId = 0;

        User user = (User)session.getAttribute("user");
        boolean found =false;
        List<OrderItem> orderItemList = iOrderItemService.listByUser(user.getId());

        for (OrderItem orderItem : orderItemList) {

            if (orderItem.getProduct().getId().intValue() == product.getId().intValue()){
                orderItem.setNumber(orderItem.getNumber() + number);
                iOrderItemService.update(orderItem);
                found = true;
                orderItemId = orderItem.getId();
                break;
            }
        }

        if (!found) {
            OrderItem orderItem = new OrderItem();
            orderItem.setUid(user.getId());
            orderItem.setNumber(number);
            orderItem.setPid(pid);
            iOrderItemService.add(orderItem);
            orderItemId = orderItem.getId();

        }

        return "redirect:viewBuy?orderItemId=" + orderItemId;


    }







}
