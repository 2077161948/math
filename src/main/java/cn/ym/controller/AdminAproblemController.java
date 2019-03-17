package cn.ym.controller;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

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

import cn.ym.dao.AproblemMapper;
import cn.ym.pojo.Aproblem;
import cn.ym.pojo.AproblemExample;
import cn.ym.pojo.Assortment;
import cn.ym.pojo.Questiontype;
import cn.ym.pojo.Result;
import cn.ym.pojo.AproblemExample.Criteria;
import cn.ym.service.AssormentService;
import cn.ym.service.QuestiontypeService;

@Controller
@RequestMapping("/Admin")
public class AdminAproblemController {

	@Autowired
	QuestiontypeService typeService;
	
	@Autowired
	AssormentService  assormentService;
	
	@Autowired
	AproblemMapper aproblemMapper;
	@RequestMapping(value="/aproblem",method=RequestMethod.GET)
	public ModelAndView Get(@RequestParam(defaultValue="1")Integer page
			,@RequestParam(defaultValue="10")Integer num
			,Aproblem aproblem) {
		ModelAndView view = new ModelAndView("/Aproblem");
		view.addObject("aproblem", aproblem);
		PageHelper.startPage(page,num);
		AproblemExample example=new AproblemExample();
		if (aproblem.getQuestiontypeId()!=null||aproblem.getZj()!=null||aproblem.getZsd()!=null) {
			
		
		Criteria criteria = example.createCriteria();
		
		if(aproblem.getQuestiontypeId()!=null) {
		criteria.andQuestiontypeIdEqualTo(aproblem.getQuestiontypeId());	
		}
		if (aproblem.getZj()!=null) {
			criteria.andZjEqualTo(aproblem.getZj());
		}
		if (aproblem.getZsd()!=null) {
			criteria.andZsdEqualTo(aproblem.getZsd());
		}
		}
		List<Aproblem> Apr = aproblemMapper.selectByExample(example);
		PageInfo<Aproblem> info=new PageInfo<Aproblem>(Apr);
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
		view.addObject("list",info);
		view.addObject("types", r);
		view.addObject("zj",zj);
		view.addObject("zsd", zsd);
		
		return view;
		
	}
	@ResponseBody
	@RequestMapping(value="/aproblem",method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	public String update(Aproblem aproblem) {
	aproblemMapper.updateByPrimaryKeySelective(aproblem);
		return JSON.toJSONString(new Result());
		
	}
	@ResponseBody
	@RequestMapping(value="/aproblem/{ids}",method=RequestMethod.DELETE,produces = "application/json; charset=utf-8")
	public String  del(@PathVariable("ids")Integer ids) {
		AproblemExample example = new AproblemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(ids);
		aproblemMapper.deleteByExample(example);
		return JSON.toJSONString(new Result()); 
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
