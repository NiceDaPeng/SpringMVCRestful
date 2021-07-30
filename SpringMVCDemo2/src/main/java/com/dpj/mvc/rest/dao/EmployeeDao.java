package com.dpj.mvc.rest.dao;

import com.dpj.mvc.rest.bean.Department;
import com.dpj.mvc.rest.bean.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Repository
public class EmployeeDao {

    @Autowired
    private DepartmentDao departmentDao;

    private static Map<Integer,Employee> employees;
    static {
        employees = new HashMap<>();
        employees.put(1001,new Employee(1001,"vikk","1001@qq.com",1,new Department(2001,"后端开发")));
        employees.put(1002,new Employee(1002,"vikk","1002@qq.com",0,new Department(2002,"前端开发")));
        employees.put(1003,new Employee(1003,"vikk","1003@qq.com",1,new Department(2003,"商务部")));
        employees.put(1004,new Employee(1004,"vikk","1004@qq.com",0,new Department(2004,"营销部")));
        employees.put(1005,new Employee(1005,"vikk","1005@qq.com",1,new Department(2005,"财务部")));
    }

    //设计一个方法用来获取所有的员工信息
    public Collection<Employee> getAll(){
        return employees.values();
    }

    //设计一个方法用来添加员工信息

    /**
     * 添加员工信息
     * @param employee
     * @return  添加成功返回true,否则返回false
     */
    private static Integer index = 1006;
    public void save(Employee employee){
//如果你穿过来的信息不包含ID，那么就按照index++来为id赋值
        if (employee.getEid() == null){
            employee.setEid(index++);
        }

        employee.setDepartment(departmentDao.getDepartment(employee.getDepartment().getDid()));
        employees.put(employee.getEid(),employee);
    }

    //根据id获取员工信息
    public Employee get(Integer eid){
        return employees.get(eid);
    }

    //根据id删除信息
    public void delete(Integer eid){
        employees.remove(eid);
    }

    //根据ID修改员工信息
}
