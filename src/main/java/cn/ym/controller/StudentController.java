package cn.ym.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ym.pojo.*;
import cn.ym.service.StudentService;
import cn.ym.util.Cangliang;

import com.alibaba.fastjson.JSON;




@Controller
@RequestMapping(value="/student",produces = "application/json; charset=utf-8")
public class StudentController {
	
	
	@Autowired
	StudentService service;
	
	@RequestMapping(value="/add",produces = "application/json; charset=utf-8")
	public String zhuche(Student student,HttpServletResponse response,Model model) throws Exception {
		Result result = service.Add(student);
		if (result.getStatus()==200) {
			return "login";
		}
			model.addAttribute("msg", result);
		return "register";
		
	}
	
	
	@RequestMapping("/login")
	public String login(Student student,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
		Student stu= service.getStudnt(student);
		
		if (stu!=null) {
			request.getSession().setAttribute(Cangliang.STUDENT, student);
			if (student.getStudnetname()!=null&&student.getStudnetname().trim().equalsIgnoreCase("")) {
				model.addAttribute("name", student.getStudnetname());
			}else {
				model.addAttribute("name", student.getStudentid());
			}
			
			return "redirect:/";
		}
		model.addAttribute("msg","账号或密码错误");
		return "login";
		
	}
	@ResponseBody
	@RequestMapping("/email")
	public String email(@RequestParam("email")String email) {
		Result result = service.changeemail(email);
		return JSON.toJSONString(result);
		
	}
	
	@ResponseBody
	@RequestMapping("/change")
	public String change(Student student) {
		Student stu = service.get(student.getStudentid());
		stu.setStudentpwd(student.getStudentpwd());
		boolean update = service.update(stu);
		return JSON.toJSONString(new Result());
		
	}



}
