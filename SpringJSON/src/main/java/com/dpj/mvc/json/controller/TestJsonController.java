package com.dpj.mvc.json.controller;

import com.dpj.mvc.json.bean.Employee;
import com.dpj.mvc.json.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
public class TestJsonController {

    @Autowired
    private EmployeeDao dao;

    @RequestMapping("/testJson")
    @ResponseBody
    public Collection<Employee> testJson(){
        Collection<Employee> emps = dao.getAll();
        return emps;
    }
}
