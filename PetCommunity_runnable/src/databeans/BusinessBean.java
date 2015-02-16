package databeans;

import org.genericdao.PrimaryKey;

@PrimaryKey("id")

public class BusinessBean {
	private int id;
	private String name ;
	private String rating;
	private String review_count;
	private String phone;
	private String is_closed;
	private String display_address;
	private String latitude;
	private String longitude;
	private String image_url;
	private String rating_img_url_small;
	private String url;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getReview_count() {
		return review_count;
	}
	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIs_closed() {
		return is_closed;
	}
	public void setIs_closed(String is_closed) {
		this.is_closed = is_closed;
	}
	public String getDisplay_address() {
		return display_address;
	}
	public void setDisplay_address(String display_address) {
		this.display_address = display_address;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getRating_img_url_small() {
		return rating_img_url_small;
	}
	public void setRating_img_url_small(String rating_img_url_small) {
		this.rating_img_url_small = rating_img_url_small;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}

}
