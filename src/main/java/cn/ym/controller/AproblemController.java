package cn.ym.controller;



import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import cn.ym.pojo.Aproblem;
import cn.ym.pojo.Result;
import cn.ym.service.AproblemService;

@Controller
@RequestMapping(value="/aproblem",produces = "application/json; charset=utf-8")
public class AproblemController {

	@Value("${filepath}")
	public   String  path="";
	
	@Autowired
	AproblemService aproblemService;
	
	
	@ResponseBody
	@RequestMapping(value="/add",produces = "application/json; charset=utf-8")
	public String add(Aproblem aproblem) {
		
		Result add = aproblemService.add(aproblem);
		return JSON.toJSONString(add);
		
	}
	@RequestMapping(value="/result",produces = "application/json; charset=utf-8")
	public String result(@RequestParam("data") String data,@RequestParam(value="status",defaultValue="0")Integer status,HttpServletRequest request ) {
		List<Aproblem> list = aproblemService.result(data, status);
		Result result = new Result();
		result.getMap().put("list", list);
		request.setAttribute("jiexi", result);
		System.out.println("AproblemController.result()");
		return "ylan";
		
	}
	@ResponseBody
	@RequestMapping(value="/sdzj")
	public String sdzj(Integer types,Integer ass ,Integer status,Integer pagesize,Integer page) {
		PageInfo<Aproblem> pageInfo = aproblemService.result(types,ass,status,pagesize,page);
		return JSON.toJSONString(pageInfo);
		}
	@RequestMapping(value="/show")
	public ModelAndView show(HttpServletRequest request,@RequestParam("id")ArrayList<Integer> id,ModelAndView view) {
	view.setViewName("ylan");
	List<Aproblem> list = aproblemService.GetList(id);
	Result re = new Result();
	re.getMap().put("list",list);
	view.addObject("jiexi", re);
		return view;
	}
	@ResponseBody
	@RequestMapping("/del/{id}")
	public String del(@PathVariable("id")Integer id) {
		return JSON.toJSONString(aproblemService.del(id));
	}
	
}
