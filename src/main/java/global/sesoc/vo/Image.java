package global.sesoc.vo;

public class Image {
	
	private int image_num;
	private String image_path;
	private int product_num;
	
	public Image() {
		// TODO Auto-generated constructor stub
	}

	public Image(int image_num, String image_path, int product_num) {
		super();
		this.image_num = image_num;
		this.image_path = image_path;
		this.product_num = product_num;
	}

	public int getImage_num() {
		return image_num;
	}

	public void setImage_num(int image_num) {
		this.image_num = image_num;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	@Override
	public String toString() {
		return "Image [image_num=" + image_num + ", image_path=" + image_path + ", product_num=" + product_num + "]";
	}
	
	

}
