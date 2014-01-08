package loctag.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import loctag.util.Parser;


/**
 * Struts Action that handles requests for viewing the homepage
 */
public class HomePageAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {

		String forUserID=request.getSession().getAttribute("userID").toString();

	    
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
		

	    //forward to homepage jsp
		return (mapping.findForward("success"));
	}
}



