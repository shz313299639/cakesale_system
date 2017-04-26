package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AllBean;
import bean.InsertUpdateDelBean;

public class DelServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		
		String sql = "";
		String str = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		AllBean ab = new AllBean();
		
		String adminid = request.getParameter("adminid");
		String mark = request.getParameter("mark");
		String users = request.getParameter("users");
		String products = request.getParameter("products");
		String orders = request.getParameter("orders");
		String liuyan= request.getParameter("liuyan");
		if(adminid != null && !adminid.equals("")){
			str = "/admin/adminlist.jsp";
			sql = "delete from admin where id="+adminid;
			if(adminid.equals("1")){
				request.setAttribute("message", "系统管理员不能删除！");
			}else{
				ib.insertANDupdateANDdel(sql);
				request.setAttribute("message", "操作成功！");
			}
		}
		
		if(users != null && !users.equals("")){
			str = "/admin/userlist.jsp";
			sql = "delete from users where id="+users;
			ib.insertANDupdateANDdel(sql);
			ArrayList al = ab.getUserOrder(users);
			for(int i = 0;i < al.size();i++){
				ArrayList alRow = (ArrayList)al.get(i);
				sql = "delete from xiangxi where ordersid="+alRow.get(0);
				ib.insertANDupdateANDdel(sql);
			}
			sql = "delete from orders where usersid="+users;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(products != null && !products.equals("")){
			str = "/admin/products_list.jsp";
			sql = "delete from xianhua where id="+products;
			ib.insertANDupdateANDdel(sql);
			sql = "delete from xiangxi where xianhuaid="+products;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		if(liuyan != null && !liuyan.equals("")){
			str = "/admin/liuyanlist.jsp";
			sql = "delete from liuyan where id="+liuyan;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		if(orders != null && !orders.equals("")){
			str = "/admin/orders.jsp";
			sql = "delete from orders where id="+orders;
			System.out.println("\nbookCase*********************action="+sql);
			ib.insertANDupdateANDdel(sql);
			sql = "delete from xiangxi where ordersid="+orders;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "操作成功！");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(str);
        rd.forward(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
