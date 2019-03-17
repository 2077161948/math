package cn.ym.controller;

import cn.ym.service.TeacherService;
import cn.ym.util.Cangliang;
import cn.ym.pojo.*;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value="/teacher",produces = "application/json; charset=utf-8")
public class TeacherController {
    @Autowired
    TeacherService teacherService;
     @RequestMapping(value="/add",produces = "application/json; charset=utf-8")
     @ResponseBody
    public String  add(Teacher teacher, HttpServletResponse response,Model  model){
    	 		Boolean add = teacherService.add(teacher);
    	 		if (add) {
					return JSON.toJSONString(new Result());
				}
    	 		Result result = new Result();
    	 		result.setStatus(500);
    	 		result.setMsg("添加失败 账号已被使用");
				return JSON.toJSONString(result);
    	 		
    	 		
    }

    @RequestMapping(value="/list",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String teacherList(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer row,@RequestParam(defaultValue="") String name){
		PageInfo<Teacher> list = teacherService.PageList(page, row, name);
    	return JSON.toJSONString(list);

    }
    
    @RequestMapping(value="/update",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String update(Teacher teacher,HttpServletRequest request) {
    	Teacher attribute =(Teacher)request.getSession().getAttribute(Cangliang.TEACHER);
    	if (attribute==null) {
			return JSON.toJSONString(new Result(500,"请重新登录"));
		}
    			teacher.setId(attribute.getId());
    	Teacher b = teacherService.upd(teacher);
    	request.getSession().setAttribute(Cangliang.TEACHER,b);
		return JSON.toJSONString(new Result());
    	
    }
    
    @ResponseBody
    @RequestMapping(value="/updatepwd",produces = "application/json; charset=utf-8")
    public String updpwd(HttpServletRequest request,String pwd,String newpassword) {
		Teacher attribute = (Teacher)request.getSession().getAttribute(Cangliang.TEACHER);
		attribute.setPwd(pwd);
				if(teacherService.getTeacher(attribute)!=null) {
					attribute.setPwd(newpassword);
					boolean update = teacherService.update(attribute);
					if (update) {
					return JSON.toJSONString(new Result());
					}
					
				}
		
    	return JSON.toJSONString(new Result(500,"修改失败"));    	
    	
    }
    
    
    @RequestMapping("/del")
    @ResponseBody
    public String  delete(Teacher teacher) {
    	teacherService.delete(teacher);
		return JSON.toJSONString(new Result());
    	
    }
    
    @RequestMapping("/login")
    public String login(Teacher teacher, HttpServletResponse response,HttpServletRequest request,Model model) {
    	Teacher rt = teacherService.getTeacher(teacher);
    	if (rt!=null) {;
		request.getSession().setAttribute(Cangliang.TEACHER, rt);
		
		return "redirect:/";
		}
    	model.addAttribute("msg","账号或密码错误");
    		return "login";

	}
    @RequestMapping("/login_out")
    public String loginout(HttpServletRequest request) {
    			request.getSession().removeAttribute(Cangliang.TEACHER);
		return "redirect:index";
	}
}
