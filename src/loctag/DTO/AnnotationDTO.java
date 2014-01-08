package loctag.DTO;


/**
 * Representation of an Annotation
 */
public class AnnotationDTO {
	private int annotationID;
	private int userID;
	private int categoryID;
	private String userPic;
	private String title;
	private String category;
	private String date;
	private String owner;
	private String photo;
	private String description;
	private String address;
	private String target;
	private String eDate;
	private double lat;
	private double lon;
	private double distance;
	private boolean bookmarked;
	
	
	
	public AnnotationDTO() {
		this.annotationID = 0;
		this.userID = 0;
		this.categoryID = 0;
		this.userPic = "";
		this.title="";
		this.category="";
		this.date="";
		this.owner="";
		this.photo="";
		this.target="";
		this.description="";
		this.address="";
		this.lat=0;
		this.lon=0;
		this.setDistance(0);
		this.bookmarked=false;

	}

	//summaries of annotations without distance
	public AnnotationDTO(int annotationID, int userID, String title, String category, String date, String owner, String photo) {
		
		this.annotationID = annotationID;
		this.userID = userID;
		this.title=title;
		this.category=category;
		this.date=date;
		this.owner=owner;
		this.photo=photo;
	}
	
	//summaries of annotations
	public AnnotationDTO(int annotationID, int userID, String title, String category, String date, String owner, String photo, double distance) {
		
		this.annotationID = annotationID;
		this.userID = userID;
		this.title=title;
		this.category=category;
		this.date=date;
		this.owner=owner;
		this.photo=photo;
		this.setDistance(distance);
	}


	//complete annotation record
	public AnnotationDTO(int annotationID, int userID, String userPic, String owner, String title,  String category, String description, String date, String photo,
			String address, double lat, double lon, boolean bookmarked, String target, String eDate) {

	
		this.annotationID = annotationID;
		this.userID=userID;
		this.userPic=userPic;
		this.owner=owner;
		this.owner=owner;
		this.title=title;
		this.category=category;
		this.description=description;
		this.date=date;
		this.photo=photo;
		this.address=address;
		this.lat=lat;
		this.lon=lon;
		this.bookmarked=bookmarked;
		this.target=target;
		this.eDate=eDate;

	
	}

	//for creating a new annotation
	public AnnotationDTO(String title, String description, String photo, int userID, int categoryID, String date, double lat, double lon, String address, String target, String eDate) {

	
		this.userID=userID;
		this.categoryID=categoryID;
		this.title=title;
		this.description=description;
		this.photo=photo;
		this.address=address;
		this.lat=lat;
		this.lon=lon;
		this.date=date;
		this.target=target;
		this.eDate=eDate;
	
	}
	

	public int getAnnotationID() {
		return annotationID;
	}


	public void setAnnotationID(int annotationID) {
		this.annotationID = annotationID;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public double getLat() {
		return lat;
	}


	public void setLat(double lat) {
		this.lat = lat;
	}


	public double getLon() {
		return lon;
	}


	public void setLon(double lon) {
		this.lon = lon;
	}


	public String getUserPic() {
		return userPic;
	}


	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public boolean isBookmarked() {
		return bookmarked;
	}


	public void setBookmarked(boolean isBookmarked) {
		this.bookmarked = isBookmarked;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}


	public int getCategoryID() {
		return categoryID;
	}


	public void setTarget(String target) {
		this.target = target;
	}


	public String getTarget() {
		return target;
	}


	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getDistance() {
		return distance;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String geteDate() {
		return eDate;
	}

	@Override
	public String toString() {
		return "AnnotationDTO [annotationID=" + annotationID + ", userID="
				+ userID + ", userPic=" + userPic + ", title=" + title
				+ ", category=" + category + ", date=" + date + ", owner="
				+ owner + ", photo=" + photo + ", description=" + description
				+ ", address=" + address + ", lat=" + lat + ", lon=" + lon
				+ "]";
	}

	
}
