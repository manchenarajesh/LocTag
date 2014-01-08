package loctag.constants;

/**
 * Constants related to the Facebook authentication process
 */
public class FB {

	
	public static final String secret = "e5be1b66af9e9f6c60b920006d9182fb";
	public static final String client_id = "136345049777415";
	public static final String oauthURL = "https://graph.facebook.com/oauth/access_token?";
		
	//The servlet URL for the authentication filter (as set up on the FB app settings)
	
	//local deployment
	public static final String redirect_uri = "http://kmckay.homeip.net:8080/LocTag/fblogin/";
	
	//amazon deployment
	//	public static final String redirect_uri = "http://www.loctag.mobi/fblogin/";
	
	
}
