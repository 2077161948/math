package cn.ym.pojo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

 
 
public class ReadExcel {
 private  static boolean g =false;
    private static final Log log = LogFactory.getLog(ReadExcel.class);
    	 static	Map<String, HashMap<String,HashMap<String,String>>> map=new HashMap<>();
    		static List<String> list=new ArrayList<>();
    		static StringBuffer buffer=new StringBuffer();
    		static String string="";
    		static boolean r=false;
     
    /**
     * 读取区域划分的xlsx
     */
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
            log.info("========行========"+rows+"=====列========"+cols);
            
            if(row.getCell(2).getCellType()==XSSFCell.CELL_TYPE_STRING&&!row.getCell(3).getStringCellValue().equals("市辖区")) {
            	String value1 = row.getCell(1).getStringCellValue();
            
            	String value2 = row.getCell(2).getStringCellValue();
            	String value3=row.getCell(3).getStringCellValue();
            	String value4=row.getCell(4).getStringCellValue();
            		if (!map.containsKey(value1)) {
						map.put(value1, new HashMap<String,HashMap<String,String>>());
					}
            		if (!map.get(value1).containsKey(value2)) {
						map.get(value1).put(value2,new HashMap<String,String>());
            			
					}
            		map.get(value1).get(value2).put(value4,value3);
            }
        }
        //System.out.println();
    }
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}

map.put("台湾省", new HashMap<>());
map.put("香港特别行政区", new HashMap<>());
map.put("澳门特别行政区", new HashMap<>());
    }  
    
    

private static void jxTest(String realPath,String fileName){
	try {
	    File fileDes = new File(realPath);
	    InputStream str = new FileInputStream(fileDes);
	    XSSFWorkbook xwb = new XSSFWorkbook(str);  //利用poi读取excel文件流
	    XSSFSheet st = xwb.getSheetAt(0);  //读取sheet的第一个工作表
	    int rows=st.getLastRowNum();//总行数
	    int cols;//总列数
	    for(int i=1;i<rows;i++){
	    	g=false;
	        XSSFRow row=st.getRow(i);//读取某一行数据
	        if(row!=null){
	            //获取行中所有列数据
	            cols=row.getLastCellNum();
	           String s = row.getCell(0).getStringCellValue();
	           System.out.println(s);
	           jx(s);
	    }
	        
	    }
	}catch (Exception e) {
		e.printStackTrace();
		
		
		// TODO: handle exception
	}
	
}

public static void  jx(String s) {
	r=false;
	map.forEach((k,v)->{
		if (s.contains(k)) {
			buffer.append(k);
			v.forEach((x,y)->{
				if (s.contains(x)) {
					g=true;
					buffer.append(x);
					y.forEach((w,t)->{
						if (s.contains(w)) {
							
							buffer.append(t);
							System.out.println(buffer.toString());
							buffer.delete(0, buffer.length());
							return;
						}
					});
				}
			});
		}
	});
   
   if (!g) {
	   buffer.delete(0, buffer.length());
		 String reg="^.*?(省|自治区|市|行政區|行政区)";
           String reg_1="^.*?(省|自治区|市|行政區|行政区).*?(市|盟|自治州|地区)";
           String reg_2="^.*?(省|自治区|市|行政區|行政区).*?(市|盟|自治州|地区).*?(县|市|区|區|旗)";
          Pattern compile = Pattern.compile(reg);
         Matcher matcher = compile.matcher(s);
         if(matcher.find()) {
        	buffer.append(matcher.group()); 
        	 Pattern pattern = Pattern.compile(reg_1);
        	 Matcher m = pattern.matcher(s);
        	 
        	 if (m.find()) {
        		 buffer.delete(0, buffer.length());
        		 buffer.append(m.group());
        		 Pattern p = Pattern.compile(reg_2);
        		 Matcher t = p.matcher(s);
        		 if (t.find()) {
        			 buffer.delete(0, buffer.length());
        			 buffer.append(t.group());
						System.out.println(buffer.toString());
						buffer.delete(0, buffer.length());
				}else {
					System.out.println(buffer.toString());
					buffer.delete(0, buffer.length());
				}
			}else {
				System.out.println(buffer.toString());
				buffer.delete(0, buffer.length());
			}
         }
}
buffer.delete(0, buffer.length());
}


 
     
    /**
     * test
     * @param args
     */
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