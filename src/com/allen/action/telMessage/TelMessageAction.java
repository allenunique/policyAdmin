package com.allen.action.telMessage;

import com.allen.entity.Center;
import com.allen.entity.Dept;
import com.allen.entity.telMessage.TelMessage;
import com.allen.interceptor.Token;
import com.allen.service.CenterService;
import com.allen.service.DeptService;
import com.allen.service.telMessage.TelMessageService;
import com.allen.util.Conditions;
import com.allen.util.ExcelRunnable;
import com.allen.util.PageBean;
import com.allen.util.ReadinExcel;
import com.allen.util.Time;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by Allen on 2017/2/26.
 */
@Controller
@RequestMapping(value = "telMessage")
public class TelMessageAction {
    private TelMessageService telMessageService;
    private DeptService deptService;
    private CenterService centerService;
    @Resource(name = "centerService")
    public void setCenterService(CenterService centerService) {
        this.centerService = centerService;
    }

    @Resource(name = "deptService")
    public void setDeptService(DeptService deptService) {
        this.deptService = deptService;
    }

    @Resource(name = "telMessageService")
    public void setTelMessageService(TelMessageService telMessageService) {
        this.telMessageService = telMessageService;
    }

    @RequestMapping(value = "showTelMessage")
    public String showTelMessage(Conditions conditions, String currentPage, HttpSession session,Model model) {
        if(currentPage == null || "".equals(currentPage.trim())){
            currentPage = "1";
        }else{
            conditions = (Conditions) session.getAttribute("conditions");
        }
        int currPage = Integer.parseInt(currentPage);
        PageBean<TelMessage> pageBeanTelmessage = new PageBean<>();
        pageBeanTelmessage.setCurrentPage(currPage);
        telMessageService.pageTelMessageByConditions(pageBeanTelmessage, conditions);
        model.addAttribute("pageBean", pageBeanTelmessage);
        session.setAttribute("conditions",conditions);
//System.out.println(conditions);
        return "/telMessage/showTelMessage.jsp";
    }

    @RequestMapping("exportTelMessage")
    public String Export2Excel(HttpSession session,Model model) {
        Conditions conditions = (Conditions) session.getAttribute("conditions");
        String directory = session.getServletContext().getRealPath("/") + "download";
        String fileName;
        if (conditions.getStartTime() != null && !"".equals(conditions.getStartTime()) &&
                conditions.getEndTime() != null && !"".equals(conditions.getEndTime()) ) {
            if(conditions.getStartTime().equals(conditions.getEndTime())){
                fileName = "Export_File" + conditions.getStartTime();
            }else {
                fileName = "Export_File" + conditions.getStartTime() + "_" + conditions.getEndTime() ;
            }
        }else {
            fileName = "Export_File_ALL";
        }

//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd_hhmmss");
//        String fileName = "Export_File" + "_" + simpleDateFormat.format(new Date());
        List<TelMessage> telMessages = telMessageService.getTelMessageByConditions(conditions);
        List<List<Object>> deptTelMessage = new LinkedList<>();
        List<List<Object>> centerTelMessage = new LinkedList<>();
        ExcelRunnable excelRunnable = null;
        if (conditions.getDept() != null && !"".equals(conditions.getDept())) {

            List<Object> countTelMessageByDept = countTelMessageByDeptName(conditions.getDept(), telMessages);
            deptTelMessage.add(countTelMessageByDept);
            excelRunnable = new ExcelRunnable(telMessages, deptTelMessage, directory, fileName, true);
        }else if(conditions.getCenter()!= null && !"".equals(conditions.getCenter())){
            List<Dept> depts = deptService.getDeptsByCenterName(conditions.getCenter());
            for (Dept dept : depts) {
                List<Object> object = countTelMessageByDeptName(dept.getDeptName(),telMessages);
                deptTelMessage.add(object);
//                System.out.println(dept.getDeptName());
            }
            centerTelMessage.add(countTelMessageByDeptTelMessage(conditions.getCenter(), deptTelMessage));

            excelRunnable = new ExcelRunnable(telMessages, deptTelMessage,centerTelMessage, directory, fileName, true);

        }else if(conditions.getBigCenter()!=null && !"".equals(conditions.getBigCenter())){
            List<Center> centers = centerService.getCentersByBigCenterName(conditions.getBigCenter());
            for (Center center : centers) {
                List<Dept> depts = deptService.getDeptsByCenterName(center.getCenterName());
                List<List<Object>> listT = new LinkedList<>();
                for (Dept dept : depts) {
                    List<Object> object = countTelMessageByDeptName(dept.getDeptName(),telMessages);
                    listT.add(object);
                    deptTelMessage.add(object);
                }

                centerTelMessage.add(countTelMessageByDeptTelMessage(center.getCenterName(), listT));
            }
            excelRunnable = new ExcelRunnable(telMessages, deptTelMessage,centerTelMessage, directory, fileName, true);
        }
        Thread threads = new Thread(excelRunnable);
        threads.start();
        model.addAttribute("message", "正在导出，请稍后到下载中心下载");
        return "/public/info.jsp";
    }

    public List<Object> countTelMessageByDeptTelMessage(String centerName,List<List<Object>> deptTelMessage) {
        List<Object> list = new ArrayList<>();
        int countAll = 0;
        Time allTime = new Time();
        int countOutAll = 0;
        Time outAllTime = new Time();
        int count_1out = 0;
        Time _1outTime = new Time();
        int count$1out = 0;
        Time $1outTime = new Time();
        int count$3out = 0;
        Time $3outTime = new Time();
        int countInAll = 0;
        Time inAllTime = new Time();
        int count_1in = 0;
        Time _1inTime = new Time();
        int count$1in = 0;
        Time $1inTime = new Time();
        int count$3in = 0;
        Time $3inTime = new Time();
        int count = 0;
        list.add(centerName);
        list.add(count);
        list.add(countAll);
        list.add(allTime);

        list.add(countOutAll);
        list.add(outAllTime);
        list.add(count_1out);
        list.add(_1outTime);
        list.add(count$1out);
        list.add($1outTime);
        list.add(count$3out);
        list.add($3outTime);

        list.add(countInAll);
        list.add(inAllTime);
        list.add(count_1in);
        list.add(_1inTime );
        list.add(count$1in);
        list.add($1inTime );
        list.add(count$3in);
        list.add($3inTime );

        for (List<Object> objectList : deptTelMessage) {
            int i = 0;
            for (Object object : objectList) {
                if(object instanceof Integer ){
                    int j = (int) list.get(i);
                    j+=(int)object;
                    list.set(i, j);
                } else if (object instanceof Time) {
                    Time time = (Time)list.get(i);
                    time = time.addTime((Time) object);
                    list.set(i, time);
                }
                i++;
            }
        }
    return list;
    }

    public List<Object> countTelMessageByDeptName (String deptName,List<TelMessage> telMessages){
        List<Object> list = new LinkedList<>();

        int countAll = 0;
        Time allTime = new Time();
        int countOutAll = 0;
        Time outAllTime = new Time();
        int count_1out = 0;
        Time _1outTime = new Time();
        int count$1out = 0;
        Time $1outTime = new Time();
        int count$3out = 0;
        Time $3outTime = new Time();
        int countInAll = 0;
        Time inAllTime = new Time();
        int count_1in = 0;
        Time _1inTime = new Time();
        int count$1in = 0;
        Time $1inTime = new Time();
        int count$3in = 0;
        Time $3inTime = new Time();
        int count = 0;

        for(TelMessage telMessage:telMessages){
            if (telMessage.getPerson().getDept().getDeptName().equals(deptName)) {
                count++;
                countAll = countAll + telMessage.getCountAll();
                allTime = allTime.addTime(new Time(telMessage.getAllTime()));
                countOutAll = countOutAll + telMessage.getCountOutAll();
                outAllTime = outAllTime.addTime(new Time(telMessage.getOutAllTime()));
                count_1out = count_1out + telMessage.getCount_1out();
                _1outTime = _1outTime.addTime(new Time(telMessage.get_1outTime()));
                count$1out = count$1out + telMessage.getCount$1out();
                $1outTime = $1outTime.addTime(new Time(telMessage.get$1outTime()));
                count$3out = count$3out + telMessage.getCount$3out();
                $3outTime = $3outTime.addTime(new Time(telMessage.get$3outTime()));
                
                countInAll = countInAll + telMessage.getCountInAll();
                inAllTime = inAllTime.addTime(new Time(telMessage.getInAllTime()));
                count_1in = count_1in + telMessage.getCount_1in();
                _1inTime = _1inTime.addTime(new Time(telMessage.get_1inTime()));
                count$1in = count$1in + telMessage.getCount$1in();
                $1inTime = $1inTime.addTime(new Time(telMessage.get$1inTime()));
                count$3in = count$3in + telMessage.getCount$3in();
                $3inTime = $3inTime.addTime(new Time(telMessage.get$3inTime()));

            }
        }

        list.add(deptName);
        list.add(count);
        list.add(countAll);
        list.add(allTime);

        list.add(countOutAll);
        list.add(outAllTime);
        list.add(count_1out);
        list.add(_1outTime);
        list.add(count$1out);
        list.add($1outTime);
        list.add(count$3out);
        list.add($3outTime);

        list.add(countInAll);
        list.add(inAllTime);
        list.add(count_1in);
        list.add(_1inTime );
        list.add(count$1in);
        list.add($1inTime );
        list.add(count$3in);
        list.add($3inTime );
        return list;
    }

    @RequestMapping("showUpload")
    public String showUpload() {
        return "/telMessage/uploadFile.jsp";
    }

    @SuppressWarnings("SpringMVCViewInspection")
    @RequestMapping("Import")
    public String inportData(HttpSession session, @RequestParam(value="filename")MultipartFile multipart) {
        ReadinExcel<TelMessage> excelReader;
        List<TelMessage> uploadAndRead=null;
        boolean judgement = false;
        String Msg = "";
        String error = "";
        String formart = "yyyy-MM-dd";
        String path = session.getServletContext().getRealPath("/")+"upload";

        int sheetIndex = 0;
        Map<String, String> titleAndAttribute;
        Class<TelMessage> clazz=TelMessage.class;
        titleAndAttribute=new HashMap<>();
        titleAndAttribute.put("号码","telNum");//
        titleAndAttribute.put("总量","countAll");//
        titleAndAttribute.put("总时长","allTime");//
        titleAndAttribute.put("呼出总量","countOutAll");//
        titleAndAttribute.put("呼出总时长","outAllTime");//
        titleAndAttribute.put("<1min呼出量","count_1out");//
        titleAndAttribute.put("<1min呼出时长","_1outTime");//
        titleAndAttribute.put(">1min呼出量","count$1out");//
        titleAndAttribute.put(">1min呼出时长","$1outTime");//
        titleAndAttribute.put(">3min呼出量","count$3out");//
        titleAndAttribute.put(">3min呼出时长","$3outTime");//
        titleAndAttribute.put("呼入总量","countInAll");//
        titleAndAttribute.put("呼入总时长","inAllTime");//
        titleAndAttribute.put("<1min呼入量","count_1in");//
        titleAndAttribute.put("<1min呼入时长","_1inTime");//
        titleAndAttribute.put(">1min呼入量","count$1in");//
        titleAndAttribute.put(">1min呼入时长","$1inTime");//
        titleAndAttribute.put(">3min呼入量","count$3in");//
        titleAndAttribute.put(">3min呼入时长","$3inTime");
        titleAndAttribute.put("日期","date");//
        excelReader=new ReadinExcel<>(formart);
        try {
            uploadAndRead = excelReader.uploadAndRead(multipart,path, sheetIndex, titleAndAttribute, clazz);
            for (TelMessage telMessage : uploadAndRead) {
                System.out.println(telMessage);
            }
        } catch (Exception e) {
            error = "出现错误：  311：uploadAndRead = excelReader.uploadAndRead(multipart,path, sheetIndex, titleAndAttribute, clazz)";
            e.printStackTrace();
        }
        if(uploadAndRead != null && !"[]".equals(uploadAndRead.toString()) && uploadAndRead.size()>=1){
            judgement = true;
        }
        if(judgement){

            //把客户信息分为没100条数据为一组迭代添加客户信息（注：将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
            //int count=0;
            int listSize=uploadAndRead.size();
            int toIndex=100;
            for (int i = 0; i < listSize; i+=100) {
                if(i+100>listSize){
                    toIndex=listSize-i;
                }
                List<TelMessage> subList = uploadAndRead.subList(i, i+toIndex);
                telMessageService.addTelMessageByList(subList);
                /*
                 * 测试数据：
                     count=count+subList.size();
                    System.out.println("subList长度："+subList.size()+"\t总长度："+count);
                 *
                     for (UserJHDX userJHDX : subList) {
                        System.out.println("手机号："+userJHDX.getPhone()+"截止日期:"+userJHDX.getUptodate()+"流量值"+userJHDX.getFlux()+"总次数"+userJHDX.getTotal());
                    }
                 */

                /** 此处执行集合添加 */

            }
            Msg ="批量导入EXCEL成功！";
        }else{
            Msg ="批量导入EXCEL失败！";
        }
        if(!"".equals(error)){
            Msg =  "{ error:'" + error + "', msg:'" + Msg + "'}";
        }
        session.setAttribute("msg", Msg);
        return "/telMessage/uploadFile.jsp";
    }


}
