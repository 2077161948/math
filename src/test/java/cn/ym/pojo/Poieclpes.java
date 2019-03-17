package cn.ym.pojo;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.enterprise.inject.New;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import fmath.b.b.s;


public class Poieclpes {
	
	static Set<String> set_1=new HashSet<>();
	static Set<String> set_2=new HashSet<>();
	static Set<String> set_3=new HashSet<>();
	
    @SuppressWarnings("deprecation")
	private static void Jiexihuafen(String realPath,String fileName){
try {
    File fileDes = new File(realPath);
    InputStream str = new FileInputStream(fileDes);
    XSSFWorkbook xwb = new XSSFWorkbook(str);  //利用poi读取excel文件流
    XSSFSheet st = xwb.getSheetAt(0);  //读取sheet的第一个工作表
    int rows=st.getLastRowNum();//总行数
    int cols;//总列数
    for(int i=1;i<rows;i++){
        XSSFRow row=st.getRow(i);//读取某一行数据
        if(row!=null){
            //获取行中所有列数据
            cols=row.getLastCellNum();
            
            if(row.getCell(2).getCellType()==XSSFCell.CELL_TYPE_STRING&&!row.getCell(3).getStringCellValue().equals("市辖区")) {
            	String value1 = row.getCell(1).getStringCellValue();
            
            	String value2 = row.getCell(2).getStringCellValue();
            	String value3=row.getCell(3).getStringCellValue();
            	String value4=row.getCell(4).getStringCellValue();
            	set_1.add(value1);
            	set_2.add(value2);
            	set_1.forEach(x->{set_2.contains(x);set_2.remove(x);});
            	set_3.add(value3);
            }
        }
        //System.out.println();
    }
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}

set_1.add("台湾省");
set_1.add("香港特别行政区");
set_1.add("澳门特别行政区");
    }  
    
    
    private static void jxTest(String realPath,String fileName){
    	StringBuffer buffer=new StringBuffer();
    	try {
    	    File fileDes = new File(realPath);
    	    InputStream str = new FileInputStream(fileDes);
    	    XSSFWorkbook xwb = new XSSFWorkbook(str);  //利用poi读取excel文件流
    	    XSSFSheet st = xwb.getSheetAt(0);  //读取sheet的第一个工作表
    	    int rows=st.getLastRowNum();//总行数
    	    int cols;//总列数
    	    for(int i=1;i<rows;i++){
    	        XSSFRow row=st.getRow(i);//读取某一行数据
    	        if(row!=null){
    	            //获取行中所有列数据
    	            cols=row.getLastCellNum();
    	          String s = row.getCell(0).getStringCellValue();
    	          System.out.println(s);
    	          for (String t : set_1) {
					if (s.contains(t)) {
						buffer.append(s);
						break;
					}
				}
    	          for (String t : set_2) {
					if (s.contains(t)) {
						buffer.append(s);
						break;
					}
				}
    	          for (String t : set_3) {
					if (s.contains(t)) {
						buffer.append(s+"-");
						break;
					}
				}
   if (!buffer.toString().endsWith("-")) {
    String reg_2="^.*?(省|自治区|市|行政區|行政区).*?(市|盟|自治州|地区).*?(县|市|区|區|旗)";
    Pattern compile = Pattern.compile(reg_2);
    Matcher matcher2 = compile.matcher(buffer.toString());
    if (matcher2.find()) {
		String group = matcher2.group();
		System.out.println(group);
	}else {
	String reg="^.*?(省|自治区|市|行政區|行政区).*?(市|盟|自治州|地区|县|市|区|區|旗)";
	Pattern pattern = Pattern.compile(reg);
	Matcher matcher = pattern.matcher(buffer.toString());
	if (matcher.find()) {
		String string = matcher.group();
		System.out.println(string);
	}
}
}else {
	String string = buffer.toString();
System.out.println(string.substring(0,string.length()-1));   	    
}
buffer.delete(0, buffer.length());
    	        }
    	        }
    	        
    	}catch (Exception e) {
    		e.printStackTrace();
    		
    		
    		// TODO: handle exception
    	}
    	
    }
    public static void main(String[] args) {
        String fileName = "区县划分.xlsx";
        String realPath = "F:\\QQ记录\\2077161948\\FileRecv\\";
         
        	Jiexihuafen(realPath+fileName, fileName);
        	//jx("江苏省连云港市灌南县百禄镇屈西村");
        	
        	jxTest(realPath+"区县测试用数据.xlsx","区县测试用数据.xlsx");
         //String string = map.get("云南省").get("怒江傈僳族自治州").toString();
        // System.out.println(string);
    }
}
