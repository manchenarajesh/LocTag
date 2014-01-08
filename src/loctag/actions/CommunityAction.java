package loctag.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.net.URLEncoder;
import loctag.util.Parser;


/**
 * Struts Action that handles requests for viewing the community page
 */
public class CommunityAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {


		//get the most recently registered users
		request.setAttribute("recentUsersArrayList", Parser.getUsers(0,5));
		//****************************
		
		//get FB friends
		String accessToken = request.getSession().getAttribute("fbAccessToken").toString();
		accessToken=URLEncoder.encode(accessToken);
		request.setAttribute("fbFriendsArrayList", Parser.getFbFriends(accessToken, 0, 20));
		//****************************
		
		
		//get recent annotations
	    request.setAttribute("recentAnnotationsArrayList", Parser.getAnnotations(0,5));
		//****************************
		
	    //forward to jsp
		return (mapping.findForward("success"));
	}
}
