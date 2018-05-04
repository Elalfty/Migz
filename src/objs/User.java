package objs;

import java.io.InputStream;

public class User {

	private int id;
	private String 
	               username,pwd,city,email,phone;
	private InputStream in_stream ;
	private byte[] img_array;
	
	public User() {
		super();
		
		this.id=0;
		this.username=null;
		this.pwd=null;
		this.email=null;
		this.city=null;
		this.phone=null;
		this.in_stream=null;
		this.img_array=null;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	/* image */


	public InputStream getIn_stream() {
		return in_stream;
	}


	public void setIn_stream(InputStream in_stream) {
		this.in_stream = in_stream;
	}


	public byte[] getImg_array() {
		
		return img_array;
	}


	public void setImg_array(byte[] img_array) {
		this.img_array = img_array;
	}

	
	
}
