package cn.ym.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Db {
	 public static void main(String[] args) throws Exception {
/*	        // 1.加载数据访问驱动
	        Class.forName("com.mysql.jdbc.Driver");
	        //2.连接到数据"库"上去
	        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ssh?characterEncoding=utf-8", "root", "root");
	        //3.构建SQL命令
	        Statement state=conn.createStatement();
	        String s="insert into xs values('008','李丽','四中')";
	        state.executeUpdate(s);*/
		String s="$url=E:\\Files\\image1.png;x=906859;y=198137$";
		String all = s.replaceAll("\\\\", "/");
		System.out.println(all);
	    }

}
