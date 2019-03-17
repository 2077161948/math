package cn.ym.controller;


import cn.ym.pojo.Assortment;
import cn.ym.pojo.Filedoc;
import cn.ym.pojo.Questiontype;
import cn.ym.pojo.Result;
import cn.ym.service.AproblemService;
import cn.ym.service.AssormentService;
import cn.ym.service.FileDocService;
import cn.ym.service.QuestiontypeService;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Queue;
import java.util.stream.Collectors;
@Controller
@RequestMapping(value="/File",produces = "application/json; charset=utf-8")
public class UploadController {

	
	@Value("${filepath}")
	public   String  path="";
    @Autowired
    AproblemService AproblemService;
    @Autowired
    FileDocService fileDocService;
    @Autowired
    QuestiontypeService typeService;
    @Autowired
    AssormentService assormentService;
    /**
     * 
     * @param files
     * @param request
     * @param fileDoc
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value="/upload",method = {RequestMethod.POST},produces = "application/json; charset=utf-8")
    public String  File_Upload(HttpServletRequest request,Filedoc filedoc) throws IOException {
    	Result file = fileDocService.AddFile(request, filedoc);
		return JSON.toJSONString(file);
    }
	
	@RequestMapping(value="/jixi",produces = "application/json; charset=utf-8")
	public String jixi(String path,Model model) throws IOException {
		Result jiexi = fileDocService.jiexi(path);
		List<Assortment> zj1 = assormentService.selectList(0);
		List<Assortment>  zsd1= assormentService.selectList(1);
		List<Assortment> list = zj1;
		Queue<Assortment> tree=new ArrayDeque<>();
		List<Assortment> tList=new ArrayList<>();
	for (int i = 0; i < list.size(); i++) {
		if (list.get(i).getParentid()==0) {
			tree.add(list.get(i));
			tList.add(list.get(i));
			list.remove(i);
		}
	}
			while(tree.size()>0) {
				Assortment poll = tree.poll();
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getParentid().intValue()==poll.getId().intValue()) {
								poll.getList().add(list.get(i));
								tree.add(list.get(i));
							
							list.remove(i);
							i--;
					}
				}
			}
			ArrayList<Assortment> zj = new ArrayList<Assortment>();
			for (int i = 0; i < tList.size(); i++) {
				dg(tList.get(i), zj);
				
			}
			
			list=zsd1;
			tree.clear();
			ArrayList<Assortment> list2 = new ArrayList<Assortment>();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getParentid()==0) {
					tree.add(list.get(i));
					list2.add(list.get(i));
					list.remove(i);
				}
			}
					while(tree.size()>0) {
						Assortment poll = tree.poll();
						for (int i = 0; i < list.size(); i++) {
							if (list.get(i).getParentid().intValue()==poll.getId().intValue()) {
										poll.getList().add(list.get(i));
									tree.add(list.get(i));
						
									
									list.remove(i);
									i--;
							}
						}
					}
					tree.clear();
					ArrayList<Assortment> zsd = new ArrayList<Assortment>();
							for (int i = 0; i < list2.size(); i++) {
								dg(list2.get(i), zsd);
							}
		
	
		List<Questiontype> r = typeService.list("");
		model.addAttribute("list",jiexi);
		model.addAttribute("types", r);
		model.addAttribute("zj",zj);
		model.addAttribute("zsd", zsd);
		return"adds";
		
	}
	
	@RequestMapping("/indexfile")
		public ModelAndView indexfile(String path,ModelAndView modelAndView) throws IOException {
		modelAndView.setViewName("handle");	
		fileDocService.jiexi(path);
			return modelAndView;
			
		}
	
	
    @RequestMapping(value="/download",method=RequestMethod.GET) //匹配的是href中的download请求
    public ResponseEntity<byte[]> download(@RequestParam("id")ArrayList<Integer> id) throws Exception{
System.out.println("UploadController.download()");
        HttpHeaders headers = new HttpHeaders();//http头信息
        File zj = AproblemService.zj(id);
        headers.setContentDispositionFormData("attachment",zj.getAbsolutePath());

        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息
        byte[] array = FileUtils.readFileToByteArray(zj);
        zj.delete();
        return new ResponseEntity<byte[]>(array,headers,HttpStatus.CREATED);

    }
    private void dg(Assortment assortment,ArrayList<Assortment> arrayList) {
    	if (assortment.getList().size()==0) {
			arrayList.add(assortment);
			
		}else {
			for (int i = 0; i < assortment.getList().size(); i++) {
				dg(assortment.getList().get(i), arrayList);
			}
		}
    	
    }
}
