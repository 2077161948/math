package cn.ym.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.pojo.Filedoc;
import cn.ym.pojo.Result;
import cn.ym.service.AdminFiledocService;
import cn.ym.service.FileDocService;

@Controller
@RequestMapping("/Admin")
public class AdminFileDocController {
	
	@Autowired
	AdminFiledocService fileDocService;
	@RequestMapping(value="/filedoc",method=RequestMethod.GET,produces = "application/json; charset=utf-8")
	public ModelAndView GetList(
			@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer num,
			@RequestParam(defaultValue="")String name) {
		PageHelper.startPage(page, num);
		PageInfo<Filedoc> info = fileDocService.getList(page, num, name);
	ModelAndView view = new ModelAndView();
	view.setViewName("filedoc");
	view.addObject("name", name);
	view.addObject("list",info);	
		return view;
	}
	@RequestMapping(value="/filedoc",method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	public ModelAndView update(Filedoc filedoc) {
		Result result = fileDocService.update(filedoc);
		ModelAndView list = GetList(1, 10, "");
		return list;
		
	}
	@ResponseBody
	@RequestMapping(value="/filedoc",method=RequestMethod.DELETE,produces = "application/json; charset=utf-8")
	public  String del(@RequestParam("ids")ArrayList<Integer> ids) {
		Result del = fileDocService.del(ids);
		return JSON.toJSONString(del);
	}
	
	@ResponseBody
	@RequestMapping(value="/filedoc/{id}",method=RequestMethod.GET)
	public  String get(@PathVariable("id")Integer id) {
		Filedoc filedoc = fileDocService.get(id);
		return JSON.toJSONString(filedoc);
	}
	
	
}
