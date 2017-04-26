package bean;

import java.util.ArrayList;

public class AdminListBean {
	SelectBean sb = new SelectBean();
	
	public ArrayList getAdminList(){
		String sql = "select * from admin where id<>1 order by id desc";
		String args[] = {"id","name","pwd","reallyname","sex","qq","email","phone","address","postcode","shengri","xueli","shenfen"};
		ArrayList al = sb.select(sql, args);
		return al;
	}
}
