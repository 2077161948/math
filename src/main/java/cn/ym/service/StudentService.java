package cn.ym.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.StudentMapper;
import cn.ym.pojo.Result;
import cn.ym.pojo.Student;
import cn.ym.pojo.StudentExample;
import cn.ym.pojo.StudentExample.Criteria;

@Service
public class StudentService {
	
    @Autowired
    private JavaMailSender javaMailSender;// 在spring中配置的邮件发送的bean
	@Autowired
	StudentMapper studentMapper;
	
	
	public Result Add(Student student) {
		StudentExample example=new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentidEqualTo(student.getStudentid());
		List<Student> list = studentMapper.selectByExample(example);
		if (list.size()>0) {
			return new Result(500,"账号已经存在");
					
		}
		String string = UUID.randomUUID().toString();
		student.setYan(string);
		String md5Hex = DigestUtils.md5Hex(student.getStudentpwd()+string);
		student.setStudentpwd(md5Hex);
		student.setCreatetime(new Date());
		studentMapper.insertSelective(student);
		
		return new Result();
		
	}
	public Student getStudnt(Student student) {
		StudentExample example=new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentidEqualTo(student.getStudentid());
		List<Student> list = studentMapper.selectByExample(example);
		if (list.size()==0) {
			return null;
		}
		Student stu = list.get(0);
		if(stu.getStudentpwd().equals(DigestUtils.md5Hex(student.getStudentpwd()+stu.getYan()))){
			return stu ;
		}	
		return null;
	}
	
	public boolean update(Student student) {
		String string = UUID.randomUUID().toString();
		student.setYan(string);
		String md5Hex = DigestUtils.md5Hex(student.getStudentpwd()+string);
		student.setStudentpwd(md5Hex);
		studentMapper.updateByPrimaryKeySelective(student);
		return true;
		
	}
	
	public boolean delete(List<Integer> ids) {
		StudentExample example=new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		studentMapper.deleteByExample(example);
		return true;
		
	}
	
	public PageInfo<Student>  PageList(Integer page,Integer row,String id) {
	PageHelper.startPage(page,row);
	StudentExample example=new StudentExample();
	Criteria criteria = example.createCriteria();
	criteria.andStudentidLike("%"+id+"%");
	List<Student> list = studentMapper.selectByExample(example);
	PageInfo<Student> pageInfo=new PageInfo<>(list);
		return pageInfo;
		
	}
	
	public Result changeemail(String Eemail) {
        SimpleMailMessage mailMessag = new SimpleMailMessage();
       String x="A"+((int)(Math.random()*1000000))+"A";
        mailMessag.setSubject("你好！本次验证为:"+x);
        mailMessag.setText("");
        mailMessag.setTo(Eemail);
        mailMessag.setFrom("2077161948@qq.com");
        javaMailSender.send(mailMessag);
		return new Result(200,x);
		
	}
	public  Student get(String email) {
		StudentExample example=new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentidEqualTo(email);
		List<Student> list = studentMapper.selectByExample(example);
		if (list.size()==0) {
			return null;
		}
		return list.get(0);
		
	}

}
