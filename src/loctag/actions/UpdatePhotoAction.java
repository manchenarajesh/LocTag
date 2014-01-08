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
 * Struts Action that handles requests for updating an annotation's photo
 */
public class UpdatePhotoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {


		//extract fields from the request object
		
		String ownerID = request.getParameter("ownerid");
		
		String photoFilename=request.getParameter("picture");

		String annotationID=request.getParameter("annotationid");

		String userID = request.getSession().getAttribute("userID").toString();


		if (ownerID.equals(userID)) {

		//perform HTTP PUT
		try {
			String updatePhotoURL = WS.ENDPOINT_updatephoto+annotationID;
			String ack = HTTP.putHttpURL(updatePhotoURL,photoFilename);
	  		System.out.println(ack);

		} catch (IOException e) {
			e.printStackTrace();
		}
  		
		}
  		
		//forward back to the jsp page of the updated annotation
		ActionForward forward = new ActionForward();
		forward.setPath("annotation.do?id="+annotationID);
		forward.setRedirect(true);
		return forward;		
	}
}
