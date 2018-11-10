package global.sesoc.vo;

public class Sale {
   
   private int sale_num;
   private int sale_totalprice;
   private int sale_amount;
   private int project_num;
   private String userid;
   private String sale_date;
   private String sale_firstname;
   private String sale_lastname;
   private String sale_zipcode;
   private String sale_country;
   private String sale_province;
   private String sale_city;
   private String sale_address1;
   private String sale_address2;
   private String sale_phone;
   private String sale_email;
   
   public Sale() {
      // TODO Auto-generated constructor stub
   }

public Sale(int sale_num, int sale_totalprice, int sale_amount, int project_num, String userid, String sale_date,
		String sale_firstname, String sale_lastname, String sale_zipcode, String sale_country, String sale_province,
		String sale_city, String sale_address1, String sale_address2, String sale_phone, String sale_email) {
	super();
	this.sale_num = sale_num;
	this.sale_totalprice = sale_totalprice;
	this.sale_amount = sale_amount;
	this.project_num = project_num;
	this.userid = userid;
	this.sale_date = sale_date;
	this.sale_firstname = sale_firstname;
	this.sale_lastname = sale_lastname;
	this.sale_zipcode = sale_zipcode;
	this.sale_country = sale_country;
	this.sale_province = sale_province;
	this.sale_city = sale_city;
	this.sale_address1 = sale_address1;
	this.sale_address2 = sale_address2;
	this.sale_phone = sale_phone;
	this.sale_email = sale_email;
}

public int getSale_num() {
	return sale_num;
}

public void setSale_num(int sale_num) {
	this.sale_num = sale_num;
}

public int getSale_totalprice() {
	return sale_totalprice;
}

public void setSale_totalprice(int sale_totalprice) {
	this.sale_totalprice = sale_totalprice;
}

public int getSale_amount() {
	return sale_amount;
}

public void setSale_amount(int sale_amount) {
	this.sale_amount = sale_amount;
}

public int getProject_num() {
	return project_num;
}

public void setProject_num(int project_num) {
	this.project_num = project_num;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getSale_date() {
	return sale_date;
}

public void setSale_date(String sale_date) {
	this.sale_date = sale_date;
}

public String getSale_firstname() {
	return sale_firstname;
}

public void setSale_firstname(String sale_firstname) {
	this.sale_firstname = sale_firstname;
}

public String getSale_lastname() {
	return sale_lastname;
}

public void setSale_lastname(String sale_lastname) {
	this.sale_lastname = sale_lastname;
}

public String getSale_zipcode() {
	return sale_zipcode;
}

public void setSale_zipcode(String sale_zipcode) {
	this.sale_zipcode = sale_zipcode;
}

public String getSale_country() {
	return sale_country;
}

public void setSale_country(String sale_country) {
	this.sale_country = sale_country;
}

public String getSale_province() {
	return sale_province;
}

public void setSale_province(String sale_province) {
	this.sale_province = sale_province;
}

public String getSale_city() {
	return sale_city;
}

public void setSale_city(String sale_city) {
	this.sale_city = sale_city;
}

public String getSale_address1() {
	return sale_address1;
}

public void setSale_address1(String sale_address1) {
	this.sale_address1 = sale_address1;
}

public String getSale_address2() {
	return sale_address2;
}

public void setSale_address2(String sale_address2) {
	this.sale_address2 = sale_address2;
}

public String getSale_phone() {
	return sale_phone;
}

public void setSale_phone(String sale_phone) {
	this.sale_phone = sale_phone;
}

public String getSale_email() {
	return sale_email;
}

public void setSale_email(String sale_email) {
	this.sale_email = sale_email;
}

@Override
public String toString() {
	return "Sale [sale_num=" + sale_num + ", sale_totalprice=" + sale_totalprice + ", sale_amount=" + sale_amount
			+ ", project_num=" + project_num + ", userid=" + userid + ", sale_date=" + sale_date + ", sale_firstname="
			+ sale_firstname + ", sale_lastname=" + sale_lastname + ", sale_zipcode=" + sale_zipcode + ", sale_country="
			+ sale_country + ", sale_province=" + sale_province + ", sale_city=" + sale_city + ", sale_address1="
			+ sale_address1 + ", sale_address2=" + sale_address2 + ", sale_phone=" + sale_phone + ", sale_email="
			+ sale_email + "]";
}
   
      

}