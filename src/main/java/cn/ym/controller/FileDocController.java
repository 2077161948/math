package cn.ym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import cn.ym.pojo.Aproblem;
import cn.ym.pojo.Filedoc;
import cn.ym.service.FileDocService;
@Controller
@RequestMapping("/doc")
public class FileDocController {
	
		@Autowired
		FileDocService fileDocService;
		@RequestMapping("/eq")
	public ModelAndView eq(String eq,Model model) {
		PageInfo<Filedoc> info = fileDocService.Get(eq);
		model.addAttribute("info", info);
		List<Filedoc> list = info.getList();
		return new ModelAndView("newexam");
		
	}
		@RequestMapping("/see")
		public ModelAndView list(List<Integer> ids) {
			List<Aproblem> list = fileDocService.dList(ids);
			ModelAndView view = new ModelAndView("see");
			view.addObject("see", list);
			return view;
			
			
		}
		

}
