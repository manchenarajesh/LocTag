package loctag.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import loctag.util.Parser;

/**
 * Struts Action that handles requests for searches
 */
public class SearchAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		// get category names if not an ajax call******************
		if (request.getParameter("ajax")==null)
			request.setAttribute("categoriesArrayList", Parser.getCategories());
		// ****************************

		
		// if searching for user
		if (request.getParameter("user") != null) {
			String userString = request.getParameter("user").toString();

			if (userString == "")
				userString = "-";
			
			userString = URLEncoder.encode(userString);

			// get user  records matching the specified string and store results in request object
			request.setAttribute("usersArrayList",Parser.searchUsers(userString, 0, 5));
		}
		// ****************************


		//if searching by category
		if (request.getParameter("category") != null) {

			String category = request.getParameter("category").toString();

			// get annotations in the specified category name and store results in request object
			request.setAttribute("annotationsArrayList",Parser.getFromCategory(category, 0, 5));

		}
		// ****************************


		//if searching by keyword
		if (request.getParameter("keyword") != null) {

			String keyword = request.getParameter("keyword").toString();
			String searchResults=null;
			
			if (keyword == "") keyword = "--";

			keyword = URLEncoder.encode(keyword);

			// if handling an AJAX request
			if (request.getParameter("ajax")!=null) {
				
				System.out.println("Doing AJAX");
				response.setContentType("text");
				
				try{
				searchResults = Parser.searchByKeyword(keyword, 0, 5).toString();
				}
				catch (NullPointerException n){
				searchResults = null;	
				}
				System.out.println("The search results are: "+searchResults);
				if (searchResults != null) {
					try {
						PrintWriter writer;
						writer = response.getWriter();
						writer.print(searchResults);
						writer.flush();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
				return null;

			// else if not an ajax call, store the results in the request object
			} else {
				request.setAttribute("annotationsArrayList", Parser.searchByKeyword(keyword, 0, 5));
			}
		}
		// ****************************
		
		
		//if searching by lat,lon

		String searchResults = null;
		
		if (request.getParameter("autoLat") != null
				&& request.getParameter("autoLon") != null) {

			double autoLat = Double.valueOf(request.getParameter("autoLat"));

			System.out.println("The auto lat is: " + autoLat);

			double autoLon = Double.valueOf(request.getParameter("autoLon"));

			System.out.println("The auto lon is: " + autoLon);

			String theRadius = "5000";
			int radius = Integer.valueOf(theRadius);

			//if handling an AJAX request
			if (request.getParameter("ajax")!=null) {
				
				System.out.println("Doing AJAX");
				response.setContentType("text");
				
				try{
				searchResults = Parser.searchNearby(autoLat, autoLon, 150, 0, 5).toString();
				}
				catch (NullPointerException n){
				searchResults = null;	
				}
				System.out.println("The search results are: "+searchResults);
				if (searchResults != null) {
					try {
						PrintWriter writer;
						writer = response.getWriter();
						writer.print(searchResults);
						writer.flush();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
				return null;
				
			//else if not an ajax call, store the results in the request object
			} else {
			
			request.setAttribute("annotationsArrayList",
					Parser.searchNearby(autoLat, autoLon, radius, 0, 5));
			}
			// ****************************
		}

		//forward to jsp
		return (mapping.findForward("success"));
	}
}
