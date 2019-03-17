package cn.ym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.FiledocMapper;
import cn.ym.pojo.Filedoc;
import cn.ym.pojo.FiledocExample;
import cn.ym.pojo.Result;
import cn.ym.pojo.FiledocExample.Criteria;

@Service
public class AdminFiledocService {

	@Autowired
	FiledocMapper filedocMapper;
	
	public PageInfo<Filedoc> getList(Integer page,Integer num,String name){
		PageHelper.startPage(page, num);
		FiledocExample example=new FiledocExample();
		Criteria criteria = example.createCriteria();
		criteria.andFilenameLike("%"+name+"%");
		List<Filedoc> list = filedocMapper.selectByExample(example);
		PageInfo<Filedoc> info=new PageInfo<>(list);
		return info;
		
	}
	
	public Filedoc get(Integer id) {
		Filedoc key = filedocMapper.selectByPrimaryKey(id);
		return key;
		
	}
	
	public Result update(Filedoc filedoc) {
		filedocMapper.updateByPrimaryKeySelective(filedoc);
		return new Result();
	}
	
	public Result del(List<Integer> ids) {
		FiledocExample example=new FiledocExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		filedocMapper.deleteByExample(example);
		return new Result();
	}
	
	
}
