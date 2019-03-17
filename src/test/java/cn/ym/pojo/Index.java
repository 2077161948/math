package cn.ym.pojo;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.jsoup.Connection;
import org.jsoup.Connection.Request;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Index {
	static String path="F:\\ww66";
	static	String url="http://www.batv66.com";
public static void main(String[] args) throws Exception{

 Document parse = Jsoup.connect("http://www.batv66.com/static/js/jquery.lazyload.js").userAgent("Mozilla/5.0").timeout(30000).get();
System.out.println(parse.html());
 /*BufferedWriter stream=new BufferedWriter(new FileWriter(new File(path,"index.html")));
stream.write(parse.outerHtml());
stream.flush();
stream.close();
Map<String,String> list=new HashMap<>();
getstatic(list, parse);*/

}
public static void   getstatic(Map<String,String> list,Document parse) {
	
	Elements tag = parse.getElementsByTag("link");
	for (Element t : tag) {
		String href= t.attr("href");
		if (href!=null&&!href.trim().equals("")) {
			
			String str=href.replace("/", "\\");
			list.put(path+str,url+href);
		}
	}
	Elements byTag = parse.getElementsByTag("script");
	for (Element element : byTag) {
		String src=element.attr("src");
		if (src!=null&&!src.trim().equals("")) {
			String str=src.replace("/", "\\");
			list.put(path+str,url+src);
		}
	}
	list.forEach((x,y)->{
		File file=new File(x);
		if (!file.getParentFile().exists()) {
				file.mkdirs();
			
		}
		if (!file.exists()) {
			try {
				file.createNewFile();
			 Document html = Jsoup.connect("http://www.batv66.com/").userAgent("Mozilla/5.0").timeout(30000).get();
			 BufferedWriter writer=new BufferedWriter(new FileWriter(new File(x)));
			 writer.write(html.html());
			 writer.flush();
			 writer.close();
			} catch (IOException e) {
				System.out.println(y);
			System.err.println(e.getLocalizedMessage());
			}
		}
		
	});
}
}
