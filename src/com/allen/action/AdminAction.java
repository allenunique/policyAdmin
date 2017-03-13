package com.allen.action;

import com.allen.entity.BigCenter;
import com.allen.entity.Center;
import com.allen.entity.Dept;
import com.allen.entity.telMessage.Person;
import com.allen.service.BigCenterService;
import com.allen.service.CenterService;
import com.allen.service.DeptService;

import com.allen.service.telMessage.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ad on 2017-03-02.
 *
 */
@Controller
@RequestMapping(value = "admin")
public class AdminAction {
    private BigCenterService bigCenterService;
    private CenterService centerService;
    private DeptService deptService;
    private PersonService personService;

    @Resource(name = "personService")
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @Resource(name = "bigCenterService")
    public void setBigCenterService(BigCenterService bigCenterService) {
        this.bigCenterService = bigCenterService;
    }

    @Resource(name = "centerService")
    public void setCenterService(CenterService centerService) {
        this.centerService = centerService;
    }

    @Resource(name = "deptService")
    public void setDeptService(DeptService deptService) {
        this.deptService = deptService;
    }


    @RequestMapping("queryCenters")
    public String queryCenters(String bigCenter, Model model) {
        if (bigCenter != null && !"".equals(bigCenter)) {
            List<Center> centers = centerService.getCentersByBigCenterName(bigCenter);
            for (Center center : centers) {
                center.setDepts(null);
            }
            model.addAttribute("centers", centers);
        }

        return "/admin/manageCenter.jsp";
    }

    @RequestMapping("viewCenter")
    public String queryCenter(int id, Model model) {
        Center center = centerService.findCenterById(id);
//        Set<Dept> depts = center.getDepts();
//        for (Dept dept : depts) {
//            System.out.println(dept.getDeptName());
//        }
        model.addAttribute("center", center);
        return "/admin/viewCenter.jsp";
    }

    @RequestMapping("updateCenter")
    public String updateCenter(int centerId,String centerName,Model model) {
        Center center = centerService.findCenterById(centerId);
        center.setCenterName(centerName);
        centerService.updateCenter(center);
        model.addAttribute("message", "更改中心名称成功");
        return "/public/info.jsp";
    }

    @RequestMapping("deleteCenter")
    public String DeleteCenter(int id,Model model) {
        try {
            centerService.deleteCenter(id); model.addAttribute("message", "删除成功");
        } catch (Exception e) {
            model.addAttribute("message", "删除失败，请确认该中心下没有部门。");
        }

        return "/public/info.jsp";
    }

    @RequestMapping("queryDepts")
    public String queryDepts(String center, Model model) {

        if (center != null && !"".equals(center)) {
            List<Dept> depts = deptService.getDeptsByCenterName(center);
            for (Dept dept : depts) {
                dept.setPersons(null);
            }
            model.addAttribute("depts", depts);
        }

        return "/admin/manageDept.jsp";
    }

    @RequestMapping("viewDept")
    public String queryDept(int id, Model model) {
        Dept dept = deptService.findDeptById(id);
//        Set<Person> persons = dept.getPersons();
//        for (Person person : persons) {
//            System.out.println(person.getName());
//        }
        model.addAttribute("dept", dept);
        return "/admin/viewDept.jsp";
    }

    @RequestMapping("updateDept")
    public String updateDept(int deptId,String deptName,Model model) {
        Dept dept = deptService.findDeptById(deptId);
        dept.setDeptName(deptName);
        deptService.updateDept(dept);
        model.addAttribute("message", "更改部门名称成功");
        return "/public/info.jsp";
    }

    @RequestMapping("deleteDept")
    public String DeleteDept(int id,Model model) {
        try {
            deptService.deleteDept(id);
            model.addAttribute("message", "删除成功");
        } catch (Exception e) {
            model.addAttribute("message", "删除失败，请确认该部门下没有员工。");
        }

        return "/public/info.jsp";
    }

    @RequestMapping("queryPersons")
    public String queryPersons(String dept, Model model) {

        if (dept != null && !"".equals(dept)) {
            List<Person> persons = personService.getPersonsByDeptName(dept);
            for (Person person : persons) {
                person.setDept(null);
            }
            model.addAttribute("persons", persons);
        }

        return "/admin/managePerson.jsp";
    }
    
    @RequestMapping("viewPerson")
    public String queryPerson(int id, Model model) {
        Person person = personService.findPersonById(id);
        person.setDept(null);
        model.addAttribute("person", person);
        return "/admin/viewPerson.jsp";
    }
    
    @RequestMapping("updatePerson")
    public String updatePerson(int personId,String name,String tel,String crm, Model model) {
        Person person = personService.findPersonById(personId);
        person.setName(name);
        person.setCrm(crm);
        person.setTel(tel);
        personService.updatePerson(person);
        model.addAttribute("message", "更改员工成功");
        return "/public/info.jsp";
    }
    
    @RequestMapping("deletePerson")
    public String DeletePerson(int id,Model model) {
        try {
            personService.deletePerson(id);
            model.addAttribute("message", "删除成功");
        } catch (Exception e) {
            model.addAttribute("message", "删除失败，请确认该员工没有电话记录。");
        }

        return "/public/info.jsp";
    }
    @RequestMapping("add")
    public String add(String judge,Model model) {
        switch (judge) {
            case "bigCenter":{
                model.addAttribute("judge","bigCenter");
                break;
            }
            case "center":{
                model.addAttribute("judge","center");
                break;
            } case "dept":{
                model.addAttribute("judge","dept");
                break;
            } case "person":{
                model.addAttribute("judge","person");
                break;
            }
        }
        return "/admin/viewAdd.jsp";
    }

    @RequestMapping("addBigCenter")
    public String addBigCenter(BigCenter bigCenter, Model model) {
        bigCenterService.addBigCenter(bigCenter);
        model.addAttribute("message", "添加大中心成功");
        return "/public/info.jsp";
    }

    @RequestMapping("addCenter")
    public String addCenter(@RequestParam(value = "bigCenter")String bigCenterName, String centerName, Model model) {
        BigCenter bigCenter = bigCenterService.findBigCenterByName(bigCenterName);
        Center center = new Center();
        center.setCenterName(centerName);
        center.setBigCenter(bigCenter);
        centerService.addCenter(center);
        model.addAttribute("message", "添加中心成功");
        return "/public/info.jsp";
    }

    @RequestMapping("addDept")
    public String addDept(@RequestParam(value = "center")String centerName,String deptName,Model model) {
        Center center = centerService.findCenterByName(centerName);
        Dept dept = new Dept();
        dept.setDeptName(deptName);
        dept.setCenter(center);
        model.addAttribute("message", "添加部门成功");
        return "/public/info.jsp";
    }

    @RequestMapping("addPerson")
    public String addPerson(@RequestParam(value = "dept")String deptName, Person person, Model model) {
        Dept dept = deptService.findDeptByName(deptName);
        person.setDept(dept);
        personService.addPerson(person);
        model.addAttribute("message", "添加员工成功");
        return "/public/info.jsp";
    }

    @RequestMapping("viewFile")
    public String viewFile(String judge, HttpSession session,Model model) {
        String directory = session.getServletContext().getRealPath("/")+judge;
        File root = new File(directory);
        File[] fs = root.listFiles();
        List<String> list = new ArrayList<>();
        for(int i=0; i<fs.length; i++){
            list.add(fs[i].getName());
        }
        model.addAttribute("fileList", list);
        model.addAttribute("judge", judge);
        return "/admin/showFile.jsp";
    }
    @RequestMapping("deleteFile")
    public String deleteFile(String judge,String fileName,HttpSession session,Model model) {
        String directory = session.getServletContext().getRealPath("/")+judge;
        File file = new File(directory + "/" + fileName);
        if (file.exists()){
            file.delete();
        }
        else {
            model.addAttribute("message", "文件不存在");
        }
        return "redirect:/admin/viewFile.action?judge="+judge;
    }
}
