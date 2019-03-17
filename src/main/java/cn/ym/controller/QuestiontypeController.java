package cn.ym.controller;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ym.pojo.Questiontype;
import cn.ym.pojo.Result;

@Component
@RequestMapping(value="/type",produces = "application/json; charset=utf-8")
public class QuestiontypeController {
	@RequestMapping(value="/list")
	public Result List() {
		return null;
		
	}
	@RequestMapping("/add")
	public Result add(Questiontype type) {
		return null;
		
	}
	@RequestMapping("/update")
	public Result update(Questiontype type) {
		return null;
		
	}
	@RequestMapping("/delete")
	public Result delete(Questiontype type) {
		return null;
		
	}
	@RequestMapping("/getApro")
	public Result getAproblem(Questiontype type) {
		return null;
		
	}
	

}
