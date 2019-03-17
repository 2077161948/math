package cn.ym.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.AssAprMapper;
import cn.ym.dao.AssortmentMapper;
import cn.ym.pojo.AssAprExample;
import cn.ym.pojo.AssAprKey;
import cn.ym.pojo.Assortment;
import cn.ym.pojo.AssortmentExample;
import cn.ym.pojo.AssortmentExample.Criteria;
import cn.ym.pojo.Result;
import cn.ym.pojo.Teacher;
import cn.ym.util.Cangliang;

@Service
public class AssormentService {
	
	@Autowired
	AssortmentMapper assortmentMapper;
	
	@Autowired
	AssAprMapper aprMapper;
	
	public Result Add(Assortment assortment,HttpServletRequest request) {
	AssortmentExample example=new AssortmentExample();
	Criteria criteria = example.createCriteria();
	criteria.andNodecodeEqualTo(assortment.getNodename());
		List<Assortment> list = assortmentMapper.selectByExample(example);
	
		if (list.size()>0) {
			return new Result(500,"已有知识点");
		}
		assortmentMapper.insert(assortment);
		return new Result();
		
	}
	public Result update(Assortment assortment) {
		assortmentMapper.updateByPrimaryKey(assortment);
		return new Result();
		
	}
	
	public Result delete(Integer id) {
		AssAprExample example=new AssAprExample();
		cn.ym.pojo.AssAprExample.Criteria criteria = example.createCriteria();
		criteria.andAidEqualTo(id);
		List<AssAprKey> list = aprMapper.selectByExample(example);
		if (list.size()>0) {
			return new Result(500,"不能删除");
		}
		assortmentMapper.deleteByPrimaryKey(id);
		return new Result();
		
	}
	
	public PageInfo<Assortment> select(String name,Integer page,Integer row) {
		PageHelper.startPage(page,row);
		AssortmentExample example=new AssortmentExample();
				Criteria criteria = example.createCriteria();
				criteria.andNodenameLike("%"+name+"%");
		List<Assortment> list = assortmentMapper.selectByExample(example);
			PageInfo<Assortment> pageInfo=new PageInfo<Assortment>(list);
		return pageInfo;
		
	}
	
	public List<Assortment> selectList(Integer status){
	
		AssortmentExample example=new AssortmentExample();
				Criteria criteria = example.createCriteria();
				criteria.andStatusEqualTo(status);
				example.setOrderByClause("parentId asc ");
		List<Assortment> list = assortmentMapper.selectByExample(example);
		
		return list;
		
	}
	
	public Assortment select(Integer id) {
		return assortmentMapper.selectByPrimaryKey(id);
		
	}
	
	public Result selectparent(Integer parentid) throws Exception {
		AssortmentExample example=new AssortmentExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentidEqualTo(parentid);
List<Assortment> list = assortmentMapper.selectByExample(example);
Result result = new Result();
result.getMap().put("list", list);
		return result;
		
	}

}
