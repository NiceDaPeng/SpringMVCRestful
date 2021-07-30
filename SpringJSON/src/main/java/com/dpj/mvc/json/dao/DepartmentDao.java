package com.dpj.mvc.json.dao;

import com.dpj.mvc.json.bean.Department;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Repository
public class DepartmentDao {

    private static Map<Integer, Department> deparments;
    private static Integer index = 2006;

    static {
        deparments = new HashMap<>();
        deparments.put(2001,new Department(2001,"后端开发"));
        deparments.put(2002,new Department(2002,"前端开发"));
        deparments.put(2003,new Department(2003,"商务部"));
        deparments.put(2004,new Department(2004,"营销部"));
        deparments.put(2005,new Department(2005,"财务部"));
    }

    //获取所有的部门信息
    public Collection<Department> getAllDept(){
        return deparments.values();
    }

    //添加部门信息
    public void addDept(Department department){
        deparments.put(index++,department);
    }

    //根据部门id获取部门信息
    public Department getDepartment(Integer did){
        return deparments.get(did);
    }
}
