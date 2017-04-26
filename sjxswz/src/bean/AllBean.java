package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getUser(){
		String sql = "select * from users order by id desc";
		String args[] = {"id","name","pwd","reallyname","sex","qq","email","phone","address","postcode"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getUser(String id){
		String sql = "select * from users where id="+id;
		String args[] = {"id","name","pwd","reallyname","sex","qq","email","phone","address","postcode"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getXianhua(){
		String sql = "select * from xianhua order by id desc";
		String args[] = {"id","name","leibie","chailiao","baozhuang","huayu","fushong","price","shuoming","img","kuchun"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getXianhua(String id){
		String sql = "select * from xianhua where id="+id;
		String args[] = {"id","name","leibie","chailiao","baozhuang","huayu","fushong","price","shuoming","img","kuchun"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getDandu(String id){
		String sql = "select * from dandu where id="+id;
		String args[] = {"id","content"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getLeibie(){
		String sql = "select leibie from xianhua group by leibie";
		String args[] = {"leibie"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getXianhuashou(String str){
		String sql = "select * from xianhua "+str+" order by id desc";
		String args[] = {"id","name","leibie","chailiao","baozhuang","huayu","fushong","price","shuoming","img","kuchun"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getLiuyan(){
		String sql = "select * from liuyan order by id desc";
		String args[] = {"id","name","phone","email","neirong","huifu","shijian"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getLiuyan(String id){
		String sql = "select * from liuyan where id="+id;
		String args[] = {"id","name","phone","email","neirong","huifu","shijian"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getUserOrder(String id){
		String sql = "select * from orders where usersid="+id+" order by id desc";
		String args[] = {"id","usersid","shijian","fahuo","huifu","adminid","yeji"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getXiangxi(String id){
		String sql = "select * from xiangxi where ordersid="+id+" order by id desc";
		String args[] = {"id","ordersid","xianhuaid","sums"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getOrder(){
		String sql = "select * from orders order by id desc";
		String args[] = {"id","usersid","shijian","fahuo","huifu","adminid","yeji"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getJiandan(String str){
		String sql = "select * from xianhua where name like '%"+str+"%' order by id desc";
		String args[] = {"id","name","leibie","chailiao","baozhuang","huayu","fushong","price","shuoming","img","kuchun"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getUseryeji(String adminid){
		String sql = "select * from orders where adminid="+adminid+" order by id desc";
		String args[] = {"id","usersid","shijian","fahuo","huifu","adminid","yeji"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getUseryeji(String adminid,String str){
		String sql = "select * from orders where adminid="+adminid+" and "+str+" order by id desc";
		String args[] = {"id","usersid","shijian","fahuo","huifu","adminid","yeji"};
		al = sb.select(sql, args);
		return al;
	}
}
