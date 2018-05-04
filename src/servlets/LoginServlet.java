package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conndb.User_DB;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		 response.setContentType("text/html; charset=UTF-8");
		   request.setCharacterEncoding("UTF-8");
		   
		   String 
	           email  = request.getParameter("email"),
	           pwd   = request.getParameter("pass");
		   

		   HashMap<String,String> message = new HashMap<>(),
				                   val = new HashMap<>();
		   
		   if(email==null || email.trim().isEmpty()) 
			  { message.put("email","الرجاء إدخال الإيميل ..");}
		   
		   else if(!User_DB.isUserIn_DB(email)) 
			  { 
			   message.put("email","هذا الإيميل غير مسجل من قبل ..");
			   val.put("email",email);
			  }

		   if(pwd==null || pwd.trim().isEmpty()) 
			  { message.put("pwd","الفئة مطلوبة..");}
		   else if(!User_DB.getPWD(email).equals(pwd)) 
			  {message.put("pwd","كلمة المرور غير صحيحة  ..");}
		   
        if(message.isEmpty()){ 
        	
        	HttpSession session = request.getSession();  
            session.setAttribute("id_user",User_DB.getUserId(email));  
            request.getRequestDispatcher("Home.jsp").include(request, response);
			

		}else {

	       request.setAttribute("message", message);
	       request.setAttribute("val", val);
		   request.getRequestDispatcher("index.jsp").include(request, response);
		   
		}
	}

}
