package loctag.constants;

/**
 * Constants for the URLs of the REST interfaces
 */
public class WS {

	public static final String username = "loctag_app";
	public static final String password = "loctag_app_P-123";
	public static final String realm = "LOCTAG";
	
	public static final String ENDPOINT_userInfoLogin = "http://localhost:8080/LocTagWS/loctag/users/login?accesstoken=";
	public static final String ENDPOINT_userInfo = "http://localhost:8080/LocTagWS/loctag/users/";
	public static final String ENDPOINT_userSettings = "http://localhost:8080/LocTagWS/loctag/users/settings/";
	public static final String ENDPOINT_allUsers = "http://localhost:8080/LocTagWS/loctag/users/allusers";
	public static final String ENDPOINT_searchUsers = "http://localhost:8080/LocTagWS/loctag/users/search/";
	public static final String ENDPOINT_fbFriends = "http://localhost:8080/LocTagWS/loctag/users/fbfriends/";
	public static final String ENDPOINT_annotations = "http://localhost:8080/LocTagWS/loctag/annotations/";
	public static final String ENDPOINT_ownannotations = "http://localhost:8080/LocTagWS/loctag/annotations/user/";
	public static final String ENDPOINT_searchannotations = "http://localhost:8080/LocTagWS/loctag/annotations/search/";
	public static final String ENDPOINT_searchannotationsnearby = "http://localhost:8080/LocTagWS/loctag/annotations/nearby";
	public static final String ENDPOINT_bookmarks = "http://localhost:8080/LocTagWS/loctag/bookmarks/user/";
	public static final String ENDPOINT_bookmarkedBy = "http://localhost:8080/LocTagWS/loctag/bookmarks/users/annotation/";
	public static final String ENDPOINT_collected = "http://localhost:8080/LocTagWS/loctag/logs/user/";
	public static final String ENDPOINT_collectedBy = "http://localhost:8080/LocTagWS/loctag/logs/annotation/";
	public static final String ENDPOINT_following = "http://localhost:8080/LocTagWS/loctag/following/user/";
	public static final String ENDPOINT_followedby = "http://localhost:8080/LocTagWS/loctag/following/followers/user/";
	public static final String ENDPOINT_comments = "http://localhost:8080/LocTagWS/loctag/comments/annotation/";
	public static final String ENDPOINT_categories = "http://localhost:8080/LocTagWS/loctag/categories/";
	public static final String ENDPOINT_updatephoto = "http://localhost:8080/LocTagWS/loctag/annotations/updatephoto/";	
	public static final String ENDPOINT_updatedetails = "http://localhost:8080/LocTagWS/loctag/annotations/updatedetails/";



}

