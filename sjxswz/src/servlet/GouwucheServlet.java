package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Validate;

import bean.AllBean;
import bean.InsertUpdateDelBean;
import bean.SelectBean;

public class GouwucheServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GouwucheServlet() {
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
		
		String id = request.getParameter("id");//获取物品id
		String m = request.getParameter("i"); 
		String num = request.getParameter("num"+m);//获取购物车修改数量
		String str = "";//mapping跳转时的值
		String del = request.getParameter("del");//获取删除蛋糕的记号
		String remove = request.getParameter("remove");//获取清空购物车的记号
		String reckoning = request.getParameter("reckoning");//结帐
		HttpSession session = request.getSession();
		ArrayList login = (ArrayList)session.getAttribute("userlogin");//获取用户信息
		AllBean ab = new AllBean();
		ArrayList xianhua = ab.getXianhua(id);//物品信息
		int sum = 1;//购买一种图书的数量
		if(login == null || login.size() == 0){
			str = "/users/index.jsp";//用户信息不存在跳到首页
			request.setAttribute("message", "您还没有登录！");
		}else{
			str = "/users/shopping.jsp";//跳到购物车页面
			ArrayList shopping = (ArrayList)session.getAttribute("shopping");//获取购物车信息
			if(id !=null && !id.equals("")){
				if(shopping == null || shopping.size() == 0){//购物车为空时
					ArrayList alShop = new ArrayList();
					alShop.add(xianhua);
					alShop.add(""+sum);
					shopping = new ArrayList();
					shopping.add(alShop);
				}else{
					boolean bool = true;
					for(int i = 0;i < shopping.size();i++){//查找是否有相同的蛋糕，有的话数目加1
						ArrayList alShop = (ArrayList)shopping.get(i);
						if(((ArrayList)alShop.get(0)).get(0).equals(id)){
							sum = Integer.parseInt(alShop.get(1).toString())+sum;
							if(num != null && !num.equals("")){
								sum = Integer.parseInt(num);
							}
							alShop.set(1,""+sum);
							bool = false;
							break;
						}
					}
					if(bool){//没有的话，加入一个新蛋糕
						ArrayList alShop = new ArrayList();
						alShop.add(xianhua);
						alShop.add(""+sum);
						shopping.add(alShop);
					}
				}
			}
			if(del != null && !del.equals("") && shopping !=null && shopping.size()!= 0){
				shopping.remove(Integer.parseInt(del));//删除蛋糕
			}
			session.setAttribute("shopping",shopping);
			if(remove != null && !remove.equals("") && session.getAttribute("shopping") != null && !session.getAttribute("shopping").equals("")){
				session.removeAttribute("shopping");//清空购物车
			}
			if(reckoning != null && reckoning.equals("reckoning")){
				String yeji = request.getParameter("yeji");
				int tem;
				for (tem = 0;tem < shopping.size();tem++){
					ArrayList alRow = (ArrayList)shopping.get(tem);
					if(Integer.parseInt(((ArrayList)alRow.get(0)).get(10).toString()) < Integer.parseInt(alRow.get(1).toString())){
						request.setAttribute("message", "购物车中第"+(tem+1)+"样鲜花库存量不足，请修改！");
						str = "/users/shopping.jsp";
						break;
					}
				}
				if(tem == shopping.size()){
					if(shopping == null || shopping.size()== 0){
						request.setAttribute("message", "购物车中没有蛋糕！");
					}else{
						InsertUpdateDelBean iud = new InsertUpdateDelBean();
						Validate v = new Validate();
						String sql = "insert into orders(usersid,shijian,yeji) values("+login.get(0)+",'"+v.getSystemDate()+"',"+yeji+")";
						iud.insertANDupdateANDdel(sql);
						sql = "select max(id) as id from orders";
						String args[] = {"id"};
						SelectBean sb = new SelectBean();
						ArrayList max = sb.select(args, sql);
						for(int i = 0;i < shopping.size();i++){
							ArrayList alRow = (ArrayList)shopping.get(i);
							sql = "update xianhua set kuchun=kuchun-"+alRow.get(1)+" where id="+((ArrayList)alRow.get(0)).get(0);
							iud.insertANDupdateANDdel(sql);
							sql = "insert into xiangxi(ordersid,xianhuaid,sums) values("+max.get(0)+","+((ArrayList)alRow.get(0)).get(0)+","+alRow.get(1)+")";
							iud.insertANDupdateANDdel(sql);
						}
						session.removeAttribute("shopping");
						request.setAttribute("message", "订单提交成功！");
						str = "/users/orders.jsp";
					}
				}
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(str);
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
