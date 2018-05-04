package objs;


import java.io.InputStream;


public class Product {

	private int id,CAT,user_id;
	private String productName,des,city,advName,phone,email, price;

	private InputStream in_stream ;
	private byte[] img_array;
	
	public Product() {
		super();
		}
	

	
	
	public Product(int id, int cAT, int user_id, String productName, String des, String city, String advName,
			String phone, String email, String price, InputStream in_stream, byte[] img_array) {
		super();
		this.id = id;
		this.CAT = cAT;
		this.user_id = user_id;
		this.productName = productName;
		this.des = des;
		this.city = city;
		this.advName = advName;
		this.phone = phone;
		this.email = email;
		this.price = price;
		this.in_stream = in_stream;
		this.img_array = img_array;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}


	public int getCAT() {
		return CAT;
	}


	public void setCAT(int cAT) {
		CAT = cAT;
	}


	public int getUser_Id() {
		return user_id;
	}

	public void setUser_Id(int id) {
		this.user_id = id;
	}
	

	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getDes() {
		return des;
	}


	public void setDes(String des) {
		this.des = des;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getAdvName() {
		return advName;
	}


	public void setAdvName(String advName) {
		this.advName = advName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


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


	public String getShortName() {
		String pName=this.productName;
		if(pName.length()>16) {
			pName = "..."+pName.substring(0,16);
		}
		return pName;
	}

	public Double getPrice_Double() {
		return Double.parseDouble(price);
	}


	public void setPrice_String(String price) {
		this.price = price;
	}
	
	public String getPrice_String() {
		return price;
	}


	public void setPrice_Double(Double price) {
		this.price = String.valueOf(price);
	}
	
	
	
}
