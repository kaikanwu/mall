package com.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class PageController {

    @RequestMapping("registerPage")
    public String registerPage(){
        return "view/registerPage";
    }

    @RequestMapping("registerFinishPage")
    public String registerSuccessPage(){
        return "view/registerFinishPage";
    }


    @RequestMapping("loginPage")
    public String loginPage(){
        return "view/loginPage";
    }

    @RequestMapping("payPage")
    public String payPage(){
        return "view/pay";
    }



}
