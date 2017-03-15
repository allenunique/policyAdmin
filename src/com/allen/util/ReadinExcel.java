package com.allen.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.xmlbeans.impl.xb.xsdschema.impl.SchemaDocumentImpl;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by ad on 2017-03-01.
 */
public class ReadinExcel<T> {
    private String format="yyyy-MM-dd";
    /**
     * 无参构造
     */
    public ReadinExcel() {
        super();
    }

    /**
     * 构造设置显示时间的格式
     * @param format 例："yyyy-MM-dd"
     */
    public ReadinExcel(String format) {
        super();
        this.format = format;
    }
    /**
     * 设置显示时间的格式
     * @param format 例："yyyy-MM-dd"
     */
    public void setFormat(String format) {
        this.format = format;
    }

    /**
     * 上传Excle文件、并读取其中数据、返回list数据集合
     * @param multipart
     * @param
     * @param
     * @param sheetIndex            读取Excle中的第几页中的数据
     * @param titleAndAttribute        标题名与实体类属性名对应的Map集合
     * @param clazz                    实体类.class
     * @return                        返回读取出的List集合
     * @throws Exception
     */
    public List<T> uploadAndRead(MultipartFile multipart,String filePath ,int sheetIndex,
                                 Map<String, String> titleAndAttribute, Class<T> clazz) throws Exception{

        String originalFilename=null;
        int i = 0;
        boolean isExcel2003 = false;

        //取出文件名称
        originalFilename = multipart.getOriginalFilename();

        //判断Excel是什么版本
        i = isExcleVersion(originalFilename);
        if(i==0)return null; else if(i==1)isExcel2003=true;

        File filePathname = this.upload(multipart, filePath, isExcel2003);
        List<T> judgementVersion = judgementVersion(filePathname, sheetIndex, titleAndAttribute, clazz, isExcel2003);

        return judgementVersion;
    }

    /**
     * @描述：判断Excel是什么版本
     * @param originalFilename
     * @return
     *         1 ：2003
     *         2 ：2007
     *         0 ：不是Excle版本
     */
    public int isExcleVersion(String originalFilename){
        int i = 0;

        if(originalFilename.matches("^.+\\.(?i)(xls)$"))i = 1;
        else
        if(originalFilename.matches("^.+\\.(?i)(xlsx)$"))i = 2;

        return i;
    }

    /**
     * SpringMVC 上传Excle文件至本地
     * @param multipart
     * @param filePath        上传至本地的文件路径    例：D:\\fileupload
     * @param isExcel2003    是否是2003版本的Excle文件
     * @return                返回上传文件的全路径
     * @throws Exception
     */
    public File upload(MultipartFile multipart,String filePath,boolean isExcel2003) throws Exception{
        //文件后缀
        String extension=".xlsx";
        if(isExcel2003)extension=".xls";
        //指定上传文件的存储路径
        File file=new File(filePath);

        //接口强转实现类
        CommonsMultipartFile commons=(CommonsMultipartFile) multipart;

        //判断所属路径是否存在、不存在新建
        if(file.exists())file.mkdirs();

        /*
         * 新建一个文件
         * LongIdWorker longID工具类
         */
        File filePathname=new File(file+File.separator+ UUID.randomUUID()+extension);

        //将上传的Excel写入新建的文件中
        try {
            commons.getFileItem().write(filePathname);
        } catch (Exception e) {
           e.printStackTrace();
        }

        return filePathname;
    }

    /**
     * 读取本地Excel文件返回List集合
     * @param filePathname
     * @param sheetIndex
     * @param titleAndAttribute
     * @param clazz
     * @param isExcel2003
     * @return
     * @throws Exception
     */
    public List<T> judgementVersion(File filePathname,int sheetIndex,Map<String, String> titleAndAttribute,Class<T> clazz,boolean isExcel2003) throws Exception{

        FileInputStream is=null;
        POIFSFileSystem fs=null;
        Workbook workbook=null;
        try {
            //打开流
            is=new FileInputStream(filePathname);
            if(isExcel2003){
                //把excel文件作为数据流来进行传入传出
                fs=new POIFSFileSystem(is);
                //解析Excel 2003版
                workbook = new HSSFWorkbook(fs);
            }else{
                //解析Excel 2007版
                workbook=new XSSFWorkbook(is);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return readExcelTitle(workbook,sheetIndex,titleAndAttribute,clazz);
    }

    /**
     * 判断接收的Map集合中的标题是否于Excle中标题对应
     * @param workbook
     * @param sheetIndex
     * @param titleAndAttribute
     * @param clazz
     * @return
     * @throws Exception
     */
    private List<T> readExcelTitle(Workbook workbook,int sheetIndex,Map<String, String> titleAndAttribute,Class<T> clazz) throws Exception{

        //得到第一个shell
        Sheet sheet = workbook.getSheetAt(sheetIndex);

        // 获取标题
        Row titelRow = sheet.getRow(0);
        Map<Integer, String> attribute = new HashMap<Integer, String>();
        if (titleAndAttribute != null) {
            for (int columnIndex = 0; columnIndex < titelRow.getLastCellNum(); columnIndex++) {
                Cell cell = titelRow.getCell(columnIndex);
                if (cell != null) {
                    String key = cell.getStringCellValue();
                    String value = titleAndAttribute.get(key);
                    if (value == null) {
                        value = key;
                    }
                    attribute.put(Integer.valueOf(columnIndex), value);
                }
            }
        } else {
            for (int columnIndex = 0; columnIndex < titelRow.getLastCellNum(); columnIndex++) {
                Cell cell = titelRow.getCell(columnIndex);
                if (cell != null) {
                    String key = cell.getStringCellValue();
                    attribute.put(Integer.valueOf(columnIndex), key);
                }
            }
        }

        return readExcelValue(workbook,sheet,attribute,clazz);

    }

    /**
     * 获取Excle中的值
     * @param workbook
     * @param sheet
     * @param attribute
     * @param clazz
     * @return
     * @throws Exception
     */
    private List<T> readExcelValue(Workbook workbook,Sheet sheet,Map<Integer, String> attribute,Class<T> clazz) throws Exception{
        List<T> info=new ArrayList<T>();
        //获取标题行列数
        int titleCellNum = sheet.getRow(0).getLastCellNum();
        // 获取值
        for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
            Row row = sheet.getRow(rowIndex);
//            logger.debug("第--" + rowIndex);

            //    1.若当前行的列数不等于标题行列数就放弃整行数据(若想放弃此功能注释4个步骤即可)
            int lastCellNum = row.getLastCellNum();
            if(titleCellNum !=  lastCellNum){
                continue;
            }

            // 2.标记
            boolean judge = true;
            T obj = clazz.newInstance();
            for (int columnIndex = 0; columnIndex < row.getLastCellNum()-1; columnIndex++) {//这里小于等于变成小于
                Cell cell = row.getCell(columnIndex);

                //处理单元格中值得类型
                String value = getCellValue(cell);
 System.out.println(columnIndex+":"+value);
                // 3.单元格中的值等于null或等于"" 就放弃整行数据
//                if(value == null || "".equals(value)){
//                    judge = false;
//                    break;
//                }

                /*
                 * 测试：查看自定义的title Map集合中定义的Excle标题和实体类中属性对应情况！
                   System.out.println("c:"+columnIndex+"\t"+attribute.get(Integer.valueOf(columnIndex)));
                 */
                if (value != null && !"".equals(value)) {
                    Field field = clazz.getDeclaredField(attribute.get(Integer
                            .valueOf(columnIndex)));
                    Class<?> fieldType = field.getType();
                    Object agge = null;
                    if (fieldType.isAssignableFrom(int.class)) {
                        agge = Integer.valueOf(value);
                    } else if (fieldType.isAssignableFrom(Integer.class)) {
                        agge = Integer.valueOf(value);
                    } else if (fieldType.isAssignableFrom(Double.class)) {
                        agge = Double.valueOf(value);
                    } else if (fieldType.isAssignableFrom(Float.class)) {
                        agge = Float.valueOf(value);
                    } else if (fieldType.isAssignableFrom(Long.class)) {
                        agge = Long.valueOf(value);
                    } else if (fieldType.isAssignableFrom(Date.class)) {
                            agge = new SimpleDateFormat(format).parse(value);

                    } else if (fieldType.isAssignableFrom(Boolean.class)) {
                        agge = "Y".equals(value) || "1".equals(value);
                    } else if (fieldType.isAssignableFrom(String.class)) {
                        agge = value;
                    }
                    // 个人感觉char跟byte就不用判断了 用这两个类型的很少如果是从数据库用IDE生成的话就不会出现了
                    Method method = clazz.getMethod("set"
                            + toUpperFirstCase(attribute.get(Integer
                            .valueOf(columnIndex))), fieldType);
                    method.invoke(obj, agge);
                }

            }
            Cell cell = row.getCell(row.getLastCellNum()-1);
            String value = getCellValue1(cell);
            Method method = clazz.getMethod("set"
                    + toUpperFirstCase(attribute.get(Integer
                    .valueOf(row.getLastCellNum()-1))), String.class);
            method.invoke(obj, value);

            // 4. if
            if(judge)info.add(obj);
        }
        return info;
    }

    /**
     *  @ 首字母大写
     */
    private String toUpperFirstCase(String str) {
        if(str.substring(0,1).equals("_") || str.substring(0,1).equals("$")){
            return str;
        }else
        return str.replaceFirst(str.substring(0, 1), str.substring(0, 1)
                .toUpperCase());
    }

    /**
     * 功能:处理单元格中值得类型
     * @param cell
     * @return
     */
    private String getCellValue(Cell cell) {
        Object result = "";
        if (cell != null) {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_STRING:
                    result = cell.getStringCellValue();
                    break;
                case Cell.CELL_TYPE_NUMERIC:
                    //判断是是日期型，转换日期格式，否则转换数字格式。
                    if(DateUtil.isCellDateFormatted(cell)){
                        Date dateCellValue = cell.getDateCellValue();
                        if(dateCellValue != null){
                            result = new SimpleDateFormat("HH:mm:ss").format(dateCellValue);
                        }
                        else{
                            result="";
                        }
                    }
                    else{
                        result = new DecimalFormat("0").format(cell.getNumericCellValue());
                    }
                    break;
                case Cell.CELL_TYPE_BOOLEAN:
                    result = cell.getBooleanCellValue();
                    break;
                case Cell.CELL_TYPE_FORMULA:
                /*
                 *  导入时如果为公式生成的数据则无值
                 *
                    if (!cell.getStringCellValue().equals("")) {
                        value = cell.getStringCellValue();
                    } else {
                        value = cell.getNumericCellValue() + "";
                    }
                */
                    result = cell.getCellFormula();
                    break;
                case Cell.CELL_TYPE_ERROR:
                    result = cell.getErrorCellValue();
                    break;
                case Cell.CELL_TYPE_BLANK:
                    break;
                default:
                    break;
            }
        }
        return result.toString();
    }
    private String getCellValue1(Cell cell) {
        Object result = "";
        if (cell != null) {
                Date dateCellValue = cell.getDateCellValue();
                if (dateCellValue != null) {
                    result = new SimpleDateFormat(format).format(dateCellValue);
                }
        }
        return result.toString();
    }

}
