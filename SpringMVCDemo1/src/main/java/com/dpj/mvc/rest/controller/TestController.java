package com.dpj.mvc.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping("/test")
    public String test01(){
        System.out.println("true = " + true);
        return "SUCCESS";
    }
}
