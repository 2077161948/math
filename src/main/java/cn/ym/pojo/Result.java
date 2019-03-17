package cn.ym.pojo;

import java.util.HashMap;
import java.util.Map;

public class Result {

	private Integer status=200;
	private String msg="操作成功";
	private Map<String,Object> map=new HashMap<>();
	
	
	public Result(Integer status,String msg,Map<String,Object> map) {
		this.status=status;
		this.map=map;
		this.msg=msg;
	}
	public Result(Integer status,String msg) {
		this.status=status;
		this.msg=msg;
	}
	
	public Result() {
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	} 
	


}
