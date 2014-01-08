package loctag.util;

import loctag.constants.*;
import java.io.IOException;
import java.net.URL;

/**
 * Utility class for handling calls to the Facebook API
 */
public class Facebook {

	/**
	 * Formulates a URL for requesting the access token from the Facebook API
	 * @param authCode The authorization code string
	 * @return String The URL for making a request to the Facebook API 
	 */
	public static String getAccessTokenURL(String authCode) {
		return FB.oauthURL + "client_id=" + FB.client_id + "&redirect_uri="
				+ FB.redirect_uri + "&client_secret=" + FB.secret + "&code="
				+ authCode;
	}

	/**
	 * Get the Facebook access token
	 * @param theCode The authorization code string
	 * @return String The access token
	 */
	public static String getAccessToken(String theCode) throws IOException {
		String authURL = getAccessTokenURL(theCode);
		URL token = new URL(authURL);
		String result = HTTP.readHttpURL(token);
		String accessToken = null;
		Integer expires = null;
		String[] pairs = result.split("&");
		for (String pair : pairs) {
			String[] kv = pair.split("=");
			if (kv.length != 2) {
				System.out
						.println("Unexpected response in Facebook.getAccessToken()");
				return ("Unexpected response");
			} else {
				if (kv[0].equals("access_token")) {
					accessToken = kv[1];
				}
				if (kv[0].equals("expires")) {
					expires = Integer.valueOf(kv[1]);
				}
			}
		}
		if (accessToken != null && expires != null) {
			System.out.println("Access token:" + accessToken);
			System.out.println("Expires:" + expires);
		}
		System.out
				.println("Access token retreived by Facebook.getAccessToken():"
						+ accessToken);
		return accessToken;
	}
}
