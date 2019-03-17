package cn.ym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.CommonMapper;
import cn.ym.dao.FiledocMapper;
import cn.ym.pojo.Common;
import cn.ym.pojo.CommonExample;
import cn.ym.pojo.CommonExample.Criteria;
import cn.ym.pojo.Filedoc;
import cn.ym.pojo.FiledocExample;

@Service
public class CommonService {
	
	@Autowired
	CommonMapper commonMapper;
		@Autowired
		FiledocMapper filedocMapper;
	
	public boolean Add(Common common) {
		commonMapper.insert(common);
		return true;
		
	}
	
	public  boolean del(Integer id) {
		commonMapper.deleteByPrimaryKey(id);
		return true;
	}
	public boolean update(Common common) {
		commonMapper.updateByPrimaryKey(common);
		return true;
	}

	public PageInfo<Filedoc> pageList(String name,Integer page,Integer row) {
		PageHelper.startPage(page,row);
FiledocExample filedocExample = new FiledocExample();
cn.ym.pojo.FiledocExample.Criteria criteria = filedocExample.createCriteria();
criteria.andUploadinfoEqualTo(name);
List<Filedoc> list = filedocMapper.selectByExample(filedocExample);
		PageInfo<Filedoc> pageInfo=new PageInfo<>(list);
		return pageInfo;
		
	}
	
}
