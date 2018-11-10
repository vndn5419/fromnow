package global.sesoc.vo;

public class Shipping {
		
		private int shipping_num;
		private int project_num;
		private String shipping_country;
		private int shipping_price;
		
		public Shipping() {
			// TODO Auto-generated constructor stub
		}

		public Shipping(int shipping_num, int project_num, String shipping_country, int shipping_price) {
			super();
			this.shipping_num = shipping_num;
			this.project_num = project_num;
			this.shipping_country = shipping_country;
			this.shipping_price = shipping_price;
		}

		public int getShipping_num() {
			return shipping_num;
		}

		public void setShipping_num(int shipping_num) {
			this.shipping_num = shipping_num;
		}

		public int getProject_num() {
			return project_num;
		}

		public void setProject_num(int project_num) {
			this.project_num = project_num;
		}

		public String getShipping_country() {
			return shipping_country;
		}

		public void setShipping_country(String shipping_country) {
			this.shipping_country = shipping_country;
		}

		public int getShipping_price() {
			return shipping_price;
		}

		public void setShipping_price(int shipping_price) {
			this.shipping_price = shipping_price;
		}

		@Override
		public String toString() {
			return "shipping [shipping_num=" + shipping_num + ", project_num=" + project_num + ", shipping_country="
					+ shipping_country + ", shipping_price=" + shipping_price + "]";
		}
		
		
		
}
