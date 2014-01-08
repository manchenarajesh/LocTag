package loctag.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import loctag.util.Parser;


/**
 * Struts Action that handles requests for the create annotation page
 */
public class CreateAnnotationAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {

	    
		//get category names******************	
		request.setAttribute("categoriesArrayList", Parser.getCategories());
		//****************************
		
		//forward to jsp
		return (mapping.findForward("success"));
	}
}
