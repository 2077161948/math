package cn.ym.pojo;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;

import org.apache.poi.hwpf.extractor.WordExtractor;

public class FileTest {
public static void main(String[] args) throws Exception {
	File file=new File("C:\\Users\\user\\Desktop\\1.doc");
	File r = new File("C:\\Users\\user\\Desktop\\2.doc");
	
	 WordExtractor ex = new WordExtractor(new FileInputStream(file));
	 String[] text = ex.getParagraphText();
	for (String string : text) {
		System.out.println(string);
		System.out.println("-------------------------");
	}
}
}
