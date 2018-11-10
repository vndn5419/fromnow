package global.sesoc.vo;

public class Company {
		
		private String co_id;
		private String co_name;
		private String co_pwd;
		private String co_city;
		private String co_ceo_firstname;
		private String co_ceo_lastname;
		private String co_phone;
		private String co_email;
		private String co_website;
		private String co_image;
		private String co_zipcode;
		private String co_country;
		private String co_province;
		private String co_address1;
		private String co_address2;
		
		public Company() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Company(String co_id, String co_name, String co_pwd, String co_city, String co_ceo_firstname,
				String co_ceo_lastname, String co_phone, String co_email, String co_website, String co_image,
				String co_zipcode, String co_country, String co_province, String co_address1, String co_address2) {
			super();
			this.co_id = co_id;
			this.co_name = co_name;
			this.co_pwd = co_pwd;
			this.co_city = co_city;
			this.co_ceo_firstname = co_ceo_firstname;
			this.co_ceo_lastname = co_ceo_lastname;
			this.co_phone = co_phone;
			this.co_email = co_email;
			this.co_website = co_website;
			this.co_image = co_image;
			this.co_zipcode = co_zipcode;
			this.co_country = co_country;
			this.co_province = co_province;
			this.co_address1 = co_address1;
			this.co_address2 = co_address2;
		}
		public String getCo_id() {
			return co_id;
		}
		public void setCo_id(String co_id) {
			this.co_id = co_id;
		}
		public String getCo_name() {
			return co_name;
		}
		public void setCo_name(String co_name) {
			this.co_name = co_name;
		}
		public String getCo_pwd() {
			return co_pwd;
		}
		public void setCo_pwd(String co_pwd) {
			this.co_pwd = co_pwd;
		}
		public String getCo_city() {
			return co_city;
		}
		public void setCo_city(String co_city) {
			this.co_city = co_city;
		}
		public String getCo_ceo_firstname() {
			return co_ceo_firstname;
		}
		public void setCo_ceo_firstname(String co_ceo_firstname) {
			this.co_ceo_firstname = co_ceo_firstname;
		}
		public String getCo_ceo_lastname() {
			return co_ceo_lastname;
		}
		public void setCo_ceo_lastname(String co_ceo_lastname) {
			this.co_ceo_lastname = co_ceo_lastname;
		}
		public String getCo_phone() {
			return co_phone;
		}
		public void setCo_phone(String co_phone) {
			this.co_phone = co_phone;
		}
		public String getCo_email() {
			return co_email;
		}
		public void setCo_email(String co_email) {
			this.co_email = co_email;
		}
		public String getCo_website() {
			return co_website;
		}
		public void setCo_website(String co_website) {
			this.co_website = co_website;
		}
		public String getCo_image() {
			return co_image;
		}
		public void setCo_image(String co_image) {
			this.co_image = co_image;
		}
		public String getCo_zipcode() {
			return co_zipcode;
		}
		public void setCo_zipcode(String co_zipcode) {
			this.co_zipcode = co_zipcode;
		}
		public String getCo_country() {
			return co_country;
		}
		public void setCo_country(String co_country) {
			this.co_country = co_country;
		}
		public String getCo_province() {
			return co_province;
		}
		public void setCo_province(String co_province) {
			this.co_province = co_province;
		}
		public String getCo_address1() {
			return co_address1;
		}
		public void setCo_address1(String co_address1) {
			this.co_address1 = co_address1;
		}
		public String getCo_address2() {
			return co_address2;
		}
		public void setCo_address2(String co_address2) {
			this.co_address2 = co_address2;
		}
		@Override
		public String toString() {
			return "Company [co_id=" + co_id + ", co_name=" + co_name + ", co_pwd=" + co_pwd + ", co_city=" + co_city
					+ ", co_ceo_firstname=" + co_ceo_firstname + ", co_ceo_lastname=" + co_ceo_lastname + ", co_phone="
					+ co_phone + ", co_email=" + co_email + ", co_website=" + co_website + ", co_image=" + co_image
					+ ", co_zipcode=" + co_zipcode + ", co_country=" + co_country + ", co_province=" + co_province
					+ ", co_address1=" + co_address1 + ", co_address2=" + co_address2 + "]";
		}
		
		

		
		
		
}