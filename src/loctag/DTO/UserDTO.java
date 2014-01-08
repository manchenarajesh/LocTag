package loctag.DTO;

/**
 * Representation of a User
 */

public class UserDTO {
	private int userID;
	private int fbID;
	private String picURL;
	private String name;
	private String link;
	private String email;
	private String time;
	private String country;
	private String about;
	private boolean followed;
	private String pref_log;
	private String pref_fbwall;
	private String pref_emailfollow;
	private String pref_emailcom;
	private String pref_emailtrigger;

	public UserDTO() {
		this.userID = 0;
		this.fbID = 0;
		this.picURL = "";
		this.name = "";
		this.link = "";
		this.email = "";
		this.time = "";
		this.country = "";
		this.about = "";
		this.followed = false;
		this.pref_log = "N";
		this.pref_fbwall = "N";
		this.pref_emailfollow = "N";
		this.pref_emailcom = "N";
		this.pref_emailtrigger = "N";
	}

	// mini summary
	public UserDTO(int userID, String name, String picURL, String time) {
		this.userID = userID;
		this.name = name;
		this.picURL = picURL;
		this.time = time;
	}

	// info for lists of users
	public UserDTO(int userID, int fbID, String picURL, String name,
			String link, String email, String time, String country) {

		this.userID = userID;
		this.fbID = fbID;
		this.picURL = picURL;
		this.name = name;
		this.link = link;
		this.email = email;
		this.time = time;
		this.country = country;
	}

	// full user info for viewing profile page
	public UserDTO(int userID, int fbID, String picURL, String name,
			String link, String email, String registered, String country,
			String about, boolean followed) {

		this.userID = userID;
		this.fbID = fbID;
		this.picURL = picURL;
		this.name = name;
		this.link = link;
		this.email = email;
		this.time = registered;
		this.country = country;
		this.about = about;
		this.followed = followed;
	}

	// user settings
	public UserDTO(int userID, String name,
			String email, String country,
			String about, String pref_log,
			String pref_fbwall, String pref_emailfollow, String pref_emailcom,
			String pref_emailtrigger) {

		this.userID = userID;
		this.name = name;
		this.email = email;
		this.country = country;
		this.about = about;
		this.pref_log = pref_log;
		this.pref_fbwall = pref_fbwall;
		this.pref_emailfollow = pref_emailfollow;
		this.pref_emailcom = pref_emailcom;
		this.pref_emailtrigger = pref_emailtrigger;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getFbID() {
		return fbID;
	}

	public void setFbID(int fbID) {
		this.fbID = fbID;
	}

	public void setPicURL(String picURL) {
		this.picURL = picURL;
	}

	public String getPicURL() {
		return picURL;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getLink() {
		return link;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public boolean isFollowed() {
		return followed;
	}

	public void setFollowed(boolean followed) {
		this.followed = followed;
	}

	public String getPref_log() {
		return pref_log;
	}

	public void setPref_log(String pref_log) {
		this.pref_log = pref_log;
	}

	public String getPref_fbwall() {
		return pref_fbwall;
	}

	public void setPref_fbwall(String pref_fbwall) {
		this.pref_fbwall = pref_fbwall;
	}

	public String getPref_emailfollow() {
		return pref_emailfollow;
	}

	public void setPref_emailfollow(String pref_emailfollow) {
		this.pref_emailfollow = pref_emailfollow;
	}

	public String getPref_emailcom() {
		return pref_emailcom;
	}

	public void setPref_emailcom(String pref_emailcom) {
		this.pref_emailcom = pref_emailcom;
	}

	public String getPref_emailtrigger() {
		return pref_emailtrigger;
	}

	public void setPref_emailtrigger(String pref_emailtrigger) {
		this.pref_emailtrigger = pref_emailtrigger;
	}

	@Override
	public String toString() {
		return "UserDTO [userID=" + userID + ", fbID=" + fbID + ", picURL="
				+ picURL + ", name=" + name + ", link=" + link + ", email="
				+ email + ", time=" + time + ", country=" + country
				+ ", about=" + about + ", followed=" + followed + ", pref_log="
				+ pref_log + ", pref_fbwall=" + pref_fbwall
				+ ", pref_emailfollow=" + pref_emailfollow + ", pref_emailcom="
				+ pref_emailcom + ", pref_emailtrigger=" + pref_emailtrigger
				+ "]";
	}

}
