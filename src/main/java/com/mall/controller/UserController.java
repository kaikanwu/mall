package com.mall.controller;

import com.mall.pojo.User;
import com.mall.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class UserController {

    @Autowired
    IUserService iUserService;


    @RequestMapping("userList")
    public String list(Model model) {
        List<User> userList = iUserService.list();
        model.addAttribute("userList", userList);

        return "manage/userList";

    }


}
