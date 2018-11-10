package global.sesoc.vo;

public class Favorites {
	
		private int project_num;
		private String userid;
		
		public Favorites() {
			// TODO Auto-generated constructor stub
		}

		public Favorites(int project_num, String userid) {
			super();
			this.project_num = project_num;
			this.userid = userid;
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

		@Override
		public String toString() {
			return "favorites [project_num=" + project_num + ", userid=" + userid + "]";
		}
		
}
