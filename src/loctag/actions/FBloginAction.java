package loctag.actions;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import loctag.constants.*;
import loctag.util.Facebook;
import loctag.util.HTTP;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

/**
 * Struts Action that handles requests for logging in with Facebook
 */
public class FBloginAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){

		HttpSession session = request.getSession();

		//extract the code from the request URL sent by Facebook
		String code = request.getParameter("code");
		System.out.println("Received code in FBloginAction: " + code);

		String userID, fbID, picURL, link, name, email, country = null;

		if (code != null) {
			System.out.println("FB auth Code received in FBloginAction:" + code);

			try {

				//use the received code to get the access token from Facebook
				String fbAccessToken = Facebook.getAccessToken(code);

				//get the user record from the web service, using the accessToken
				URL record = new URL(WS.ENDPOINT_userInfoLogin + fbAccessToken);
				String userRecord = HTTP.readHttpURL(record);

				System.out.println("User Record received in FBloginAction.execute: "+ userRecord);

				// Parse the user record received from the web service
				JSONObject jsonUserRecord = (JSONObject) JSONSerializer.toJSON(userRecord);

				userID = (String) jsonUserRecord.getString("userID");
				fbID = (String) jsonUserRecord.getString("fbID");
				picURL = (String) jsonUserRecord.getString("picURL");
				link = (String) jsonUserRecord.getString("link");
				name = (String) jsonUserRecord.getString("name");
				email = (String) jsonUserRecord.getString("email");
				country = (String) jsonUserRecord.getString("country");

				// Store them in session
				session.setAttribute("userID", userID);
				session.setAttribute("fbID", fbID);
				session.setAttribute("picURL", picURL);
				session.setAttribute("link", link);
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("fbAccessToken", fbAccessToken);
				session.setAttribute("country", country);

			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			//forward to homepage jsp
			ActionForward forward = new ActionForward();
			forward.setPath("../homepage.do");
			forward.setRedirect(true);
			return forward;
		}

		else {
			//if not successful forward back to the login page
			System.out.println("FB auth Code problem in FBloginAction");
			ActionForward forward = new ActionForward();
			forward.setPath("../loginpage.do");
			forward.setRedirect(true);
			return forward;
		}

	}
}
