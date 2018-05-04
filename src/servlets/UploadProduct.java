package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import conndb.DB_Product;
import objs.Product;

/**
 * Servlet implementation class UploadProduct
 */
@WebServlet("/UploadProduct")
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15, // 15 MB
        location            = "/home/mgs/Uploads"
)
public class UploadProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadProduct() {
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
	      
		   //PrintWriter out = response.getWriter();
		   
		   String 
	           ProductName  = request.getParameter("nameP"),
	           ProductCAT   = request.getParameter("CAT"),
	           ProductDes   = request.getParameter("desp"),
	           City         = request.getParameter("city"),
	           Name         = request.getParameter("nameUser"),
	           Phone        = request.getParameter("phone"),
	           Email        = request.getParameter("email"),
	           Price        = request.getParameter("pricep");
		  
		   /* Handel Image in Part obj*/
	        Part part = request.getPart("mainImg");
		   
		   HashMap<String,String> message = new HashMap<>();
		   
		   if(ProductName==null || ProductName.trim().isEmpty()) 
			  { message.put("ProductName","الرجاء كتابة عنوان للإعلان ..");}

		   if(ProductCAT==null || ProductCAT.trim().isEmpty()) 
			  { message.put("ProductCAT","الفئة مطلوبة..");}
		  
		   else if(ProductCAT.matches(".*\\\\D+.*"))
		      { message.put("ProductCAT","الفئة مطلوبة..");}
		   
		   if(ProductDes==null || ProductDes.trim().isEmpty()) 
			  { message.put("ProductDes"," الرجاء كتابة وصف للشيء الذي تود بيعة..");}
		   
		   if(City==null || City.trim().isEmpty()) 
			  { message.put("City","أدخل اسم المدينة وإختر المناسب من القائمة..");}
		   
		   if(Name==null || Name.trim().isEmpty()) 
			  { message.put("Name","الرجاء تزويدنا بإسم المُعلن..");}
		   else if(Name.matches(".*\\\\d+.*"))
			  { message.put("Name"," إسم المُعلن لا يمكن ان بحتوي علي ارقام ..");}
		   
		   if(Phone==null || Phone.trim().isEmpty()) 
			  { message.put("Phone","الرجاء إدخال رقم الموبايل..");}
		   else if(Phone.matches(".*\\\\D+.*"))
			  { message.put("Phone"," صيغة رقم الهاتف غير صحيحة ..");}
		   
		   if(Email==null || Email.trim().isEmpty()) 
			  { message.put("Email","الرجاء تزويدنا بعنوان الإيميل..");}
		   
		   
		   if(Price==null || Price.trim().isEmpty()) 
			  { message.put("Price","رجاءً ادخل السعر المطلوب  ..");}
		  
			  
		   if(request.getParameter("combo")==null || request.getParameter("combo").trim().isEmpty()) 
			  { message.put("combo"," عليك الموافقة على الشروط والأحكام..");}
		   
		  
		   
		   if(message.isEmpty()){  
			   
			   Product p = new Product();
				p.setId(DB_Product.getId());
				p.setProductName(ProductName);
				p.setCAT(Integer.parseInt(ProductCAT));
				p.setDes(ProductDes);
				p.setCity(City);
				p.setAdvName(Name);
				p.setPhone(Phone);
				p.setEmail(Email);
				p.setPrice_Double(Double.parseDouble(Price));
		        
	         InputStream istream =  part.getInputStream(); 
		        
		        p.setIn_stream(istream);
			        
			    int st = DB_Product.addProduct(p);
			       
		        if(st > 0)
		        response.sendRedirect("PrivewProduct.jsp?idp="+p.getId());
	   

			   
		}else {

	       request.setAttribute("message", message);		
		   request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
			
		}
		   
		   
	}

}
