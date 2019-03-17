package cn.ym.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Queue;
import java.util.Random;

import javax.persistence.Id;

import org.apache.poi.xwpf.usermodel.XWPFDocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ym.dao.AproblemMapper;
import cn.ym.dao.AssAprMapper;
import cn.ym.dao.AssortmentMapper;
import cn.ym.pojo.Aproblem;
import cn.ym.pojo.AproblemExample;
import cn.ym.pojo.AssAprExample;
import cn.ym.pojo.AssAprExample.Criteria;
import cn.ym.pojo.AssAprKey;
import cn.ym.pojo.Assortment;
import cn.ym.pojo.AssortmentExample;
import cn.ym.pojo.Result;
import cn.ym.pojo.Tm;
import cn.ym.util.ConvertOutHtml;

@Service
public class AproblemService {

	@Value("${filepath}")
	public   String  path="";
	
	@Autowired
	AssortmentMapper assortmentMapper;
	@Autowired
	AproblemMapper aproblemMapper;
	@Autowired
	AssAprMapper aprMapper;
	
	@Autowired
	ConvertOutHtml convertOutHtml;

	/**
	 * 
	 * @param aproblem
	 *            题目
	 * @param pid
	 *            知识点 ids
	 * @return
	 */
	public Result add(Aproblem aproblem) {
		aproblemMapper.insertSelective(aproblem);
		return new Result();

	}

	/**
	 * 
	 * @param ids
	 *            题目ids
	 * 
	 * @return
	 */
	public Result delete(List<Integer> ids) {
		AssAprExample example = new AssAprExample();
		Criteria criteria = example.createCriteria();
		criteria.andAidIn(ids);
		aprMapper.deleteByExample(example);
		AproblemExample aexample = new AproblemExample();
		cn.ym.pojo.AproblemExample.Criteria criteria2 = aexample.createCriteria();
		criteria2.andIdIn(ids);
		aproblemMapper.deleteByExample(aexample);
		return new Result();

	}

	/**
	 * 根据知识点得到题目
	 * 
	 * @param ids
	 *            知识点
	 * @param questiontypeId
	 *            题型
	 * @return
	 */
	public PageInfo<Aproblem> List(Integer page, Integer row, List<Integer> ids, Integer questiontypeId,
			Integer fileid) {
		PageHelper.startPage(page, row);
		AssAprExample example = new AssAprExample();
		Criteria criteria = example.createCriteria();
		AproblemExample aexample = new AproblemExample();
		cn.ym.pojo.AproblemExample.Criteria criteria2 = aexample.createCriteria();
		if (ids != null && ids.size() > 0) {
			example.setDistinct(true);
			criteria.andPidIn(ids);
			List<AssAprKey> list = aprMapper.selectByExample(example);

			ArrayList<Integer> id = new ArrayList<Integer>();
			list.forEach(x -> {
				id.add(x.getAid());
			});
			criteria2.andIdIn(id);
		}
		if (questiontypeId != null) {
			criteria2.andQuestiontypeIdEqualTo(questiontypeId);
		}
		if (fileid != null) {
			criteria2.andFiledocIdEqualTo(fileid);
		}

		List<Aproblem> byExample = aproblemMapper.selectByExample(aexample);
		PageInfo<Aproblem> pageInfo = new PageInfo<Aproblem>(byExample);

		return pageInfo;

	}

	/**
	 * 根据知识点随机选题
	 * 
	 * @param ids
	 * @param questiontypeId
	 * @param size
	 *            题目数量
	 * @return
	 */
	public Result List(List<Integer> ids, Integer questiontypeId, Integer size) {
		AssAprExample example = new AssAprExample();
		Criteria criteria = example.createCriteria();
		AproblemExample aexample = new AproblemExample();
		cn.ym.pojo.AproblemExample.Criteria criteria2 = aexample.createCriteria();
		if (ids != null && ids.size() > 0) {
			example.setDistinct(true);
			criteria.andPidIn(ids);
			List<AssAprKey> list = aprMapper.selectByExample(example);

			ArrayList<Integer> id = new ArrayList<Integer>();
			list.forEach(x -> {
				id.add(x.getAid());
			});
			criteria2.andIdIn(id);
		}
		if (questiontypeId != null) {
			criteria2.andQuestiontypeIdEqualTo(questiontypeId);
		}

		List<Aproblem> byExample = aproblemMapper.selectByExample(aexample);
		ArrayList<Object> redom = new ArrayList<>();

		for (int i = 0; i < size && byExample.size() > 0; i++) {
			int k = (int) (Math.random() * byExample.size());
			Aproblem aproblem = byExample.get(k);
			byExample.remove(k);
			redom.add(aproblem);
		}

		Result result = new Result();
		result.getMap().put("list", redom);
		return result;

	}

	public Boolean update(Aproblem aproblem, List<Integer> pid) {
		Integer id = aproblem.getId();
		AssAprExample example = new AssAprExample();
		Criteria criteria = example.createCriteria();
		criteria.andAidEqualTo(id);
		aprMapper.deleteByExample(example);
		example.clear();
		for (Integer integer : pid) {
			AssAprKey key = new AssAprKey();
			key.setAid(id);
			key.setPid(integer);
			aprMapper.insertSelective(key);
		}
		aproblemMapper.updateByPrimaryKeySelective(aproblem);
		return true;

	}

	public PageInfo<Aproblem> result(Integer types,Integer ass ,Integer status,Integer pagesize,Integer page ){
		PageHelper.startPage(page, pagesize);
		AproblemExample example = new AproblemExample();
		cn.ym.pojo.AproblemExample.Criteria criteria = example.createCriteria();
		
		if (status==1) {
			criteria.andZsdIn(getids(ass));

		}else {
			criteria.andZjIn(getids(ass));
			
		}
	criteria.andQuestiontypeIdEqualTo(types);
			List<Aproblem> list = aproblemMapper.selectByExample(example);
		PageInfo<Aproblem> info = new PageInfo<>(list);
		return info;
		
	}
	
	public List<Aproblem> result(String data, Integer status) {
		List<Tm> list = JSON.parseArray(data, Tm.class);
		AproblemExample example = new AproblemExample();
	
		List<Aproblem> r = new ArrayList<>();
		cn.ym.pojo.AproblemExample.Criteria criteria = example.createCriteria();
		for (Tm tm : list) {
			criteria=example.createCriteria();
			if (status == 0) {
				criteria.andZsdEqualTo(tm.getTypes());

			} else if (status == 1) {
				criteria.andZjEqualTo(tm.getTypes());
			}

			criteria.andQuestiontypeIdEqualTo(1);
			r.addAll(getRandomList(aproblemMapper.selectByExample(example), tm.getXzt()));
			example.clear();
			// 选择题 1
			criteria = example.createCriteria();
			if (status == 0) {
				criteria.andZsdEqualTo(tm.getTypes());

			} else if (status == 1) {
				criteria.andZjEqualTo(tm.getTypes());
			}
			criteria.andQuestiontypeIdEqualTo(2);
			r.addAll(getRandomList(aproblemMapper.selectByExample(example), tm.getTkt()));
			example.clear();
			criteria = example.createCriteria();
			// 填空题 2
			if (status == 0) {
				criteria.andZsdEqualTo(tm.getTypes());

			} else if (status == 1) {
				criteria.andZjEqualTo(tm.getTypes());
			}
			criteria.andQuestiontypeIdEqualTo(4);
			r.addAll(getRandomList(aproblemMapper.selectByExample(example), tm.getPdt()));
			example.clear();
			criteria = example.createCriteria();

			// 判断题 4
			if (status == 0) {
				criteria.andZsdEqualTo(tm.getTypes());

			} else if (status == 1) {
				criteria.andZjEqualTo(tm.getTypes());
			}
			criteria.andQuestiontypeIdEqualTo(5);
			r.addAll(getRandomList(aproblemMapper.selectByExample(example), tm.getPdt()));
			example.clear();
			// 计算题 5
			criteria = example.createCriteria();
			if (status == 0) {
				criteria.andZsdEqualTo(tm.getTypes());

			} else if (status == 1) {
				criteria.andZjEqualTo(tm.getTypes());
			}
			criteria.andQuestiontypeIdEqualTo(6);
			r.addAll(getRandomList(aproblemMapper.selectByExample(example), tm.getJst()));
			example.clear();

			// 证明题 6
			criteria = example.createCriteria();
			if (status == 0) {
				criteria.andZsdEqualTo(tm.getTypes());

			} else if (status == 1) {
				criteria.andZjEqualTo(tm.getTypes());
			}
			criteria.andQuestiontypeIdEqualTo(7);
			r.addAll(getRandomList(aproblemMapper.selectByExample(example), tm.getJdt()));
			example.clear();
			// 解答题 7

		}
		return r;

	}
	
	public List<Aproblem> GetList(List<Integer> id) {
		AproblemExample example = new AproblemExample();
		cn.ym.pojo.AproblemExample.Criteria criteria = example.createCriteria();
		criteria.andIdIn(id);
		List<Aproblem> list = aproblemMapper.selectByExample(example);
		return list;
		
	}

	public static List getRandomList(List paramList, int count) {
		if (paramList.size() < count) {
			return paramList;
		}
		Random random = new Random();
		List<Integer> tempList = new ArrayList<Integer>();
		List<Object> newList = new ArrayList<Object>();
		int temp = 0;
		for (int i = 0; i < count; i++) {
			temp = random.nextInt(paramList.size());// 将产生的随机数作为被抽list的索引
			if (!tempList.contains(temp)) {
				tempList.add(temp);
				newList.add(paramList.get(temp));
			} else {
				i--;
			}
		}
		return newList;
	}

	private List<Integer> getids(Integer id) {
		Queue<Integer> queue=new ArrayDeque<>();
		queue.add(id);
		ArrayList<Integer> list = new ArrayList<>();
		 AssortmentExample example = new	AssortmentExample ();
		 while(queue.size()>0) {
			example.clear();
			 cn.ym.pojo.AssortmentExample.Criteria criteria = example.createCriteria();
			 Integer p = queue.poll();
		 criteria.andParentidEqualTo(p);
		 	List<Assortment> i = assortmentMapper.selectByExample(example);
		 		for (Assortment assortment : i) {
					queue.add(assortment.getId());
				}
		 		if (i.size()==0) {
					list.add(p);
				}
		 }
		return list;
		
	}
	
	
	
	public Result del(Integer id) {
		aproblemMapper.deleteByPrimaryKey(id);
		return new Result();
		
	}
	public File zj(ArrayList<Integer> id) throws Exception {
		
	       			File file = File.createTempFile("数学试题", ".docx");
	       			FileOutputStream stream = new FileOutputStream(file);
				AproblemExample example = new AproblemExample();
				cn.ym.pojo.AproblemExample.Criteria criteria = example.createCriteria();
				criteria.andIdIn(id);
				XWPFDocument  ex = new XWPFDocument ();
				List<Aproblem> list = aproblemMapper.selectByExample(example);
				Collections.sort(list, new Comparator<Aproblem>() {

					@Override
					public int compare(Aproblem o1, Aproblem o2) {
						return o1.getQuestiontypeId()-o2.getQuestiontypeId();
					}
				});
				int x=1;
				for (Aproblem aproblem : list) {
					String body = aproblem.getBody();
					convertOutHtml.upload(body, ex,x);
					
				}
				x=1;
				 ex.createParagraph().createRun().setText("参考答案");
				for (Aproblem aproblem : list) {
					String analysis = aproblem.getAnalysis();
					convertOutHtml.upload(analysis, ex,x);
				}
				ex.write(stream);
		return file;
		
	}
	
}
