package loctag.util;

import loctag.constants.*;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;

/**
 * Utility class for handling HTTP calls
 */
public class HTTP {
	
	/**
	 * Reads HTTP response from server, providing authentication information
	 */
	public static String readHttpURL(URL theURL) throws IOException {

		String url = theURL.toString();
		HttpClient client = new HttpClient();
		client.getState().setCredentials(new AuthScope(AuthScope.ANY_HOST,AuthScope.ANY_PORT, WS.realm), new UsernamePasswordCredentials(WS.username,WS.password));
		GetMethod get = new GetMethod(url);
		get.setDoAuthentication(true);

		int statusCode = client.executeMethod(get);
        
        if (statusCode != HttpStatus.SC_OK) {
            
            System.err.println("Method failed: " + get.getStatusLine());
        }
        
        try{
        
	        // Read the response body.
	        byte[] responseBody = get.getResponseBody();
	        
	        
	        String response = new String(responseBody);
	        System.out.println("Response received by readHttpURL in Client: "+response);
			
			return response;
      
        }
        catch (NullPointerException e){
        	return null;
        }
        
	}

	/**
	 * Send HTTP post to server, providing authentication information
	 */
	public static String postHttpURL(String theURL, String body) throws IOException {

		// initialize the POST method
		PostMethod post = new PostMethod(theURL);
		post.setRequestBody(body);

		// execute the POST
		HttpClient client = new HttpClient();
		client.getState().setCredentials(new AuthScope(AuthScope.ANY_HOST,AuthScope.ANY_PORT, WS.realm), new UsernamePasswordCredentials(WS.username,WS.password));

		int status = client.executeMethod(post); 
		String response = post.getResponseBodyAsString();
		
		return response;
		
	}

	/**
	 * Send HTTP delete to server, providing authentication information
	 */
	public static String deleteHttpURL(String theURL, String body) throws IOException {

		// initialize the DELETE method
		DeleteMethod delete = new DeleteMethod(theURL);

		// execute the DELETE
		HttpClient client = new HttpClient();
		client.getState().setCredentials(new AuthScope(AuthScope.ANY_HOST,AuthScope.ANY_PORT, WS.realm), new UsernamePasswordCredentials(WS.username,WS.password));

		int status = client.executeMethod(delete); 
		String response = delete.getResponseBodyAsString();
		
		return response;
		
	}

	/**
	 * Send HTTP put to server, providing authentication information
	 */
	public static String putHttpURL(String theURL, String body) throws IOException {

		// initialize the PUT method
		System.out.println("The URL in putHttpURL is: "+theURL);
		PutMethod put = new PutMethod(theURL);
		put.setRequestBody(body);

		// execute the PUT
		HttpClient client = new HttpClient();
		client.getState().setCredentials(new AuthScope(AuthScope.ANY_HOST,AuthScope.ANY_PORT, WS.realm), new UsernamePasswordCredentials(WS.username,WS.password));

		int status = client.executeMethod(put); 
		System.out.println("Status in putHttpURL: "+status);
		String response = put.getResponseBodyAsString();
		
		return response;
		
	}
	
}
