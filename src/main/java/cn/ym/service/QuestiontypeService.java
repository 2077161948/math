package cn.ym.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.QuestiontypeMapper;
import cn.ym.pojo.Questiontype;
import cn.ym.pojo.QuestiontypeExample;
import cn.ym.pojo.Result;
import cn.ym.pojo.Teacher;
import cn.ym.pojo.QuestiontypeExample.Criteria;
import cn.ym.util.Cangliang;

@Service
public class QuestiontypeService {
	

	@Autowired
	QuestiontypeMapper questiontypeMapper;
/**
 * 添加
 * @param questiontype
 * @param servletRequest
 * @return
 */
	public Result add(Questiontype questiontype,HttpServletRequest servletRequest) {
		QuestiontypeExample example=new QuestiontypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(questiontype.getName());
		List<Questiontype> list = questiontypeMapper.selectByExample(example);
		if (list.size()>0) {
			return new Result(500,"已有题型");
		}
		Teacher teacher= (Teacher)servletRequest.getSession().getAttribute(Cangliang.TEACHER);
		if (teacher==null) {
			return new Result(500,"已有题型");
		}
		questiontype.setTeacherId(teacher.getId());
		questiontype.setCreatetime(new Date());
		questiontypeMapper.insert(questiontype);
		return new Result();
		
	}
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public Result delete(List<Integer> ids) {
		QuestiontypeExample example=new QuestiontypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		questiontypeMapper.deleteByExample(example);
		return new Result();
		
	}
	/**
	 * 分页查
	 * @param page
	 * @param row
	 * @param name
	 * @return
	 */
	public PageInfo<Questiontype> PageList(Integer page,Integer row,String  name) {
		PageHelper.startPage(page,row);
		QuestiontypeExample example=new QuestiontypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameLike("%"+name+"%");
		List<Questiontype> list = questiontypeMapper.selectByExample(example);
		PageInfo<Questiontype> pageInfo=new PageInfo<>(list);
		return pageInfo;
		
	}
	/**
	 * 查全部
	 * @param name
	 * @return
	 */
	public List<Questiontype> list(String  name) {
		QuestiontypeExample example=new QuestiontypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameLike("%"+name+"%");
		List<Questiontype> list = questiontypeMapper.selectByExample(example);
		return list;
		
	}
	/**
	 * 修改
	 * @param questiontype
	 * @return
	 */
	public Result update(Questiontype questiontype) {
		questiontypeMapper.updateByPrimaryKeySelective(questiontype);
		return new Result();
		
	}
	
	public Questiontype get(Integer id) {
		return questiontypeMapper.selectByPrimaryKey(id);
		
	}
	
}
