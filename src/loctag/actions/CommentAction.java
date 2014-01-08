package loctag.actions;

import java.io.IOException;
import javax.servlet.http.*;
import loctag.DTO.CommentDTO;
import loctag.constants.WS;
import loctag.util.HTTP;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

/**
 * Struts Action that handles requests for posting comments
 */
public class CommentAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {


	
		HttpSession session = request.getSession();		
		int annotationID=Integer.valueOf(request.getParameter("annotationid").toString());
		int userID=Integer.valueOf(session.getAttribute("userID").toString());
		String comment=request.getParameter("comment");
		
		//construct a comment DTO
		CommentDTO commentDTO = new CommentDTO(userID,comment);

		//convert it to JSON
		Gson gson = new Gson();
  		String jsonComment = gson.toJson(commentDTO);
  		 		

		//perform HTTP POST
		try {
			String commentURL = WS.ENDPOINT_comments+annotationID;
			String ack = HTTP.postHttpURL(commentURL,jsonComment);
	  		

		} catch (IOException e) {
			e.printStackTrace();
		}
  		

  		//forward to the annotation page to which the comment was posted
		ActionForward forward = new ActionForward();
		forward.setPath("annotation.do?id="+request.getParameter("annotationid"));
		forward.setRedirect(true);
		return forward;		
	}
}
