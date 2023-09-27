package kr.or.ddit.prod.vo;

public class ProdVO {
	private String prod_id;
	private String prod_name;
	private String prod_lgu;
	private String prod_buyer;
	private int prod_cost;
	private int prod_price;
	private int prod_sale;
	private String prod_outline;
	private String prod_detail;
	private String prod_size;
	private String prod_color;
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_lgu() {
		return prod_lgu;
	}
	public void setProd_lgu(String prod_lgu) {
		this.prod_lgu = prod_lgu;
	}
	public String getProd_buyer() {
		return prod_buyer;
	}
	public void setProd_buyer(String prod_buyer) {
		this.prod_buyer = prod_buyer;
	}
	public int getProd_cost() {
		return prod_cost;
	}
	public void setProd_cost(int prod_cost) {
		this.prod_cost = prod_cost;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_sale() {
		return prod_sale;
	}
	public void setProd_sale(int prod_sale) {
		this.prod_sale = prod_sale;
	}
	public String getProd_outline() {
		return prod_outline;
	}
	public void setProd_outline(String prod_outline) {
		this.prod_outline = prod_outline;
	}
	public String getProd_detail() {
		return prod_detail;
	}
	public void setProd_detail(String prod_detail) {
		this.prod_detail = prod_detail;
	}
	public String getProd_size() {
		return prod_size;
	}
	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}
	public String getProd_color() {
		return prod_color;
	}
	public void setProd_color(String prod_color) {
		this.prod_color = prod_color;
	}
	
	@Override
	public String toString() {
		return "ProdVO [prod_id=" + prod_id + ", prod_name=" + prod_name + ", prod_lgu=" + prod_lgu + ", prod_buyer="
				+ prod_buyer + ", prod_cost=" + prod_cost + ", prod_price=" + prod_price + ", prod_sale=" + prod_sale
				+ ", prod_outline=" + prod_outline + ", prod_detail=" + prod_detail + ", prod_size=" + prod_size
				+ ", prod_color=" + prod_color + "]";
	}
}
