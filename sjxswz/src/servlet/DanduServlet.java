package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class DanduServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DanduServlet() {
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
			String infoContent = request.getParameter("infoContent");
			
			String sql = "";
			InsertUpdateDelBean ib = new InsertUpdateDelBean();
			if(infoContent == null || infoContent.equals("")){
				request.setAttribute("message", "内容不能为空！");
			}else{		
				sql = "update dandu set content='"+infoContent+"' where id="+id;
				ib.insertANDupdateANDdel(sql);
				request.setAttribute("message", "操作成功！");
			}
			request.getRequestDispatcher("/admin/dandu.jsp?id="+id).forward(request, response);
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
