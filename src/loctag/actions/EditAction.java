package loctag.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import loctag.DTO.AnnotationDTO;
import loctag.DTO.CategoryDTO;
import loctag.util.Parser;

/**
 * Struts Action that handles requests for the edit annotatio page
 */

public class EditAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		int viewingUserID = 0;
		int ownerID = 0;
		int annotationID = Integer.valueOf(request.getParameter("id"));
		if (request.getSession().getAttribute("userID") != null) {
			viewingUserID = Integer.valueOf(request.getSession().getAttribute("userID").toString());
		}

		// get annotation details******************
		ArrayList<AnnotationDTO> annotationDetails = Parser.getAnnotationInfo(
				annotationID, viewingUserID);
		ownerID = Integer.valueOf(annotationDetails.get(0).getUserID());
		// ****************************

		// get category names******************
		ArrayList<CategoryDTO> categories = Parser.getCategories();
		// ****************************

		if (viewingUserID == ownerID) {
			//store the annotation details and categores list in the request object
			request.setAttribute("annotationsArrayList", annotationDetails);
			request.setAttribute("categoriesArrayList", categories);
		}

		//forward to jsp
		return (mapping.findForward("success"));

	}
}
