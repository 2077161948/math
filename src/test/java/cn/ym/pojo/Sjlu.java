package cn.ym.pojo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import org.apache.commons.io.IOUtils;

import com.alibaba.fastjson.JSON;

public class Sjlu {

	public static void main(String[] args) throws Exception {
		BufferedReader reader=new BufferedReader(new FileReader(new File("1.txt")));
			StringBuilder builder=new StringBuilder();
			List<String> list = IOUtils.readLines(reader);
			for (String string : list) {
				builder.append(string);
			}
			String str=builder.toString();
			List<nodes> parseArray = JSON.parseArray(str,nodes.class);
			 Class.forName("com.mysql.jdbc.Driver");
		        //2.连接到数据"库"上去
		        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ssh", "root", "root");
		        //3.构建SQL命令
		        PreparedStatement state=conn.prepareStatement("insert into assortment values(?,?,?,?,?,?,?,?,?,?)");
		       for (nodes nodes : parseArray) {
			        state.setInt(1,nodes.getNodeId());
			        state.setString(2, nodes.getNodeCode());
			        state.setString(3, nodes.getIsVisible());
			        state.setString(4, nodes.getNodeName());
			        state.setInt(5, nodes.getNodeParentId());
			        state.setInt(6, nodes.getNodeOrder());
			        state.setInt(7, nodes.getNodeLevel());
			        state.setInt(8, nodes.getCount());
			        state.setString(9,nodes.getIsHaveChild());
			        state.setInt(10, 1);
			        state.execute();
			}

	}
	
}
