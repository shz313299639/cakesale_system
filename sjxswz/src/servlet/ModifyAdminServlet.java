package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;

public class ModifyAdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyAdminServlet() {
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
		
		String mark = request.getParameter("mark");
		
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "";
		String str = "";
		
		HttpSession  session = request.getSession();
		ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
		
		if(mark != null && mark.equals("password")){
			String newpwd = request.getParameter("newpwd");
			str = "/admin/modifypwd.jsp";
			sql = "update admin set pwd='"+newpwd+"' where id="+adminlogin.get(0);
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "密码修改成功！");
			adminlogin.set(2, newpwd);
		}
		if(mark != null && mark.equals("insert")){
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String reallyname = request.getParameter("reallyname");
			String sex = request.getParameter("sex");
			String qq = request.getParameter("qq");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String postcode = request.getParameter("postcode");
			String shengri = request.getParameter("shengri");
			String xueli = request.getParameter("xueli");
			str = "/admin/adminlist.jsp";
			sql = "insert into admin(name,pwd,reallyname,sex,qq,email,phone,address,postcode,shengri,xueli) values('"+name+"','"+pwd+"','"+reallyname+"','"+sex+"','"+qq+"','"+email+"','"+phone+"','"+address+"','"+postcode+"','"+shengri+"','"+xueli+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "用户名重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}
		
		request.getRequestDispatcher(str).forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
