package loctag.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;



import loctag.util.Parser;


/**
 * Struts Action that handles requests for viewing a user's profile
 */

public class ViewUserAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {

		String viewingUserID=request.getSession().getAttribute("userID").toString();
		String forUserID=request.getParameter("user").toString();

		//get user info******************
	    request.setAttribute("userInfo", Parser.getUserInfo(forUserID,viewingUserID));
		//****************************
		
		
	    //get created******************
	    request.setAttribute("createdArrayList", Parser.getCreatedRecords(forUserID,0,5));
		//****************************
		

		//get bookmarks******************
	    request.setAttribute("bookmarksArrayList", Parser.getBookmarks(forUserID));
		//****************************
		

		//get collected******************
	    request.setAttribute("collectedArrayList", Parser.getCollected(forUserID));
		//****************************
		
		
		//get following users******************
	    request.setAttribute("followingArrayList", Parser.getFollowingUsers(forUserID));
		//****************************

		
		
		//get followed by users******************
	    request.setAttribute("followedbyArrayList", Parser.getFollowedByUsers(forUserID));
		//****************************


	    //forward to jsp page
		return (mapping.findForward("success"));
	}
}



