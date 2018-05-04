package conndb;

import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import objs.OLX;
import objs.Product;
public class DB_Product {
	
	public static int getId() {
		
		int id=0;

		String query = "SELECT  `id`  FROM `products` ";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			
			
			ResultSet rs = prs.executeQuery();
			
			while(rs.next())
			{
                 id = rs.getInt("id") ;
			}
			
			
			}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
			
		return ++id;
	}
	
	
	public static List<Product> getAllProducts(){
		

		List<Product> allproducts = new ArrayList<>();
		
        String query = "SELECT `id`, `prooduct_name`, `CAT`, `des`, `img`, `city`, `name`, `phone`, `email`, `price`,`user_id` FROM `products` ";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			
			
			ResultSet rs = prs.executeQuery();
			
			while(rs.next())
			{
				Product p = new Product();
				
				p.setId(rs.getInt("id"));
				p.setProductName(rs.getString("prooduct_name"));
				p.setCAT(rs.getInt("CAT"));
				p.setDes(rs.getString("des"));
				p.setCity(rs.getString("city"));
				p.setAdvName(rs.getString("name"));
				p.setPhone(rs.getString("phone"));
				p.setEmail("email");
				p.setPrice_Double(rs.getDouble("price"));
				p.setUser_Id(rs.getInt("user_id"));
				allproducts.add(p);
			}
			
			/*           To Join Tow List  Or More Togther      */
			//   allproducts = Stream.of(allP,olx).flatMap(Collection::stream).collect(Collectors.toList());
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return allproducts;
	}

	
	
       public static Product getProduct_BYid(String id_str){
		
		int id = Integer.parseInt(id_str);
		
        String query = "SELECT  `id`, `prooduct_name`, `CAT`, `des`, `img`, `city`, `name`, `phone`, `email`, `price`,`user_id` FROM `products` Where `id`=? ";
		
        Product p = new Product();
        
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			prs.setInt(1,id);
			
			ResultSet rs = prs.executeQuery();
			
			if(rs.next())
			{
				p.setId(rs.getInt("id"));
				p.setProductName(rs.getString("prooduct_name"));
				p.setCAT(rs.getInt("CAT"));
				p.setDes(rs.getString("des"));
				InputStream binaryStream = rs.getBinaryStream("img");
				p.setIn_stream(binaryStream);
				byte[] arr = rs.getBytes("img");
				p.setImg_array(arr);
				p.setCity(rs.getString("city"));
				p.setAdvName(rs.getString("name"));
				p.setPhone(rs.getString("phone"));
				p.setEmail(rs.getString("email"));
				p.setPrice_Double(rs.getDouble("price"));
				p.setUser_Id(rs.getInt("user_id"));
			}
			
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return p;
	}
	
       public static boolean isInDB(String str_id)
       {
    	   boolean bool =false;
    	   
    	   String query = "SELECT `id` FROM `products` Where `id`=? ";
   		
           
   		try (Connection conn = ConnDB.getConn())
   		{
   			
   			PreparedStatement prs = conn.prepareStatement(query);
   			prs.setInt(1,Integer.parseInt(str_id));
   			
   			ResultSet rs = prs.executeQuery();
   			
   			while(rs.next()) 
   			{
   				bool = true;
   				if(bool)break;
   			}
   			
   		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
   		
   		return bool;
   		
       }
       
       
	
	
	// Method To Add Product 
	   public static int addProduct(Product p){
			
			int st = 0;
			
			String query = "INSERT INTO `products`(`id`, `prooduct_name`, `CAT`, `des`, `img`, `city`, `name`, `phone`, `email`, `price`,`user_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			
			try (Connection conn = ConnDB.getConn())
			{
				
				PreparedStatement prs = conn.prepareStatement(query);
				
				prs.setInt(1, p.getId());
				prs.setString(2, p.getProductName());
				prs.setInt(3, p.getCAT());
				prs.setString(4, p.getDes());
            	prs.setBinaryStream(5, p.getIn_stream());
            	prs.setString(6, p.getCity());
            	prs.setString(7, p.getAdvName());
            	prs.setString(8, p.getPhone());
            	prs.setString(9, p.getEmail());
				prs.setDouble(10, p.getPrice_Double());
				prs.setInt(11, p.getUser_Id());
				st = prs.executeUpdate();
				
				conn.close();
			}
			catch(Exception ex)
			{
				System.err.println(ex.getMessage());
			}
			
			return st;
		}
	   
	   

		// Method To Update User Information
	   public static int updateProduct(Product p){
			
			int st = 0;
			
			String query = "UPDATE `products` SET  `prooduct_name`=?, `CAT`=?, `des`=?, `img`=?, `city`=?, `name`=?, `phone`=?, `email`=?, `price`=?,`user_id`=? WHERE `id`=?";
			
			try (Connection conn = ConnDB.getConn())
			{
				
				PreparedStatement prs = conn.prepareStatement(query);
				
				
				prs.setString(1, p.getProductName());
				prs.setInt(2, p.getCAT());
				prs.setString(3, p.getDes());
            	prs.setBinaryStream(4, p.getIn_stream());
            	prs.setString(5, p.getCity());
            	prs.setString(6, p.getAdvName());
            	prs.setString(7, p.getPhone());
            	prs.setString(8, p.getEmail());
				prs.setDouble(9, p.getPrice_Double());
				prs.setInt(10, p.getUser_Id());
				prs.setInt(11, p.getId());

				st = prs.executeUpdate();
					
			}
			catch(Exception ex)
			{
				System.err.println(ex.getMessage());
			}
			
			return st;
		}

	   
	   // Method To Update User Information
	   public static int deleteProduct(Product p){
			
			int st = 0;
			
			String query = "DELETE FROM `products` WHERE `id`=?";
			
			try (Connection conn = ConnDB.getConn())
			{
				
				PreparedStatement prs = conn.prepareStatement(query);
			
				prs.setInt(1,p.getId());
				
				st = prs.executeUpdate();
				
				
			}
			catch(Exception ex)
			{
				System.err.println(ex.getMessage());
			}
			
			return st;
		}
	   
	   
	   
	   public static List<OLX> getOLXProducts_olx(){
			 
		   List<OLX> olx = new ArrayList<>();
		   
		   try {
			   Document doc = Jsoup.connect("https://olx.com.eg").get();
		        Elements temp = doc.select("div.ads__item__info");
		        Elements tempIMGs = doc.select("div.ads__item__photos-holder");
		       
		        List<String> 
                                  name    = new ArrayList<>(),
	                              price     = new ArrayList<>(),
			                      imgurl  = new ArrayList<>();
		        
		        for (Element element : temp) {
                      name.add(element.getElementsByTag("a").first().text());
                      price.add(element.getElementsByTag("p").first().text());
				}
		        
		        for (Element element : tempIMGs) {
		        	imgurl.add(element.getElementsByTag("img").attr("src"));
				}
		        
		        int x =0;
		        while(x<=name.size())
		        {
		        	OLX o = new OLX();
		        	o.setName(name.get(x));
		        	o.setImgURL(imgurl.get(x));
		        	o.setPrice(price.get(x));
		        	olx.add(o);
		        	x++;
		        }
		   }catch(Exception ex) {
			   System.err.println(ex.getMessage());
		   }
		   
		   return olx;
	   } 	
	   
	   
	   public static List<Product> getOLXProducts_P(){
		 
		   List<Product> olx = new ArrayList<>();
	
		   
		   try {
               Document doc = Jsoup.connect("https://olx.com.eg").get();
               Elements temp = doc.select("div.ads__item__info");
               Elements location = doc.select("div.ads__item__info__secondary");
               Elements tempIMGs = doc.select("div.ads__item__photos-holder");

               List<String> 
                             name         = new ArrayList<>(),
                             location_arr = new ArrayList<>(),
                             price        = new ArrayList<>(),
                             imgurl       = new ArrayList<>();

               for (Element element : temp)
               {
                   name.add(element.getElementsByTag("a").first().text());
                   price.add(element.getElementsByTag("p").first().text());
              }

               for (Element element : location)
               {location_arr.add(element.getElementsByTag("p").get(1).text());}


               for (Element element : tempIMGs) 
               { imgurl.add(element.getElementsByTag("img").attr("src")); }

               int x =0,id=DB_Product.getId();
               while(x < name.size())
		        {
		        	Product p = new Product();
		        	p.setId(id);
		        	p.setProductName(name.get(x));
		        	String price_str =price.get(x).replaceAll("[^0-9]","");
		        	p.setPrice_String(price_str);
		        	 
		        	InputStream in_stream = new URL(imgurl.get(x)).openStream();
		        	
		        	p.setIn_stream(in_stream);
		        	p.setCAT(1);
		        	p.setDes("وصف المنتج");
		        	p.setEmail("admin"+id+"@gmail.com");
		        	p.setCity(location_arr.get(x));
		        	p.setPhone("no-phone");
		        	p.setUser_Id(0);
		        	p.setAdvName("admin"+id);
		        	olx.add(p);        	
		        	x++;
		        	id++;
		        }
		   }catch(Exception ex) {
			   System.err.println(ex.getMessage());
		   }
		   
		   return olx;
	   } 	   
	   
	   public static int  addOlxProductInDB(){
			 
		   List<Product> olx = getOLXProducts_P();

		   int err=0;
		   for(Product p : olx) 
		   {

			if(   DB_Product.addProduct(p) > 0) 
			{
			}else {
				
			  err++;;
				break;
			}
		   }
		
		   return err;

	   } 	
//	   
//	   public static List<OLX> getOLXProducts(){
//		 
//		   List<OLX> olx = new ArrayList<>();
//		   
//		   try {
//			   Document doc = Jsoup.connect("https://olx.com.eg").get();
//		        Elements temp = doc.select("div.ads__item__info");
//		        Elements tempIMGs = doc.select("div.ads__item__photos-holder");
//		       
//		        List<String> 
//                                  name    = new ArrayList<>(),
//	                              price     = new ArrayList<>(),
//			                      imgurl  = new ArrayList<>();
//		        
//		        for (Element element : temp) {
//                      name.add(element.getElementsByTag("a").first().text());
//                      price.add(element.getElementsByTag("p").first().text());
//				}
//		        
//		        for (Element element : tempIMGs) {
//		        	imgurl.add(element.getElementsByTag("img").attr("src"));
//				}
//		        
//		        int x =0;
//		        while(x<=name.size()) {
//		        	OLX o = new OLX();
//		        	o.setName(name.get(x));
//		        	o.setPrice(price.get(x));
//		        	o.setImgURL(imgurl.get(x));
//		        	
//		        	olx.add(o);
//		        	x++;
//		        }
//		   }catch(Exception ex) {
//			   System.err.println(ex.getMessage());
//		   }
//		   
//		   return olx;
//	   } 
	   

	   public static HashMap<Integer,String> getAllCATS(){
			
		   HashMap<Integer,String> map = new HashMap<>();
			
			String query = "SELECT `id`, `nameCat` FROM `cats`";
			
			try (Connection conn = ConnDB.getConn())
			{
				
				PreparedStatement prs = conn.prepareStatement(query);
				ResultSet rs = prs.executeQuery();
			
				while(rs.next()) 
				{
					map.put(rs.getInt("id"),rs.getString("nameCat"));
				}
				
			}
			catch(Exception ex)
			{
				System.err.println(ex.getMessage());
			}
			
			return map;
			 
		}
	   
	   
	   
}
