package cn.ym.controller;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.ym.dao.AssortmentMapper;
import cn.ym.pojo.Assortment;
import cn.ym.pojo.AssortmentExample;
import cn.ym.pojo.AssortmentExample.Criteria;

@Controller
@RequestMapping(value="/assort",produces = "application/json; charset=utf-8")
public class AssortmentController {
	
	
	@Autowired
	AssortmentMapper assortmentMapper;
	
	@ResponseBody
	@RequestMapping(value="/three",produces = "application/json; charset=utf-8")
	public String three(@RequestParam(name="status",defaultValue="1")Integer status) {
		AssortmentExample example = new AssortmentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
		example.setOrderByClause("id asc");
		List<Assortment> list = assortmentMapper.selectByExample(example);
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
	
		return JSON.toJSONString(tList);
	}

}
