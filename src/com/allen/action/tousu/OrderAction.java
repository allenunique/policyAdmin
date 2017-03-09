package com.allen.action.tousu;


import com.allen.entity.User;
import com.allen.entity.tousu.Order;
import com.allen.entity.tousu.OrderMessage1;
import com.allen.entity.tousu.OrderMessage2;
import com.allen.interceptor.Token;
import com.allen.service.UserService;
import com.allen.service.tousu.OrderService;
import com.allen.util.Conditions;
import com.allen.util.ExportRunnable;
import com.allen.util.PageBean;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

/**
 * Created by ad on 2017-02-15.
 *
 */
@Controller
@RequestMapping(value="/order")
public class OrderAction {

    private OrderService orderService;
    private UserService userService;
    @Resource(name = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource(name = "orderService")
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
    static Properties classify;
    static{
        InputStream inputStream1 = OrderAction.class.getResourceAsStream("/classify.properties");
        classify = new Properties();
        try {
            InputStreamReader ir1 = new InputStreamReader(inputStream1, "UTF-8");
            classify.load(ir1);
            inputStream1.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }

    @RequestMapping("/addTask")
    public String addTask() {
        return "/tousu/Npc/addTask.jsp";
    }

    @RequestMapping("/insertOrder")
    public String insertOrder(OrderMessage1 orderMessage1, String classify_onet, String classify_twot,
                              String timeAll, Model model){
        if (classify_onet != null && classify_twot != null) {
            String classify_one = classify.getProperty(classify_onet);
            String classify_two = classify.getProperty(classify_twot);
            orderMessage1.setClassify_one(classify_one);
            orderMessage1.setClassify_two(classify_two);
        }

        User user = userService.findUserByDeptName(orderMessage1.getUser().getDept().getDeptName());
        orderMessage1.setUser(user);
        OrderMessage2 orderMessage2 = new OrderMessage2();
        orderMessage2.setTimeAll(Integer.parseInt(timeAll));
        orderService.createOrder(orderMessage1,orderMessage2);
        model.addAttribute("message", "添加成功");
        return "/public/info.jsp";
    }

//    @RequestMapping("/showTasks")
//    public String pageAllOrder(String currentPage,Model model){
//        if(currentPage == null || "".equals(currentPage.trim())){
//            currentPage = "1";
//        }
//        int currPage = Integer.parseInt(currentPage);
//        PageBean<Order> pageBeanOrder = new PageBean<>();
//        pageBeanOrder.setCurrentPage(currPage);
//        orderService.pageAllOrder(pageBeanOrder);
//        model.addAttribute("pageBean",pageBeanOrder);
//        return "/public/showTasks.jsp";
//    }

    @RequestMapping("/searchTasks")
    public String searchTasks(String currentPage, Conditions conditions, Model model, HttpSession session){


        if(currentPage == null || "".equals(currentPage.trim())){
            currentPage = "1";

        }else{
            conditions = (Conditions) session.getAttribute("conditions");
        }
        int currPage = Integer.parseInt(currentPage);
        PageBean<Order> pageBeanOrder = new PageBean<>();
        pageBeanOrder.setCurrentPage(currPage);
        orderService.pageOrderByCondition(pageBeanOrder,conditions,false);

        model.addAttribute("pageBean",pageBeanOrder);
        session.setAttribute("conditions",conditions);
        User user = (User) session.getAttribute("user");
        if("Tasker".equals(user.getType()))
        return "/tousu/tasker/showTasks.jsp";
        else
        return "/tousu/Npc/showTasks.jsp";
    }

    @RequestMapping("/showDetail")
    public String showDetail(int id ,Model model) {
        Order order = orderService.findById(id);
        model.addAttribute("order", order);
        return "/public/taskDetail.jsp";
    }

    @RequestMapping("/deleteTask")
    public String deleteTasks(int id, String currentPage) {
        orderService.deleteOrder(id);
//        return "/public/info.jsp";
        return "redirect:/NpcOrder/searchTasks.action?currentPage="+currentPage;
    }

    @RequestMapping("/republishTasks")
    public String republishTasks(int id, Model model) {
        Order order = orderService.findById(id);
        model.addAttribute("order", order);
        orderService.updateStatus(id,21);
        return "/Npc/addTask.jsp";
    }

    @RequestMapping("/viewDealTask")
    public String viewDealTask(int id, Model model) {
        Order order = orderService.findById(id);
        model.addAttribute("order", order);
        return "/public/viewDealTask.jsp";
    }

    @RequestMapping("/dealTask")
    public String dealTask(int id,Order order, Model model) {
        Order order_t = orderService.findById(id);
        if(order_t.getStatus()==2){
            String realReason1 = classify.getProperty(order.getOrderMessage3().getRealReason1());
            order.getOrderMessage3().setRealReason1(realReason1);
            order_t.setOrderMessage3(order.getOrderMessage3());
            order_t.setStatus(1);
        }
        if(order_t.getStatus()==0){
            order_t.setOrderMessage2(order.getOrderMessage2());
            order_t.setStatus(2);
        }
        orderService.updateOrder(order_t);
        model.addAttribute("message", "处理成功");
        return "/public/info.jsp";
    }

    @RequestMapping("/exportData")
    public String exportData(HttpSession session,Model model){
        Conditions conditions = (Conditions) session.getAttribute("conditions");
        List<Order> orderList = orderService.getExportData(conditions, true);
        System.out.println(orderList.size());



//		String directory = "C:/download";
//		String directory = request.getContextPath()+"/download";
//        String directory = this.getServletConfig().getServletContext().getRealPath("/")+"download";
        String directory = session.getServletContext().getRealPath("/")+"download";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd_hhmmss");
        String fileName = "Export_File"+"_"+simpleDateFormat.format(new Date());
        String sheetTitle = "";
        List<List<Object>> objects;
        boolean append = false;
        String sheetName = "sheet1";
        List<String> columnNames = new LinkedList<>();

        columnNames.add("受理时间");
        columnNames.add("流转渠道");
        columnNames.add("流转类别");
        columnNames.add("高危选项");
        columnNames.add("一级分类");
        columnNames.add("二级分类");
        columnNames.add("三级分类");
        columnNames.add("客户用户名");
        columnNames.add("投诉人");
        columnNames.add("联系方式");
        columnNames.add("事件详情");
        columnNames.add("父用户");
        columnNames.add("首次联系情况");
        columnNames.add("被投诉人");
        columnNames.add("大中心	");
        columnNames.add("中心");
        columnNames.add("部门");

        columnNames.add("处理人");
        columnNames.add("事件结果");

        columnNames.add("投诉回访确认");
        columnNames.add("问题是否关闭");
        columnNames.add("实际投诉原因的一级分类");
        columnNames.add("实际投诉原因的二级分类");
        columnNames.add("有理判定");
        columnNames.add("有理级别");
        columnNames.add("是否重复");
        columnNames.add("是否为总部回访");
        columnNames.add("记录人");
        objects =  new LinkedList<>();
        for(Order order:orderList){
            List<Object> Data = new LinkedList<>();
            Data.add(order.getOrderMessage1().getCreateOrderTime());	// 受理时间
            Data.add(order.getOrderMessage1().getOrderFrom());     	// 流转渠道
            Data.add(order.getOrderMessage1().getOrderType());	// 流转类别
            Data.add(order.getOrderMessage1().getDanger());			// 高危选项
            Data.add(order.getOrderMessage1().getClassify_one());	    // 一级分类
            Data.add(order.getOrderMessage1().getClassify_two());	    // 二级分类
            Data.add(order.getOrderMessage1().getClassify_three());   // 三级分类
            Data.add(order.getOrderMessage1().getUserName());         // 客户用户名
            Data.add(order.getOrderMessage1().getTousuren());         // 投诉人
            Data.add(order.getOrderMessage1().getContact());          // 联系方式
            Data.add(order.getOrderMessage1().getEventDetail());     // 事件详情
            Data.add(order.getOrderMessage1().getFatherUser());       // 父用户
            Data.add(order.getOrderMessage1().getFirstContact());     // 首次联系情况
            Data.add(order.getOrderMessage1().getBeitousuren());      // 被投诉人
            Data.add(order.getOrderMessage1().getUser().getDept().getCenter().getBigCenter().getBigCenterName());       // 大中心
            Data.add(order.getOrderMessage1().getUser().getDept().getCenter().getCenterName());         // 中心
            Data.add(order.getOrderMessage1().getUser().getDept().getDeptName());            // 部门
            if(order.getOrderMessage2()!=null){
                Data.add(order.getOrderMessage2().getChuliren());         //处理人
                Data.add(order.getOrderMessage2().getResult());           //事件结果
            }
            if(order.getOrderMessage3()!=null){
                Data.add(order.getOrderMessage3().getConfirm());          // 投诉回访确认
                Data.add(order.getOrderMessage3().getIsclose());            // 问题是否关闭
                Data.add(order.getOrderMessage3().getRealReason1());      // 实际投诉原因的一级分类
                Data.add(order.getOrderMessage3().getRealReason2());      // 实际投诉原因的二级分类
                Data.add(order.getOrderMessage3().getJudge());            // 有理判定
                Data.add(order.getOrderMessage3().get_level());            // 有理级别
                Data.add(order.getOrderMessage3().getIsrepeat());			// 是否重复
                Data.add(order.getOrderMessage3().getaBP()); 				// 是否为总部回访
                Data.add(order.getOrderMessage3().getRecordPerson());     // 记录人
            }
            objects.add(Data);
        }
        ExportRunnable exportRunnable = new ExportRunnable(directory, fileName, sheetName, columnNames, sheetTitle, objects, append);
        Thread threads = new Thread(exportRunnable);
        threads.start();

        model.addAttribute("message", "正在导出，稍后请在下载中心查看");

        return "/public/info.jsp";
    }

    @RequestMapping("/showDownloadFile")
    @Token(save=true)
    public String showDownloadFile(HttpSession session,Model model) {
        String directory = session.getServletContext().getRealPath("/")+"download";
        File root = new File(directory);
        File[] fs = root.listFiles();
        List<String> list = new ArrayList<>();
        for(int i=0; i<fs.length; i++){
//			   System.out.println(fs[i].getAbsolutePath());
//			   System.out.println(fs[i].getName());
            list.add(fs[i].getName());
        }
        model.addAttribute("downList", list);
        return "/Npc/showDownloadFile.jsp";
    }

    @RequestMapping("/download")
    @Token(remove=true)
    public ResponseEntity<byte[]> download(String fileName,HttpSession session) throws IOException {
        String directory = session.getServletContext().getRealPath("/")+"download";
        String dfileName = new String(fileName.getBytes("utf-8"), "utf-8");
        System.out.println(dfileName);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        File file = new File(directory+"/"+dfileName);
        return new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
}
