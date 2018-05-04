package servlets;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conndb.DB_Product;
import objs.Product;

/**
 * Servlet implementation class getImg
 */
@WebServlet("/getImg")
public class getImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getImg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		   response.setContentType("text/html");
		   
		   OutputStream out_img = null;
		   
		   String id_str = request.getParameter("img_id"); 
		      
	          if(id_str != null && DB_Product.isInDB(id_str))
	          {
	        	
		        Product p = DB_Product.getProduct_BYid(id_str);
		        
		        byte[] img_Byte = p.getImg_array();
		        response.setContentType("image/jpg");
		        out_img = response.getOutputStream();
                out_img.write(img_Byte);
	            
                out_img.flush();
                out_img.close();
	            
	          }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
