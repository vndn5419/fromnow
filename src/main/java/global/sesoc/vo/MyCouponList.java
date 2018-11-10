package global.sesoc.vo;

public class MyCouponList {

	private int coupon_num;
	private int coupon_discountrate;
	private int project_num;
	private String userid;
	private String coupon_used;
	private String coupon_date;
	private int coupon_code;
	private String project_title;

	public MyCouponList() {
		// TODO Auto-generated constructor stub
	}

	public MyCouponList(int coupon_num, int coupon_discountrate, int project_num, String userid, String coupon_used,
			String coupon_date, int coupon_code, String project_title) {
		super();
		this.coupon_num = coupon_num;
		this.coupon_discountrate = coupon_discountrate;
		this.project_num = project_num;
		this.userid = userid;
		this.coupon_used = coupon_used;
		this.coupon_date = coupon_date;
		this.coupon_code = coupon_code;
		this.project_title = project_title;
	}

	public int getCoupon_num() {
		return coupon_num;
	}

	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}

	public int getCoupon_discountrate() {
		return coupon_discountrate;
	}

	public void setCoupon_discountrate(int coupon_discountrate) {
		this.coupon_discountrate = coupon_discountrate;
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

	public String getCoupon_used() {
		return coupon_used;
	}

	public void setCoupon_used(String coupon_used) {
		this.coupon_used = coupon_used;
	}

	public String getCoupon_date() {
		return coupon_date;
	}

	public void setCoupon_date(String coupon_date) {
		this.coupon_date = coupon_date;
	}

	public int getCoupon_code() {
		return coupon_code;
	}

	public void setCoupon_code(int coupon_code) {
		this.coupon_code = coupon_code;
	}

	public String getProject_title() {
		return project_title;
	}

	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}

	@Override
	public String toString() {
		return "MyCouponList [coupon_num=" + coupon_num + ", coupon_discountrate=" + coupon_discountrate
				+ ", project_num=" + project_num + ", userid=" + userid + ", coupon_used=" + coupon_used
				+ ", coupon_date=" + coupon_date + ", coupon_code=" + coupon_code + ", project_title=" + project_title
				+ "]";
	}

}