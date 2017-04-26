package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Validate;

import bean.InsertUpdateDelBean;

public class HuifuServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HuifuServlet() {
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
			throws ServletException, IOException {response.setContentType("text/html;charset=gb2312");
			request.setCharacterEncoding("gb2312");
			
			String id = request.getParameter("id");
			String huifu = request.getParameter("huifu");
			
			String sql = "update liuyan set huifu='"+huifu+"' where id="+id;
			InsertUpdateDelBean ib = new InsertUpdateDelBean();
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�ظ��ɹ���");
			request.getRequestDispatcher("/admin/liuyanlist.jsp").forward(request, response);
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
