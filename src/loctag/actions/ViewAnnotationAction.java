package loctag.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import loctag.util.Parser;


/**
 * Struts Action that handles requests for viewing the details of an annotation
 */
public class ViewAnnotationAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {

		int viewingUserID=0;
	    int annotationID = Integer.valueOf(request.getParameter("id"));
		if (request.getSession().getAttribute("userID")!=null){
			viewingUserID = Integer.valueOf(request.getSession().getAttribute("userID").toString());
		}
		
		//get annotation details******************
		request.setAttribute("annotationsArrayList", Parser.getAnnotationInfo(annotationID,viewingUserID));
		//****************************
		
		
		//get collected by******************	
		request.setAttribute("collectedByArrayList", Parser.getCollectedByUsers(annotationID));	
		//****************************
		
		//get bookmarked by******************	
		request.setAttribute("bookmarkedByArrayList", Parser.getBookmarkedByUsers(annotationID));	
		//****************************
	
		
		//get comments******************
		request.setAttribute("commentsArrayList", Parser.getComments(annotationID));
		//****************************
		
		
		//forward to jsp
		return (mapping.findForward("success"));
	}
}
