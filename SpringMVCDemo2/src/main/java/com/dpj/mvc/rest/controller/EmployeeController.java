package com.dpj.mvc.rest.controller;


import com.dpj.mvc.rest.bean.Department;
import com.dpj.mvc.rest.bean.Employee;
import com.dpj.mvc.rest.dao.DepartmentDao;
import com.dpj.mvc.rest.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    @RequestMapping("/emps")
    public String showAll(Map<String,Object> map){

        Collection<Employee> emps = employeeDao.getAll();
        System.out.println(emps);
        map.put("emps",emps);
        return "list";
    }

    @RequestMapping(value = "/emp",method = RequestMethod.GET)
    public String add( Map<String,Object> map){
        Collection<Department> allDept = departmentDao.getAllDept();
        //创建存储性别gender的信息
        Map<String,String> genders = new HashMap<>();
        genders.put("0","女");
        genders.put("1","男");
//        System.out.println(allDept);
        map.put("allDept",allDept);
        map.put("genders",genders);
        return "add";
    }

    @RequestMapping(value = "/addEmployee",method = RequestMethod.POST)
    public String addEmployee(Employee employee){
//        System.out.println(employee);
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    @RequestMapping(value = "/emp/{eid}",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("eid")Integer eid,Map<String,Object> map){
        //需要获取要修改的员工信息
        Employee emp = employeeDao.get(eid);
        map.put("emp",emp);
        //获取所有的部门信息供用户选择
        Collection<Department> depts = departmentDao.getAllDept();
        map.put("depts",depts);
        return "update";
    }
//执行修改操作
    @RequestMapping(value = "/emp",method = RequestMethod.PUT)
    public String updateEmp(Employee employee){
        System.out.println("现在是PUT修改操作");
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    //执行删除操作
    @RequestMapping(value = "/emp/{eid}",method = RequestMethod.DELETE)
    public String deleteEmp(@PathVariable("eid")Integer eid){
        employeeDao.delete(eid);
        return "redirect:/emps";
    }
}
