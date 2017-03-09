package com.allen.util;


import com.allen.entity.telMessage.TelMessage;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by ad on 2017-02-27.
 */
public class ExcelRunnable implements Runnable {
    List<List<Object>> countTelMessageByDept;
    List<List<Object>> centerTelMessage;
    String directory;
    String fileName;

    List<String> personColumns;
    List<String> deptOrCenterColumns;
    List<List<Object>> objects;
    boolean append;

    public ExcelRunnable() {
        List<String> columnNames = new LinkedList<>();
        personColumns = new LinkedList<>();
        deptOrCenterColumns = new LinkedList<>();
        columnNames.add("总量");
        columnNames.add("总时长");
        columnNames.add("呼出总量");
        columnNames.add("呼出总时长");
        columnNames.add("<1min呼出量");
        columnNames.add("<1min呼出时长");
        columnNames.add(">1min呼出量");
        columnNames.add(">1min呼出时长");
        columnNames.add(">3min呼出量");
        columnNames.add(">3min呼出时长");
        columnNames.add("呼入总量");
        columnNames.add("呼入总时长");
        columnNames.add("<1min呼入量");
        columnNames.add("<1min呼入时长");
        columnNames.add(">1min呼入量");
        columnNames.add(">1min呼入时长");
        columnNames.add(">3min呼入量");
        columnNames.add(">3min呼入时长");

        personColumns.add("时间");
        personColumns.add("部门");
        personColumns.add("姓名");
        personColumns.add("CRM");
        personColumns.add("电话号码");
        personColumns.addAll(columnNames);


        deptOrCenterColumns.add("中心|部门");
        deptOrCenterColumns.add("人数");
        deptOrCenterColumns.addAll(columnNames);

    }


    public ExcelRunnable(List<TelMessage> telMessages, String directory, String fileName, boolean append) {
        this();
        this.directory = directory;
        this.fileName = fileName;
        this.append = append;
        List<Object> object;
        objects = new LinkedList<>();
        for (TelMessage telMessage : telMessages) {
            object = new LinkedList<>();
            object.add(telMessage.getDate());
            object.add(telMessage.getPerson().getDept().getDeptName());
            object.add(telMessage.getPerson().getName());
            object.add(telMessage.getPerson().getCrm());
            object.add(telMessage.getTelNum());

            object.add(telMessage.getCountAll());
            object.add(telMessage.getAllTime());

            object.add(telMessage.getCountOutAll());
            object.add(telMessage.getOutAllTime());
            object.add(telMessage.getCount_1out());
            object.add(telMessage.get_1outTime());
            object.add(telMessage.getCount$1out());
            object.add(telMessage.get$1outTime());
            object.add(telMessage.getCount$3out());
            object.add(telMessage.get$3outTime());

            object.add(telMessage.getCountInAll());
            object.add(telMessage.getInAllTime());
            object.add(telMessage.getCount_1in());
            object.add(telMessage.get_1inTime());
            object.add(telMessage.getCount$1in());
            object.add(telMessage.get$1inTime());
            object.add(telMessage.getCount$3in());
            object.add(telMessage.get$3inTime());
            objects.add(object);
        }
    }

    public ExcelRunnable(List<TelMessage> telMessages,List<List<Object>> countTelMessageByDept,
                         String directory,String fileName,boolean append){
        this(telMessages, directory, fileName, append);
        this.countTelMessageByDept = countTelMessageByDept;
    }

    public ExcelRunnable(List<TelMessage> telMessages,List<List<Object>> countTelMessageByDept,List<List<Object>>centerTelMessage
                        ,String directory,String fileName,boolean append) {
        this(telMessages, countTelMessageByDept, directory, fileName, append);
        this.centerTelMessage = centerTelMessage;
    }


//    public ExcelRunnable(List<TelMessage> telMessages,List<Object> countTelMessageByDept,
//                         String directory,String fileName,boolean append) {
//        this();
//        this.directory = directory;
//        this.fileName = fileName;
//        this.append = append;
//        List<List<Object>> temp = new LinkedList<>();
//        temp.add(countTelMessageByDept);
//        this.countTelMessageByDept = temp;
//
//        List<Object> object = null;
//        objects = new LinkedList<>();
//        for (TelMessage telMessage : telMessages) {
//            object = new LinkedList<>();
//            object.add(telMessage.getDate());
//            object.add(telMessage.getPerson().getDept().getDeptName());
//            object.add(telMessage.getPerson().getName());
//            object.add(telMessage.getPerson().getCrm());
//            object.add(telMessage.getTelNum());
//
//            object.add(telMessage.getCountAll());
//            object.add(telMessage.getAllTime());
//
//            object.add(telMessage.getCountOutAll());
//            object.add(telMessage.getOutAllTime());
//            object.add(telMessage.getCount_1out());
//            object.add(telMessage.get_1outTime());
//            object.add(telMessage.getCount$1out());
//            object.add(telMessage.get$1outTime());
//            object.add(telMessage.getCount$3out());
//            object.add(telMessage.get$3outTime());
//
//            object.add(telMessage.getCountInAll());
//            object.add(telMessage.getInAllTime());
//            object.add(telMessage.getCount_1in());
//            object.add(telMessage.get_1inTime());
//            object.add(telMessage.getCount$1in());
//            object.add(telMessage.get$1inTime());
//            object.add(telMessage.getCount$3in());
//            object.add(telMessage.get$3inTime());
//            objects.add(object);
//        }
//
//
//    }

    @Override
    public void run() {
        try {
System.out.println("start");
            ExcelUtil.writeExcel(directory,fileName, "个人", personColumns, "", objects, append);
            ExcelUtil.writeExcel(directory,fileName, "部门", deptOrCenterColumns, "", countTelMessageByDept, append);
            if (centerTelMessage != null) {
                ExcelUtil.writeExcel(directory,fileName, "中心", deptOrCenterColumns, "", centerTelMessage, append);
            }
System.out.println("end");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
