package global.sesoc.vo;

public class Rereply {
	
	private int rereply_num;
	private String rereply_content;
	private int reply_num;
	private int project_num;
	private String co_id;
	private String rereply_date;
	
	
	public Rereply() {
		// TODO Auto-generated constructor stub
	}

	


	public Rereply(int rereply_num, String rereply_content, int reply_num, int project_num, String co_id,
			String rereply_date) {
		super();
		this.rereply_num = rereply_num;
		this.rereply_content = rereply_content;
		this.reply_num = reply_num;
		this.project_num = project_num;
		this.co_id = co_id;
		this.rereply_date = rereply_date;
	}




	public int getRereply_num() {
		return rereply_num;
	}


	public void setRereply_num(int rereply_num) {
		this.rereply_num = rereply_num;
	}


	public String getRereply_content() {
		return rereply_content;
	}


	public void setRereply_content(String rereply_content) {
		this.rereply_content = rereply_content;
	}


	public int getReply_num() {
		return reply_num;
	}


	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}


	public int getProject_num() {
		return project_num;
	}


	public String getRereply_date() {
		return rereply_date;
	}




	public void setRereply_date(String rereply_date) {
		this.rereply_date = rereply_date;
	}




	public void setProject_num(int project_num) {
		this.project_num = project_num;
	}


	public String getCo_id() {
		return co_id;
	}


	public void setCo_id(String co_id) {
		this.co_id = co_id;
	}


	@Override
	public String toString() {
		return "Rereply [rereply_num=" + rereply_num + ", rereply_content=" + rereply_content + ", reply_num="
				+ reply_num + ", project_num=" + project_num + ", co_id=" + co_id + "]";
	}
	
	
	
	
	

}
