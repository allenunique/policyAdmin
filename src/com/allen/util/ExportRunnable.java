package com.allen.util;

import java.io.IOException;
import java.util.List;


public class ExportRunnable implements Runnable {
	String directory; 
	String fileName; 
	String sheetName; 
	List<String> columnNames;
    String sheetTitle; 
    List<List<Object>> objects;
    boolean append;

	public ExportRunnable(String directory, String fileName, String sheetName,
			List<String> columnNames, String sheetTitle,
			List<List<Object>> objects, boolean append) {
		super();
		this.directory = directory;
		this.fileName = fileName;
		this.sheetName = sheetName;
		this.columnNames = columnNames;
		this.sheetTitle = sheetTitle;
		this.objects = objects;
		this.append = append;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
	System.out.println("Start");
		 try {
			ExcelUtil.writeExcel(directory,fileName, sheetName, columnNames, sheetTitle, objects, append);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	System.out.println("End");
	}
	

}
