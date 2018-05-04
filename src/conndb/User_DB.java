package conndb;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import objs.User;

public class User_DB {
	
	
	public static int getId() {
		
		int id= -1;

		String query = "SELECT `id` FROM `users` ";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			
			
			ResultSet rs = prs.executeQuery();
			
			while(rs.next())
			{
                 id = rs.getInt("id") ;
			}
			
			
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}
			
		return ++id;
	}
	
	
public static boolean isUserIn_DB(String email) {
		
		boolean bool= false;

		String query = "SELECT `id` FROM `users` WHERE `email`=? ";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			prs.setString(1, email);
			
			ResultSet rs = prs.executeQuery();
			
			if(rs.next())
			{
				bool = true;
			}
			
			
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}
			
		return bool;
	}


public static String getPWD(String email) {
	
	String pwd= "";

	String query = "SELECT `pwd` FROM `users` WHERE `email`=? ";
	
	try (Connection conn = ConnDB.getConn())
	{
		
		PreparedStatement prs = conn.prepareStatement(query);
		prs.setString(1, email);
		
		ResultSet rs = prs.executeQuery();
		
		if(rs.next())
		{
			pwd = rs.getString("pwd");
		}
		
		
	}catch(Exception ex){
		System.err.println(ex.getMessage());
	}
		
	return pwd;
}


public static String getUserId(String email) {
	
	int id=0;

	String query = "SELECT `id` FROM `users` WHERE `email`=? ";
	
	try (Connection conn = ConnDB.getConn())
	{
		
		PreparedStatement prs = conn.prepareStatement(query);
		prs.setString(1, email);
		
		ResultSet rs = prs.executeQuery();
		
		if(rs.next())
		{
			id = rs.getInt("id");
		}
		
		
	}catch(Exception ex){
		System.err.println(ex.getMessage());
	}
		
	return String.valueOf(id);
}
	
	// Get All Users In DB To Display Them
	public static List<User> getAllUsers(){
		
		List<User> users = new ArrayList<>();
		
		String query = "SELECT * FROM `users`";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			ResultSet rs = prs.executeQuery();
			
			while(rs.next())
			{
				User user = new User();
			 
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("uname"));
				user.setPwd(rs.getString("pwd"));
			  	user.setEmail(rs.getString("email"));
				
			  	InputStream binaryStream = rs.getBinaryStream("img");
			  	user.setIn_stream(binaryStream);
				byte[] arr = rs.getBytes("img");
				user.setImg_array(arr);
				
			  	user.setCity(rs.getString("city"));
			  	user.setPhone(rs.getString("phone"));
			  	users.add(user);
			  	
			  	binaryStream=null;
			}
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return users;
	}
	
	
	// Get All Users In DB To Display Them
	public static User getUserBYID(String id_str){
		
		User user = new User();
		
		String query = "SELECT * FROM `users` WHERE `id`=?";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
			prs.setInt(1,Integer.parseInt(id_str));
			
			ResultSet rs = prs.executeQuery();
			
			if(rs.next())
			{
				
			 
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("uname"));
				user.setPwd(rs.getString("pwd"));
			  	user.setEmail(rs.getString("email"));
				
			  	InputStream binaryStream = rs.getBinaryStream("img");
			  	user.setIn_stream(binaryStream);
				byte[] arr = rs.getBytes("img");
				user.setImg_array(arr);
				
			  	user.setCity(rs.getString("city"));
			  	user.setPhone(rs.getString("phone"));
			  	binaryStream=null;
			}
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return user;
	}
	
	
	
	// Method To Add User Or Sgin Up
   public static int addUser(User user){
		
		int st = 0;
		
		String query = "INSERT INTO `users`(`id`, `uname`, `pwd`, `email`, `img`, `city`, `phone`) VALUES (?,?,?,?,?,?,?)";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
	        prs.setInt(1, user.getId());
	        prs.setString(2, user.getUsername());
	        prs.setString(3, user.getPwd());
	        prs.setString(4, user.getEmail());
	        prs.setBinaryStream(5,user.getIn_stream());
	        prs.setString(6, user.getCity());
	        prs.setString(7, user.getPhone());
			
			st = prs.executeUpdate();
			
			
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return st;
	}
   
	// Method To Update User Information
   public static int updateUser(User user){
		
		int st = 0;
		
		String query = "UPDATE `users` SET   `uname`=?, `pwd`=?, `email`=?, `img`=?, `city`=?, `phone`=? WHERE `id`=?";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
	
	        prs.setString(1, user.getUsername());
	        prs.setString(2, user.getPwd());
	        prs.setString(3, user.getEmail());
	        prs.setBinaryStream(4,user.getIn_stream());
	        prs.setString(5, user.getCity());
	        prs.setString(6, user.getPhone());
	        
			prs.setInt(8, user.getId());
			
			st = prs.executeUpdate();
			
			
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return st;
	}

   
   // Method To Update User Information
   public static int deleteUser(User user){
		
		int st = 0;
		
		String query = "DELETE FROM `users` WHERE `id`=?";
		
		try (Connection conn = ConnDB.getConn())
		{
			
			PreparedStatement prs = conn.prepareStatement(query);
		
			prs.setInt(1,user.getId());
			
			st = prs.executeUpdate();
			
			
		}
		catch(Exception ex)
		{
			System.err.println(ex.getMessage());
		}
		
		return st;
	}
   
   
}
