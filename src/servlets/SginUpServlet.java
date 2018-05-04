package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conndb.User_DB;
import objs.User;

/**
 * Servlet implementation class SginUpServlet
 */
@WebServlet("/SginUpServlet")
public class SginUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SginUpServlet() {
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
          
		  PrintWriter out = response.getWriter();
		  
          
		  String 
		          name = request.getParameter("name"),
		          email = request.getParameter("email"),
		          pwd     = request.getParameter("pass");
			 
		  HashMap<String,String> message = new HashMap<>();
		  
		  if(name==null || name.trim().isEmpty()) 
		  { message.put("name","هذا الحقل مطلوب..");}
		  
		  if(email==null || email.trim().isEmpty()) 
		  { message.put("email","هذا الحقل مطلوب..");}
		  
		  if(pwd==null || pwd.trim().isEmpty()) 
		  { message.put("pwd","هذا الحقل مطلوب..");}

		  
			  
	     if(message.isEmpty()){
	    	 
			    User user = new User();
                 user.setUsername(name);
			     user.setEmail(email);
	             user.setPwd(pwd);
			    
			     int st = User_DB.addUser(user);
         	     if(st > 0)
         	    	 {
         		
		     			  out.println("	<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\" style=\"margin-bottom:0;\" >");
		     			  out.println(" <strong>Success</strong> User Added. ");
		     			  out.println("  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
		     			  out.println("<span aria-hidden=\"true\">&times;</span>");
		     			  out.println("</button>");
		     			  out.println("</div>");
		     			  
		    			   request.getRequestDispatcher("Home.jsp").include(request, response);
         	    	 }
	    	 
		    
		   }else{
			   request.setAttribute("message",message);
			  
			   request.getRequestDispatcher("SginIn.jsp").forward(request, response);
		   }
		  
	}
	

}
