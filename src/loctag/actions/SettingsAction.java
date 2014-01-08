package loctag.actions;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.google.gson.Gson;
import loctag.DTO.UserDTO;
import loctag.constants.WS;
import loctag.util.HTTP;
import loctag.util.Parser;


/**
 * Struts Action that handles requests for viewing or changing the user settings
 */
public class SettingsAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();

		
		String userID=request.getSession().getAttribute("userID").toString();

		//get user info******************  
		request.setAttribute("userInfo", Parser.getUserSettings(userID));
		//****************************
		
		
	    
	    //if submitting form
	    if (request.getParameter("displayname")!=null){
	    	
			String displayname = request.getParameter("displayname");
			String email = request.getParameter("email");
		    String country = request.getParameter("country");
		    String about = request.getParameter("about");
		    
		    String fbwall = request.getParameter("fbwall");
		    String emailcom = request.getParameter("emailcom");
		    String emailtrigger = request.getParameter("emailtrigger");
		    String emailfollow = request.getParameter("emailfollow");
		    String log = request.getParameter("log");
			
				
		
		    int userid = Integer.valueOf(userID);
			UserDTO settingsDTO = new UserDTO(userid, displayname,
					email, country,
					about, log,
					fbwall, emailfollow, emailcom,
					emailtrigger);

			//convert it to JSON
			Gson gson = new Gson();
	  		String jsonSettings = gson.toJson(settingsDTO);
	  		String ack=""; 	
	  		
			//perform HTTP PUT
			try {
				String settingsURL = WS.ENDPOINT_userSettings+request.getSession().getAttribute("userID");
				ack = HTTP.putHttpURL(settingsURL,jsonSettings);

			} catch (IOException e) {
				e.printStackTrace();
			}
			finally{
				forward.setPath("settings.do?updated=true");
				forward.setRedirect(true);
			}

			return forward;	


	    }
		return (mapping.findForward("success"));

	}
	
}



