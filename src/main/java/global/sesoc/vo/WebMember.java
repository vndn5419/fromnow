package global.sesoc.vo;

public class WebMember{
		private String userid;
		private String firstname;
		private String userpwd;
		private String gender;
		private String birthday;
		private String phone;
		private String email;
		private String hobby;
		private String image;
		private String lastname;
		private String zipcode;
		private String country;
		private String province;
		private String city;
		private String address1;
		private String address2;

		public WebMember() {
			// TODO Auto-generated constructor stub
		}

		public WebMember(String userid, String firstname, String userpwd, String gender, String birthday, String phone,
				String email, String hobby, String image, String lastname, String zipcode, String country, String province,
				String city, String address1, String address2) {
			super();
			this.userid = userid;
			this.firstname = firstname;
			this.userpwd = userpwd;
			this.gender = gender;
			this.birthday = birthday;
			this.phone = phone;
			this.email = email;
			this.hobby = hobby;
			this.image = image;
			this.lastname = lastname;
			this.zipcode = zipcode;
			this.country = country;
			this.province = province;
			this.city = city;
			this.address1 = address1;
			this.address2 = address2;
		}

		public String getUserid() {
			return userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		public String getFirstname() {
			return firstname;
		}

		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}

		public String getUserpwd() {
			return userpwd;
		}

		public void setUserpwd(String userpwd) {
			this.userpwd = userpwd;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getBirthday() {
			return birthday;
		}

		public void setBirthday(String birthday) {
			this.birthday = birthday;
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

		public String getHobby() {
			return hobby;
		}

		public void setHobby(String hobby) {
			this.hobby = hobby;
		}

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
		}

		public String getZipcode() {
			return zipcode;
		}

		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}

		public String getCountry() {
			return country;
		}

		public void setCountry(String country) {
			this.country = country;
		}

		public String getProvince() {
			return province;
		}

		public void setProvince(String province) {
			this.province = province;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getAddress1() {
			return address1;
		}

		public void setAddress1(String address1) {
			this.address1 = address1;
		}

		public String getAddress2() {
			return address2;
		}

		public void setAddress2(String address2) {
			this.address2 = address2;
		}

		@Override
		public String toString() {
			return "WebMember [userid=" + userid + ", firstname=" + firstname + ", userpwd=" + userpwd + ", gender="
					+ gender + ", birthday=" + birthday + ", phone=" + phone + ", email=" + email + ", hobby=" + hobby
					+ ", image=" + image + ", lastname=" + lastname + ", zipcode=" + zipcode + ", country=" + country
					+ ", province=" + province + ", city=" + city + ", address1=" + address1 + ", address2=" + address2 + "]";
		}
		
}