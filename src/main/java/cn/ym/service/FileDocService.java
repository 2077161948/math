package cn.ym.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.AproblemMapper;
import cn.ym.dao.FiledocMapper;
import cn.ym.pojo.Aproblem;
import cn.ym.pojo.AproblemExample;
import cn.ym.pojo.Filedoc;
import cn.ym.pojo.FiledocExample;
import cn.ym.pojo.Result;
import cn.ym.pojo.Teacher;
import cn.ym.pojo.FiledocExample.Criteria;
import cn.ym.util.Cangliang;
import cn.ym.util.ConvertOutHtml;

@Service
public class FileDocService {
					@Value("${filepath}")
					public   String  path="";
    
	@Autowired
	ConvertOutHtml convertOutHtml;
					
	@Autowired
	FiledocMapper filedocMapper;
	
	@Autowired
	AproblemMapper aproblemMapper;
	
	public List<Aproblem> dList(List<Integer> values){
		AproblemExample example = new AproblemExample();
		cn.ym.pojo.AproblemExample.Criteria criteria = example.createCriteria();
		criteria.andIdIn(values);
		return aproblemMapper.selectByExample(example);
	}
	
	public PageInfo<Filedoc>  Get(String name) {
		PageHelper.startPage(1,10);
		FiledocExample example=new FiledocExample();
		Criteria criteria = example.createCriteria();
		criteria.andFilenameLike("%"+name+"%");
		List<Filedoc> list = filedocMapper.selectByExample(example);
		PageInfo<Filedoc> pageInfo=new PageInfo<>(list);
		List<Filedoc> r = pageInfo.getList();
		for (Filedoc filedoc : r) {
			String replace = filedoc.getFilepath().replace(path, "/file/");
			filedoc.setFilepath(replace);
		}
		return pageInfo;
		
	}
	
	public PageInfo<Filedoc> timedesc(Integer page){
		PageHelper.startPage(page,10);
		FiledocExample example=new FiledocExample();
		example.setDistinct(true);
		example.setOrderByClause(" uploadTime desc");
		List<Filedoc> list = filedocMapper.selectByExample(example);
		
		PageInfo<Filedoc> pageInfo=new PageInfo<>(list);
		List<Filedoc> r = pageInfo.getList();
		for (Filedoc filedoc : r) {
			String replace = filedoc.getFilepath().replace(path, "/file/");
			filedoc.setFilepath(replace);
		}
		return pageInfo;
		
	}
	
	
	public List<Filedoc> weitijiao(HttpServletRequest request) {
		Teacher attribute =(Teacher)request.getSession().getAttribute(Cangliang.TEACHER);
		if(attribute==null) {
			return new ArrayList<>();
		}
		FiledocExample example=new FiledocExample();
		Criteria criteria = example.createCriteria();
		criteria.andTeacherIdEqualTo(attribute.getId());
		criteria.andStatusEqualTo("未解析");
		List<Filedoc> list = filedocMapper.selectByExample(example);
		return list;
		
	}
	
	public Result AddFile(HttpServletRequest request,Filedoc fileDoc) throws IOException {
		String tr="";
		Teacher teacher=(Teacher)request.getSession().getAttribute("Teacher");
	      if (teacher==null) {
			return new Result(500,"登录已经过期");
		}
	      int g=0;
	      Result result=null;
	    	OutputStream out =null;
	    	ArrayList<String> list = new ArrayList<String>();
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
	        //判断 request 是否有文件上传,即多部分请求  
	        if(multipartResolver.isMultipart(request)){  
	            //转换成多部分request    
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
	            //取得request中的所有文件名  
	            Iterator<String> iter = multiRequest.getFileNames();  
	        while (iter.hasNext()) {
	            MultipartFile f=multiRequest.getFile(iter.next()); 
	            if (f==null||!f.getOriginalFilename().endsWith("docx")) {
	            	return new Result(500,"文件不匹配");
				}
	            String name = f.getOriginalFilename();
	            fileDoc.setFilename(name);
	            FiledocExample example = new  FiledocExample();
	            Criteria criteria = example.createCriteria();
	            criteria.andFilenameEqualTo(name);
	            int i = filedocMapper.countByExample(example);
	            if (i>0) {
	            	return new Result(500,"添加失败!已经添加");
					
				}
	            fileDoc.setTeacherId(teacher.getId());
	            fileDoc.setUploadtime(new Date());
	            String s =DigestUtils.md5Hex(f.getInputStream());
	            new File(path + s ).mkdirs();
	            try {
	            	String filepath=path + s + "/" + s + name;
	                File file = new File(filepath);
	                fileDoc.setFilepath(filepath);
	                out= new FileOutputStream(file);
	                IOUtils.copy(f.getInputStream(),out);
	                out.close();
	              //convertOutHtml.start(path + s + "/"+s + name);
	                //dTohtml.DocToHtml(path + s + "/",s + name);
	                fileDoc.setBody("");
	                fileDoc.setStatus("未解析");
	              
	                tr=path + s + "/"+s+name;
	                list.add(tr);
	                filedocMapper.insertSelective(fileDoc);
	            }catch (Exception e) {
	                System.out.println(e.getLocalizedMessage());
	                return new Result(500,"添加失败");
	            }
	          
//	           Result jiexi = jiexi(tr);
//	           		list.add(jiexi);
	           
	        }
	        result=new Result();
	        result.getMap().put("list",list);
	        return result;
	        }
			return result;
		
	}
	
	public Result jiexi(Integer id) {
		AproblemExample example = new AproblemExample();
		example.createCriteria().andFiledocIdEqualTo(id);
		List<Aproblem> list = aproblemMapper.selectByExample(example);
		Result re = new Result();
		re.getMap().put("list", list);
		return re;
		
	}
	
	
	public Result jiexi(String path) throws IOException {
		FiledocExample example=new FiledocExample();
		Criteria criteria = example.createCriteria();
		criteria.andFilepathEqualTo(path);
			List<Filedoc> list = filedocMapper.selectByExample(example);
			
			if (list.size()!=0) {
				list.get(0).setStatus("已经解析");
			filedocMapper.updateByPrimaryKey(list.get(0));
			List<Aproblem> start = convertOutHtml.start(path,list.get(0).getId());
			
			//List<Aproblem> result = AnalyzeHtml.result(ReaderHtml(split[1]),list.get(0).getId());
			Result re = new Result();
			re.getMap().put("list", start);
			return re;
			}
		
		return new Result(500,"找不到试卷");
		
		
	}
	public String ReaderHtml(String path)  {

		StringBuffer buffer=new StringBuffer();
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(new File(path)));
			String str="";
			while((str=reader.readLine())!=null) {
				buffer.append(str);
			}
		} catch (Exception e) {
			
		}finally {
			if (reader!=null) {
				try {
					reader.close();
				} catch (IOException e) {
					
				}
			}
		}
		
		
		
		return buffer.toString();
		
	}
}
