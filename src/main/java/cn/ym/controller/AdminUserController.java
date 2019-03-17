package cn.ym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import cn.ym.pojo.Result;
import cn.ym.pojo.Teacher;
import cn.ym.service.TeacherService;

@Controller
@RequestMapping("/Admin")
public class AdminUserController {
	@Autowired
	TeacherService teacherService;
	@RequestMapping("/index")
	public String start() {
		return "/admin";
		
	}
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public ModelAndView getTeacher(Teacher teacher,
			ModelAndView view,
			@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="10")Integer row,
			@RequestParam(defaultValue="")String name){
		view.setViewName("teacher");
		PageInfo<Teacher> list = teacherService.PageList(page, row,name);
		view.addObject("list", list);
		return view;
		
	}
	@ResponseBody
	@RequestMapping(value="/get/{obj}",method=RequestMethod.GET)
	public String getTeacher(@PathVariable("obj")Integer id) {
		Teacher teacher = teacherService.getTeacher(id);
		return JSON.toJSONString(teacher);
	}
	@RequestMapping(value="/user",method=RequestMethod.DELETE)
	public String DeleteTeacher(Teacher teacher) {
		teacherService.delete(teacher);
		return JSON.toJSONString(new Result());
	}
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public  void UpdateTeacher(Teacher teacher) {
		if (!StringUtils.isEmpty(teacher.getPwd())) {
			teacherService.update(teacher);
			teacher.setPwd(null);
		}
		teacherService.update(teacher);
		
	}

}
