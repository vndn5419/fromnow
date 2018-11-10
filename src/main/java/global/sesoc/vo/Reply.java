package global.sesoc.vo;

public class Reply {
	
	private int reply_num;
	private String reply_content;
	private String userid;
	private int project_num;
	private String reply_date;
	private int count;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	
	public Reply(int reply_num, String reply_content, String userid, int project_num, String reply_date, int count) {
		super();
		this.reply_num = reply_num;
		this.reply_content = reply_content;
		this.userid = userid;
		this.project_num = project_num;
		this.reply_date = reply_date;
		this.count = count;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getProject_num() {
		return project_num;
	}

	public void setProject_num(int project_num) {
		this.project_num = project_num;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "Reply [reply_num=" + reply_num + ", reply_content=" + reply_content + ", userid=" + userid
				+ ", project_num=" + project_num + ", reply_date=" + reply_date + "]";
	}
	
	

}
