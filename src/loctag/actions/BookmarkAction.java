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
 * Struts Action that handles requests for adding and removing bookmarks
 */
public class BookmarkAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String annotationID = request.getParameter("id").toString();
		ActionForward forward = new ActionForward();

		// if adding bookmark
		if (request.getParameter("add") != null) {
			try {
				String bookmarkURL = WS.ENDPOINT_bookmarks
						+ request.getSession().getAttribute("userID");
				
				//perform HTTP POST
				String ack = HTTP.postHttpURL(bookmarkURL, annotationID);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				//forward to the bookmarked annotation page
				forward.setPath("annotation.do?id="
						+ request.getParameter("id"));
			}
		}

		// if removing bookmark
		if (request.getParameter("remove") != null) {
			try {
				String bookmarkURL = WS.ENDPOINT_bookmarks
						+ request.getSession().getAttribute("userID")
						+ "/bookmark/" + annotationID;
				
				//perform HTTP DELETE
				String ack = HTTP.deleteHttpURL(bookmarkURL, annotationID);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				//forward to homepage
				forward.setPath("homepage.do");
			}
		}

		forward.setRedirect(true);
		return forward;
	}
}
