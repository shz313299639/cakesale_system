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
		
		String id = request.getParameter("id");//��ȡ��Ʒid
		String m = request.getParameter("i"); 
		String num = request.getParameter("num"+m);//��ȡ���ﳵ�޸�����
		String str = "";//mapping��תʱ��ֵ
		String del = request.getParameter("del");//��ȡɾ������ļǺ�
		String remove = request.getParameter("remove");//��ȡ��չ��ﳵ�ļǺ�
		String reckoning = request.getParameter("reckoning");//����
		HttpSession session = request.getSession();
		ArrayList login = (ArrayList)session.getAttribute("userlogin");//��ȡ�û���Ϣ
		AllBean ab = new AllBean();
		ArrayList xianhua = ab.getXianhua(id);//��Ʒ��Ϣ
		int sum = 1;//����һ��ͼ�������
		if(login == null || login.size() == 0){
			str = "/users/index.jsp";//�û���Ϣ������������ҳ
			request.setAttribute("message", "����û�е�¼��");
		}else{
			str = "/users/shopping.jsp";//�������ﳵҳ��
			ArrayList shopping = (ArrayList)session.getAttribute("shopping");//��ȡ���ﳵ��Ϣ
			if(id !=null && !id.equals("")){
				if(shopping == null || shopping.size() == 0){//���ﳵΪ��ʱ
					ArrayList alShop = new ArrayList();
					alShop.add(xianhua);
					alShop.add(""+sum);
					shopping = new ArrayList();
					shopping.add(alShop);
				}else{
					boolean bool = true;
					for(int i = 0;i < shopping.size();i++){//�����Ƿ�����ͬ�ĵ��⣬�еĻ���Ŀ��1
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
					if(bool){//û�еĻ�������һ���µ���
						ArrayList alShop = new ArrayList();
						alShop.add(xianhua);
						alShop.add(""+sum);
						shopping.add(alShop);
					}
				}
			}
			if(del != null && !del.equals("") && shopping !=null && shopping.size()!= 0){
				shopping.remove(Integer.parseInt(del));//ɾ������
			}
			session.setAttribute("shopping",shopping);
			if(remove != null && !remove.equals("") && session.getAttribute("shopping") != null && !session.getAttribute("shopping").equals("")){
				session.removeAttribute("shopping");//��չ��ﳵ
			}
			if(reckoning != null && reckoning.equals("reckoning")){
				String yeji = request.getParameter("yeji");
				int tem;
				for (tem = 0;tem < shopping.size();tem++){
					ArrayList alRow = (ArrayList)shopping.get(tem);
					if(Integer.parseInt(((ArrayList)alRow.get(0)).get(10).toString()) < Integer.parseInt(alRow.get(1).toString())){
						request.setAttribute("message", "���ﳵ�е�"+(tem+1)+"���ʻ���������㣬���޸ģ�");
						str = "/users/shopping.jsp";
						break;
					}
				}
				if(tem == shopping.size()){
					if(shopping == null || shopping.size()== 0){
						request.setAttribute("message", "���ﳵ��û�е��⣡");
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
						request.setAttribute("message", "�����ύ�ɹ���");
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
