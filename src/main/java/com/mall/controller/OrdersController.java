package com.mall.controller;


import com.mall.pojo.Orders;
import com.mall.service.IOrderItemService;
import com.mall.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class OrdersController {

    @Autowired
    IOrdersService iOrdersService;

    @Autowired
    IOrderItemService iOrderItemService;

    @RequestMapping("ordersList")
    public String list(Model model) {
        List<Orders> ordersList = iOrdersService.list();
        iOrderItemService.fill(ordersList);

        model.addAttribute("ordersList", ordersList);
        return "manage/ordersList";
    }


}
