package loctag.util;

import loctag.constants.*;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import loctag.DTO.AnnotationDTO;
import loctag.DTO.CategoryDTO;
import loctag.DTO.CommentDTO;
import loctag.DTO.UserDTO;
import loctag.util.HTTP;

/**
 * Utility class for making calls to the REST interfaces and parsing the results.
 */
public class Parser {

	static JSONObject jsonObject = null;
	static JSONArray the_json_array = null;
	static ArrayList<UserDTO> userDTOarrays = null;
	static ArrayList<AnnotationDTO> annotationDTOarrays = null;
	static ArrayList<CommentDTO> commentDTOarrays = null;
	static ArrayList<CategoryDTO> categoryDTOarrays = null;

	
	/**
	 * Convert JSON string representations of annotations into an arraylist of AnnotationDTO objects
	 */
	public static ArrayList<AnnotationDTO> processAnnotations(JSONArray jsonAnnotations) {

		ArrayList<AnnotationDTO> annotationsArrayList = new ArrayList<AnnotationDTO>();

		System.out.println("The jsonAnnotations received in processAnnotations: "+jsonAnnotations);
		
		// parse JSON, populate arraylist, and return the arraylist
		if (!jsonAnnotations.equals("null")) { // if not empty

			try {
				int annotationID = 0;
				int userID = 0;
				double distance = 0;
				String title = "";
				String category = "";
				String date = "";
				String owner = "";
				String photo = "";

				for (int i = 0; i < jsonAnnotations.length(); i++) {

					JSONObject childJSONObject = jsonAnnotations
							.getJSONObject(i);
					annotationID = childJSONObject.getInt("annotationID");
					userID = childJSONObject.getInt("userID");
					title = childJSONObject.getString("title");
					category = childJSONObject.getString("category");
					date = childJSONObject.getString("date");
					owner = childJSONObject.getString("owner");
					photo = childJSONObject.getString("photo");
					distance = childJSONObject.getDouble("distance");
					AnnotationDTO annotationDTO = new AnnotationDTO(
							annotationID, userID, title, category, date, owner,
							photo, distance);
					annotationsArrayList.add(annotationDTO);

				}

			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return null;
			}

		}
		return annotationsArrayList;

	}

	/**
	 * Convert JSON string representations of users into an arraylist of UserDTO objects
	 */
	public static ArrayList<UserDTO> processUsers(JSONArray jsonUsers) {

		ArrayList<UserDTO> usersArrayList = new ArrayList<UserDTO>();

		// parse JSON, populate arraylist, and return the arraylist
		if (!jsonUsers.equals("null")) { // if not empty

			try {
				int fbID = 0;
				int userID = 0;
				String picURL = "";
				String name = "";
				String link = "";
				String email = "0";
				String time = "";
				String country = "";

				for (int i = 0; i < jsonUsers.length(); i++) {

					JSONObject childJSONObject = jsonUsers.getJSONObject(i);

					userID = childJSONObject.getInt("userID");
					fbID = childJSONObject.getInt("fbID");
					picURL = childJSONObject.getString("picURL");
					name = childJSONObject.getString("name");
					link = childJSONObject.getString("link");
					email = childJSONObject.getString("email");
					time = childJSONObject.getString("time");
					country = childJSONObject.getString("country");

					UserDTO userDTO = new UserDTO(userID, fbID, picURL, name,
							link, email, time, country);
					usersArrayList.add(userDTO);

				}

			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return null;
			}

		}
		return usersArrayList;

	}

	/**
	 * Get records created by a user
	 */
	public static ArrayList<AnnotationDTO> getCreatedRecords(String forUserID,int from, int count) {

		annotationDTOarrays = null;
		String annotations = "";
		try {
			URL createdURL = new URL(WS.ENDPOINT_ownannotations + forUserID
					+ "?from=" + from + "&count=" + count);
			annotations = HTTP.readHttpURL(createdURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Created received in Parser.getCreatedRecords: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	/**
	 * Get user's bookmarks
	 */
	public static ArrayList<AnnotationDTO> getBookmarks(String forUserID) {

		annotationDTOarrays = null;
		String annotations = null;
		try {
			URL bookmarksURL = new URL(WS.ENDPOINT_bookmarks + forUserID);
			annotations = HTTP.readHttpURL(bookmarksURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Bookmarks received in Parser.getBookmarks: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
			return null;
		}
		catch (Exception e3) {
			e3.printStackTrace();
			return null;
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	
	/**
	 * Get records of annotations collected by a user
	 */
	public static ArrayList<AnnotationDTO> getCollected(String forUserID) {

		annotationDTOarrays = null;
		String annotations = "";
		try {
			URL collectedURL = new URL(WS.ENDPOINT_collected + forUserID);
			annotations = HTTP.readHttpURL(collectedURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Collected received in Parser.getCollected: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	/**
	 * Get records for users that are following the specified user
	 */
	public static ArrayList<UserDTO> getFollowingUsers(String forUserID) {

		userDTOarrays = null;
		String users = "";
		try {
			URL followingURL = new URL(WS.ENDPOINT_following + forUserID);
			users = HTTP.readHttpURL(followingURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out
				.println("Following users received in Parser.getFollowingUsers: "
						+ users);

		try {
			the_json_array = new JSONArray(users);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);

		return userDTOarrays;

	}

	/**
	 * Get users followed by the specified user
	 */
	public static ArrayList<UserDTO> getFollowedByUsers(String forUserID) {
		userDTOarrays = null;
		String users = "";
		try {
			URL followedURL = new URL(WS.ENDPOINT_followedby + forUserID);
			users = HTTP.readHttpURL(followedURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out
				.println("Followed by users received in Parser.getFollowedByUsers: "
						+ users);

		try {
			the_json_array = new JSONArray(users);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);

		return userDTOarrays;

	}

	/**
	 * Get a user's record to be viewed by the specified user
	 */
	public static ArrayList<UserDTO> getUserInfo(String forUserID,
			String viewingUserID) {
		userDTOarrays = null;
		String userInfo = "";
		try {
			URL userInfoURL = new URL(WS.ENDPOINT_userInfo + forUserID
					+ "?viewinguserid=" + viewingUserID);
			userInfo = HTTP.readHttpURL(userInfoURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("User info received in Parser.getUserInfo: "
				+ userInfo);

		// parse JSON, populate arraylist, and store in request object
		if (!userInfo.equals("null")) { // if not empty

			int fbID = 0;
			int userID = 0;
			boolean followed;
			String picURL = "";
			String name = "";
			String link = "";
			String email = "0";
			String time = "";
			String country = "";
			String about = "";
			userDTOarrays = new ArrayList<UserDTO>();

			try {
				the_json_array = new JSONArray(userInfo);

				for (int i = 0; i < the_json_array.length(); i++) {
					JSONObject childJSONObject = the_json_array
							.getJSONObject(i);

					userID = childJSONObject.getInt("userID");
					fbID = childJSONObject.getInt("fbID");
					picURL = childJSONObject.getString("picURL");
					name = childJSONObject.getString("name");
					link = childJSONObject.getString("link");
					email = childJSONObject.getString("email");
					time = childJSONObject.getString("time");
					country = childJSONObject.getString("country");
					about = childJSONObject.getString("about");
					followed = childJSONObject.getBoolean("followed");
					UserDTO userDTO = new UserDTO(userID, fbID, picURL, name,
							link, email, time, country, about, followed);
					userDTOarrays.add(userDTO);

				}

			} catch (JSONException e2) {
				e2.printStackTrace();
			}

		}
		return userDTOarrays;

	}

	/**
	 * Get the user settings
	 */
	public static ArrayList<UserDTO> getUserSettings(String forUserID) {
		userDTOarrays = null;
		String userInfo = "";
		try {
			URL userInfoURL = new URL(WS.ENDPOINT_userSettings + forUserID);
			userInfo = HTTP.readHttpURL(userInfoURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("User settings received in Parser.getUserSettings: "
				+ userInfo);

		// parse JSON, populate arraylist, and store in request object
		if (!userInfo.equals("null")) { // if not empty

			try {
				the_json_array = new JSONArray(userInfo);

				int userID = 0;
				String name = "";
				String email = "0";
				String country = "";
				String about = "";
				String pref_log = "";
				String pref_fbwall = "";
				String pref_emailfollow = "";
				String pref_emailcom = "";
				String pref_emailtrigger = "";

				userDTOarrays = new ArrayList<UserDTO>();

				for (int i = 0; i < the_json_array.length(); i++) {
					JSONObject childJSONObject = the_json_array
							.getJSONObject(i);

					userID = childJSONObject.getInt("userID");
					name = childJSONObject.getString("name");
					email = childJSONObject.getString("email");
					country = childJSONObject.getString("country");
					about = childJSONObject.getString("about");
					pref_log = childJSONObject.getString("pref_log");
					pref_fbwall = childJSONObject.getString("pref_fbwall");
					pref_emailcom = childJSONObject.getString("pref_emailcom");
					pref_emailtrigger = childJSONObject
							.getString("pref_emailtrigger");

					UserDTO userDTO = new UserDTO(userID, name, email, country,
							about, pref_log, pref_fbwall, pref_emailfollow,
							pref_emailcom, pref_emailtrigger);
					userDTOarrays.add(userDTO);

				}

			} catch (JSONException e2) {
				e2.printStackTrace();
			}

		}
		return userDTOarrays;
	}

	/**
	 * Get a list of annotation summaries
	 */
	public static ArrayList<AnnotationDTO> getAnnotations(int from, int count) {

		annotationDTOarrays = null;
		String annotations = null;
		try {
			URL annotationsURL = new URL(WS.ENDPOINT_annotations + "?from="
					+ from + "&count=" + count);
			annotations = HTTP.readHttpURL(annotationsURL);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		System.out.println("Annotations received in Parser.getAnnotations: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
			return null;
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	
	/**
	 * Get a list of user record summaries
	 */
	public static ArrayList<UserDTO> getUsers(int from, int count) {
		userDTOarrays = null;

		String users = "";
		try {
			URL recentUsersURL = new URL(WS.ENDPOINT_allUsers + "?from=" + from
					+ "&count=" + count);
			users = HTTP.readHttpURL(recentUsersURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out
				.println("Recent users received in Parser.getUsers: " + users);

		try {
			the_json_array = new JSONArray(users);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);

		return userDTOarrays;

	}

	
	/**
	 * Get an annotation details as viewed by the specified user
	 */
	public static ArrayList<AnnotationDTO> getAnnotationInfo(int annotationid,
			int viewinguserid) {

		annotationDTOarrays = null;

		String annotations = "";
		try {
			URL annotationURL = new URL(WS.ENDPOINT_annotations + annotationid
					+ "?viewinguserid=" + viewinguserid);
			annotations = HTTP.readHttpURL(annotationURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out
				.println("Annotation details received in Parser.getAnnotationInfo: "
						+ annotations);

		// parse JSON, populate arraylist, and store in request object
		if (annotations!=null) { // if not empty

			int annotationID = 0;
			int userID = 0;
			double lat = 0.0;
			double lon = 0.0;
			boolean bookmarked = false;
			String title = "";
			String category = "";
			String date = "";
			String owner = "";
			String photo = "";
			String description = "";
			String userPic = "";
			String address = "";
			String target = "";
			String expiry = "";

			annotationDTOarrays = new ArrayList<AnnotationDTO>();

			try {
				the_json_array = new JSONArray(annotations);

				for (int i = 0; i < the_json_array.length(); i++) {
					JSONObject childJSONObject = the_json_array
							.getJSONObject(i);

					annotationID = childJSONObject.getInt("annotationID");
					userID = childJSONObject.getInt("userID");
					userPic = childJSONObject.getString("userPic");
					owner = childJSONObject.getString("owner");
					title = childJSONObject.getString("title");
					category = childJSONObject.getString("category");
					description = childJSONObject.getString("description");
					date = childJSONObject.getString("date");
					photo = childJSONObject.getString("photo");
					address = childJSONObject.getString("address");
					lat = childJSONObject.getDouble("lat");
					lon = childJSONObject.getDouble("lon");
					bookmarked = childJSONObject.getBoolean("bookmarked");
					target = childJSONObject.getString("target");
					expiry = childJSONObject.getString("eDate");

					AnnotationDTO annotationDTO = new AnnotationDTO(
							annotationID, userID, userPic, owner, title,
							category, description, date, photo, address, lat,
							lon, bookmarked, target, expiry);

					annotationDTOarrays.add(annotationDTO);
				}

			} catch (JSONException e2) {
				e2.printStackTrace();
			}

		}
		return annotationDTOarrays;

	}

	/**
	 * Get the user record summaries that collected the specified annotation
	 */
	public static ArrayList<UserDTO> getCollectedByUsers(int annotationID) {
		userDTOarrays = null;
		String collectedBy = "";
		try {
			URL collectedByURL = new URL(WS.ENDPOINT_collectedBy + annotationID);
			collectedBy = HTTP.readHttpURL(collectedByURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out
				.println("Collected by users received in Parser.getCollectedByUsers: "
						+ collectedBy);

		try {
			the_json_array = new JSONArray(collectedBy);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);

		return userDTOarrays;

	}

	/**
	 * Get the comments posted to the specified annotation
	 */
	public static ArrayList<CommentDTO> getComments(int theAnnotationID) {
		commentDTOarrays = null;
		String comments = "";
		try {
			URL commentsURL = new URL(WS.ENDPOINT_comments + theAnnotationID);
			comments = HTTP.readHttpURL(commentsURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("Comments received in Parser.getComments: "
				+ comments);

		// parse JSON, populate arraylist, and store in request object
		if (!comments.equals("null")) { // if not empty

			int commentID = 0;
			int annotationID = 0;
			int userID = 0;
			String displayName = "";
			String userPic = "";
			String time = "";
			String comment = "0";
			commentDTOarrays = new ArrayList<CommentDTO>();

			try {
				the_json_array = new JSONArray(comments);

				for (int i = 0; i < the_json_array.length(); i++) {
					JSONObject childJSONObject = the_json_array
							.getJSONObject(i);

					commentID = childJSONObject.getInt("commentID");
					annotationID = childJSONObject.getInt("annotationID");
					userID = childJSONObject.getInt("userID");
					displayName = childJSONObject.getString("displayName");
					userPic = childJSONObject.getString("userPic");
					time = childJSONObject.getString("time");
					comment = childJSONObject.getString("comment");
					CommentDTO commentDTO = new CommentDTO(commentID,
							annotationID, userID, displayName, userPic, time,
							comment);
					commentDTOarrays.add(commentDTO);

				}
			} catch (JSONException e2) {
				e2.printStackTrace();
			}

		}

		return commentDTOarrays;

	}

	
	/**
	 * Get the available categories
	 */
	public static ArrayList<CategoryDTO> getCategories() {
		categoryDTOarrays = null;
		JSONArray the_json_array = null;

		String theCategories = "";

		try {
			URL categoriesURL = new URL(WS.ENDPOINT_categories);
			theCategories = HTTP.readHttpURL(categoriesURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("Categories received in Parser.getCategories: "
				+ theCategories);

		try {
			the_json_array = new JSONArray(theCategories);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		// parse JSON, populate arraylist, and store in request object
		if (!theCategories.equals("null")) { // if not empty
			try {

				int categoryID = 0;
				String category = "";

				categoryDTOarrays = new ArrayList<CategoryDTO>();

				for (int i = 0; i < the_json_array.length(); i++) {
					JSONObject childJSONObject = the_json_array
							.getJSONObject(i);
					categoryID = childJSONObject.getInt("categoryID");
					category = childJSONObject.getString("category");
					CategoryDTO categoryDTO = new CategoryDTO(categoryID,
							category);

					categoryDTOarrays.add(categoryDTO);
				}

			} catch (JSONException e1) {
				e1.printStackTrace();
			}

		}
		return categoryDTOarrays;

	}

	/**
	 * Get summaries of annotations in the specified category
	 */
	public static ArrayList<AnnotationDTO> getFromCategory(String categoryName,
			int from, int count) {

		JSONArray the_json_array = null;
		annotationDTOarrays = null;
		String annotations = "";

		try {
			URL annotationsURL = new URL(WS.ENDPOINT_categories + categoryName
					+ "?from=" + from + "&count=" + count);
			System.out.println(annotationsURL.toString());
			annotations = HTTP.readHttpURL(annotationsURL);

		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("Annotations received in Parser.getFromCategory: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	/**
	 * Get user summaries of user records matching the specified seach string
	 */
	public static ArrayList<UserDTO> searchUsers(String searchString, int from,
			int count) {
		userDTOarrays = null;

		String foundUsers = "";
		try {
			URL searchUsersURL = new URL(WS.ENDPOINT_searchUsers + searchString
					+ "?from=" + from + "&count=" + count);
			foundUsers = HTTP.readHttpURL(searchUsersURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("Found users received in Parser.searchUsers: "
				+ foundUsers);

		try {
			the_json_array = new JSONArray(foundUsers);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);

		return userDTOarrays;

	}

	/**
	 * Get summaries for annotations matching the specified keyword
	 */
	public static ArrayList<AnnotationDTO> searchByKeyword(String keyword,
			int from, int count) {

		annotationDTOarrays = null;
		String annotations = "";
		try {
			URL annotationsURL = new URL(WS.ENDPOINT_searchannotations
					+ keyword + "?from=" + from + "&count=" + count);
			System.out.println(annotationsURL.toString());
			annotations = HTTP.readHttpURL(annotationsURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Annotations received in Parser.searchByKeyword: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	
	/**
	 * Get summaries of annoations close to the specified lat,lon location with the specified radius
	 */
	public static ArrayList<AnnotationDTO> searchNearby(double lat, double lon,
			int radius, int from, int count) {

		annotationDTOarrays = null;
		String annotations = "";
		try {
			URL annotationsURL = new URL(WS.ENDPOINT_searchannotationsnearby
					+ "?lat=" + lat + "&lon=" + lon + "&radius=" + radius
					+ "&from=" + from + "&count=" + count);
			System.out.println(annotationsURL.toString());
			annotations = HTTP.readHttpURL(annotationsURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Annotations received in Parser.searchNearby: "
				+ annotations);

		try {
			the_json_array = new JSONArray(annotations);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		annotationDTOarrays = processAnnotations(the_json_array);

		return annotationDTOarrays;

	}

	/**
	 * Get the Facebook friends of the specified user, that are registered on the system
	 */
	public static ArrayList<UserDTO> getFbFriends(String accessToken, int from,
			int count) {
		userDTOarrays = null;

		String foundUsers = null;
		try {
			URL searchUsersURL = new URL(WS.ENDPOINT_fbFriends + accessToken+ "?from=" + from + "&count=" + count);
			foundUsers = HTTP.readHttpURL(searchUsersURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("FB friends received in Parser.getFbFriends: "+ foundUsers);

		if (foundUsers!=null){
		try {
			the_json_array = new JSONArray(foundUsers);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);
		}

		return userDTOarrays;

	}

	
	/**
	 * Get summaries of users that bookmarked the specified annotaion
	 */
	public static ArrayList<UserDTO> getBookmarkedByUsers(int annotationID) {
		userDTOarrays = null;
		String bookmarkedBy = "";
		try {
			URL collectedByURL = new URL(WS.ENDPOINT_bookmarkedBy
					+ annotationID);
			bookmarkedBy = HTTP.readHttpURL(collectedByURL);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out
				.println("Collected by users received in Parser.getCollectedByUsers: "
						+ bookmarkedBy);

		try {
			the_json_array = new JSONArray(bookmarkedBy);
		} catch (JSONException e2) {
			e2.printStackTrace();
		}

		userDTOarrays = processUsers(the_json_array);

		return userDTOarrays;

	}

}
