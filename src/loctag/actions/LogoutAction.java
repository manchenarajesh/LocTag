package loctag.actions;

import javax.servlet.http.*;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * Struts Action that handles requests for logging out
 */
public class LogoutAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		//invalidate the session
		session.invalidate();
  		
		//forward to login jsp
		return (mapping.findForward("success"));
		
	}
}
