package global.sesoc.vo;

public class WebAdmin {

		private String admin_id;
		private String admin_pwd;
		private String admin_phone;
		private String admin_email;
		private String admin_name;
	
		public WebAdmin() {
			// TODO Auto-generated constructor stub
		}

		public WebAdmin(String admin_id, String admin_pwd, String admin_phone, String admin_email, String admin_name) {
			super();
			this.admin_id = admin_id;
			this.admin_pwd = admin_pwd;
			this.admin_phone = admin_phone;
			this.admin_email = admin_email;
			this.admin_name = admin_name;
		}

		public String getAdmin_id() {
			return admin_id;
		}

		public void setAdmin_id(String admin_id) {
			this.admin_id = admin_id;
		}

		public String getAdmin_pwd() {
			return admin_pwd;
		}

		public void setAdmin_pwd(String admin_pwd) {
			this.admin_pwd = admin_pwd;
		}

		public String getAdmin_phone() {
			return admin_phone;
		}

		public void setAdmin_phone(String admin_phone) {
			this.admin_phone = admin_phone;
		}

		public String getAdmin_email() {
			return admin_email;
		}

		public void setAdmin_email(String admin_email) {
			this.admin_email = admin_email;
		}

		public String getAdmin_name() {
			return admin_name;
		}

		public void setAdmin_name(String admin_name) {
			this.admin_name = admin_name;
		}

		@Override
		public String toString() {
			return "WebAdmin [admin_id=" + admin_id + ", admin_pwd=" + admin_pwd + ", admin_phone=" + admin_phone
					+ ", admin_email=" + admin_email + ", admin_name=" + admin_name + "]";
		}
		
		
}
