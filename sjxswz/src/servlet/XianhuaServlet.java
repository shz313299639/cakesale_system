package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class XianhuaServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public XianhuaServlet() {
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String leibie = request.getParameter("leibie");
		String chailiao = request.getParameter("chailiao");
		String baozhuang = request.getParameter("baozhuang");
		String huayu = request.getParameter("huayu");
		String fushong = request.getParameter("fushong");
		String price = request.getParameter("price");
		String kuchun = request.getParameter("kuchun");
		String shuoming = request.getParameter("shuoming");
		String path = request.getParameter("path");

		String sql = "";
		String str = "/admin/products_list.jsp";

		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		
		if(mark != null && mark.equals("add")){
			sql = "insert into xianhua(name,leibie,chailiao,baozhuang,huayu,fushong,price,shuoming,img,kuchun) values('"+name+"','"+leibie+"','"+chailiao+"','"+baozhuang+"','"+huayu+"','"+fushong+"','"+price+"','"+shuoming+"','"+path+"',"+kuchun+")";
		}
		if(mark != null && mark.equals("update")){
			sql = "update xianhua set name='"+name+"',leibie='"+leibie+"',chailiao='"+chailiao+"',baozhuang='"+baozhuang+"',huayu='"+huayu+"',fushong='"+fushong+"',price='"+price+"',shuoming='"+shuoming+"',img='"+path+"',kuchun=kuchun+"+kuchun+" where id="+id;
		}
		
		ib.insertANDupdateANDdel(sql);
		request.setAttribute("message", "²Ù×÷³É¹¦£¡");

		request.getRequestDispatcher(str).forward(request, response);
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
