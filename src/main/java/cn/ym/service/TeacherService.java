package cn.ym.service;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.TeacherMapper;
import cn.ym.pojo.*;
import cn.ym.pojo.TeacherExample.Criteria;

import java.util.List;
import java.util.UUID;

@Service
public class TeacherService  {

		@Autowired
		TeacherMapper teacherMapper;
		
		public Boolean add(Teacher teacher) {
			TeacherExample example=new TeacherExample();
			Criteria criteria = example.createCriteria();
			criteria.andEmailEqualTo(teacher.getEmail());
		List<Teacher> list = teacherMapper.selectByExample(example);
		if (list.size()==0) {
			String string = UUID.randomUUID().toString();
			teacher.setYan(string);
			String md5Hex = DigestUtils.md5Hex(teacher.getPwd()+string);
			teacher.setPwd(md5Hex);
			teacherMapper.insertSelective(teacher);
			return true;
		}
			return false;
		
			
		}

		public boolean update(Teacher teacher) {
			String string = UUID.randomUUID().toString();
			teacher.setYan(string);
			String md5Hex = DigestUtils.md5Hex(teacher.getPwd()+string);
			teacher.setPwd(md5Hex);
			teacherMapper.updateByPrimaryKeySelective(teacher);
			return true;
		}
		
		public Teacher upd(Teacher teacher) {
			teacherMapper.updateByPrimaryKeySelective(teacher);
			
			return teacherMapper.selectByPrimaryKey(teacher.getId());
			
			
		}
		
		public Teacher getTeacher(Teacher teacher) {
			TeacherExample example=new TeacherExample();
			Criteria criteria = example.createCriteria();
			criteria.andEmailEqualTo(teacher.getEmail());
		List<Teacher> list = teacherMapper.selectByExample(example);
		if (list.size()!=0) {
			Teacher rTeacher = list.get(0);
			if(rTeacher.getPwd().equals(DigestUtils.md5Hex(teacher.getPwd()+rTeacher.getYan()))){
				return rTeacher;
			}
		}
			return null;
			
		}
		
		
		public Teacher  getTeacher(Integer id) {
			return teacherMapper.selectByPrimaryKey(id);
			
		}
		public boolean delete(Teacher teacher) {
			teacherMapper.deleteByPrimaryKey(teacher.getId());
			return false;
			
		}
		
		public PageInfo<Teacher> PageList(Integer page,Integer row,String name) {
			PageHelper.startPage(page, row);
			TeacherExample example=new TeacherExample();
			Criteria criteria = example.createCriteria();
			criteria.andNameLike("%"+name+"%");
			example.or().andEmailLike("%"+name+"%");
			List<Teacher> list = teacherMapper.selectByExample(example);
			PageInfo<Teacher> info=new PageInfo<Teacher>(list);
			return info;
			
		}
		public PageInfo<Teacher> PageList(Integer page,Integer row,Integer id ) {
			PageHelper.startPage(page, row);
			TeacherExample example=new TeacherExample();
			Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(id);
			List<Teacher> list = teacherMapper.selectByExample(example);
			PageInfo<Teacher> info=new PageInfo<Teacher>(list);
			return info;
			
		}
		

}
