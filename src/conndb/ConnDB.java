package conndb;


import java.sql.Connection;
import java.sql.DriverManager;




public class ConnDB {

	private static String unicode = "?useUnicode=yes&characterEncoding=UTF-8";

	public static Connection getConn() 
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 
			return DriverManager.getConnection( "jdbc:mysql://localhost/olx"+unicode,"root",""); 
		
		//System.out.println("CONN");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}
	
	//public static void main(String[] args) {getConn();}

}
