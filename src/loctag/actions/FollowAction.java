package loctag.actions;

import java.io.IOException;
import javax.servlet.http.*;
import loctag.constants.WS;
import loctag.util.HTTP;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * Struts Action that handles requests for following or unfollowing a user
 */
public class FollowAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		ActionForward forward = new ActionForward();		
		String followID=request.getParameter("id").toString();
		
		
		//if adding following user
		if (request.getParameter("add")!=null){
		try {
			String followingURL = WS.ENDPOINT_following+request.getSession().getAttribute("userID");
			String ack = HTTP.postHttpURL(followingURL,followID);
	  		System.out.println(ack);

		} catch (IOException e) {
			e.printStackTrace();
		}
		finally{
			//forward to the user page of the user followed
			forward.setPath("viewuser.do?user="+request.getParameter("id"));

		}
		}

		
		//if removing following user
		if (request.getParameter("remove")!=null){
		try {
			String followingURL = WS.ENDPOINT_following+request.getSession().getAttribute("userID")+"/following/"+followID;
			String ack = HTTP.deleteHttpURL(followingURL,followID);
	  		System.out.println(ack);

		} catch (IOException e) { 
			e.printStackTrace();
		}
		finally{
			//forward to homepage jsp
			forward.setPath("homepage.do");
		}

		}

  		
		forward.setRedirect(true);
		return forward;		
	}
}
