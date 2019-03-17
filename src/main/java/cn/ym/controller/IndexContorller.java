package cn.ym.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.FiledocMapper;
import cn.ym.pojo.Filedoc;
import cn.ym.pojo.Result;
import cn.ym.service.CommonService;
import cn.ym.service.FileDocService;
import cn.ym.service.QuestiontypeService;
import cn.ym.util.Cangliang;

@Controller
public class IndexContorller {
	@Value("${filepath}")
	public   String  path="";
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	FileDocService fileDocService;
	
	@Autowired
	QuestiontypeService typeService;

	@ResponseBody
	@RequestMapping(value="/get",produces = "application/json; charset=utf-8")
	public String start(HttpServletRequest request) {
		if (request.getSession().getAttribute(Cangliang.TEACHER)==null&&request.getSession().getAttribute(Cangliang.STUDENT)==null) {
		return JSON.toJSONString(new Result(500,"请登录"));
		}
		return JSON.toJSONString(new Result());
	}
	
	@RequestMapping(value="/")
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("index");
		view.addObject("banner", commonService.pageList("bonner",1, 10).getList());
		view.addObject("baiqiang", commonService.pageList("baiqiang",1, 10).getList());
		view.addObject("gz", commonService.pageList("gz",1, 10).getList());
		view.addObject("now", commonService.pageList("now",1, 10).getList());
		view.addObject("tb", commonService.pageList("tb", 1, 10).getList());
		return view;
		
	}
	@RequestMapping("/login")
	public ModelAndView add() {
		return new ModelAndView("login");
	}
	@RequestMapping("/help")
	public ModelAndView help() {
		return new ModelAndView("help");
	}
	@RequestMapping("/register")
	public ModelAndView register() {
		return new ModelAndView("register");
	}
	@RequestMapping("/rePwd")
	public ModelAndView rePwd() {
		return new ModelAndView("rePwd");
	}
	@RequestMapping("/login_out")
	public String login_out(HttpServletRequest request) {
		request.getSession().removeAttribute(Cangliang.TEACHER);
		request.getSession().removeAttribute(Cangliang.STUDENT);
		return "/index";
		
	}
	@RequestMapping("/adminTeacher")
	public ModelAndView adminTeacher(HttpServletRequest request ,ModelAndView view) {

			List<Filedoc> list = fileDocService.weitijiao(request);
			view.addObject("w", list);
			view.setViewName("adminTeacher");
			return view;
	}
	@RequestMapping("/newexam")
	public ModelAndView newexam(Model model,@RequestParam(defaultValue="1")Integer page) {
		PageInfo<Filedoc> info = fileDocService.timedesc(page);
		model.addAttribute("info", info);
		List<Filedoc> list = info.getList();
		return new ModelAndView("newexam");
		
	}
	@RequestMapping("/combination")
	public ModelAndView  combination() {
		return new ModelAndView("combination");
		
		
	}
	@RequestMapping("/handle")
	public ModelAndView shoudog() {
		ModelAndView view = new ModelAndView("handle");
		view.addObject("types",typeService.list(""));
		return view;
	}
	
	@RequestMapping("/ylan")
	public ModelAndView ylan(String path,Integer id) throws Exception {
		if (path!=null) {
			String replace = path.replace("/file/",this.path);
			Result jiexi = fileDocService.jiexi(replace);
			ModelAndView view = new ModelAndView("ylan");
			view.addObject("jiexi", jiexi);
			return view;
		}else {
			Result jiexi = fileDocService.jiexi(id);
			ModelAndView view = new ModelAndView("ylan");
			view.addObject("jiexi", jiexi);
			return view;
		}
	}
	
	
	
	
}
