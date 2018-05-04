package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conndb.DB_Product;

/**
 * Servlet implementation class addOLXproductsInDB
 */
@WebServlet("/addOLXproductsInDB")
public class addOLXproductsInDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOLXproductsInDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		   response.setContentType("text/html; charset=UTF-8");
		   request.setCharacterEncoding("UTF-8");
		   
	      PrintWriter out  = response.getWriter();
	   
		   String statues = request.getParameter("st");
		   if(statues.equals("1")) {

					  
					if( DB_Product.addOlxProductInDB()>0) {
										   out.println("added");
										   response.sendRedirect("Home.jsp");
					}else {
						out.println("Erorr");
					}
							
		   
		   
		   }else {
			   out.println("ERR");
		   }
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	



	}

}
