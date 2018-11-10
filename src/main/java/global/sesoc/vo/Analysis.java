package global.sesoc.vo;

public class Analysis {
	private String best_country;
	private String best_gender;
	private int best_age;
	private String best_month;
	private int best_price;
	
	public Analysis() {
		// TODO Auto-generated constructor stub
	}

	public Analysis(String best_country, String best_gender, int best_age, String best_month, int best_price) {
		super();
		this.best_country = best_country;
		this.best_gender = best_gender;
		this.best_age = best_age;
		this.best_month = best_month;
		this.best_price = best_price;
	}

	public String getBest_country() {
		return best_country;
	}

	public void setBest_country(String best_country) {
		this.best_country = best_country;
	}

	public String getBest_gender() {
		return best_gender;
	}

	public void setBest_gender(String best_gender) {
		this.best_gender = best_gender;
	}

	public int getBest_age() {
		return best_age;
	}

	public void setBest_age(int best_age) {
		this.best_age = best_age;
	}

	public String getBest_month() {
		return best_month;
	}

	public void setBest_month(String best_month) {
		this.best_month = best_month;
	}

	public int getBest_price() {
		return best_price;
	}

	public void setBest_price(int best_price) {
		this.best_price = best_price;
	}

	@Override
	public String toString() {
		return "Analysis [best_country=" + best_country + ", best_gender=" + best_gender + ", best_age=" + best_age
				+ ", best_month=" + best_month + ", best_price=" + best_price + "]";
	}
	
}