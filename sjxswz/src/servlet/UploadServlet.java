package servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.upload.SmartFile;
import util.upload.SmartUpload;

public class UploadServlet extends HttpServlet {

	
private ServletConfig config;
	
	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
    }
	/**
	 * Constructor of the object.
	 */
	public UploadServlet() {
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

		doPost(request,response);
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
		 SmartUpload mySmartUpload = new SmartUpload();//init 
		 String typename = request.getParameter("typename").trim();
		 int count = 0;
		 try{
			 mySmartUpload.initialize(config,request,response);
             mySmartUpload.upload();
             SmartFile file = mySmartUpload.getFiles().getFile(0); 
             if(!file.getFileExt().equals("jpg")&&!file.getFileExt().equals("JPG")&&!file.getFileExt().equals("gif")&&!file.getFileExt().equals("GIF")){
            	 request.setAttribute("message2", "��ֹ�ϴ����ļ���ʽ(ֻ���ϴ�jpg��JPG��gif��GIF��ʽͼƬ)��"); 
            	 request.getRequestDispatcher("/admin/upfile.jsp?typename="+typename).forward(request, response);
             }
             else{
            	 count = mySmartUpload.save("pic");
            	 if(count == 1){
            		 request.setAttribute("message", "�ļ��ϴ��ɹ���");
            		 request.setAttribute("filepath", "pic/"+file.getFileName());
            		 request.getRequestDispatcher("/admin/upfile.jsp?typename="+typename).forward(request, response);
            	 }
            	 else{
            		 request.setAttribute("message2", "�ļ��ϴ�ʧ�ܣ�");
            		 request.getRequestDispatcher("/admin/upfile.jsp?typename="+typename).forward(request, response);
            	 }
             }	
        }catch(Exception ex){
        	//ex.printStackTrace();
        	//request.setAttribute("message", "�ļ��ϴ�ʧ�ܣ�");
			//request.getRequestDispatcher(syslist.get(7).toString()+"/upfile.jsp").forward(request, response);
        }
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
