<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%-- Tag libs --%>
<%@ taglib prefix="fmt" uri="/WEB-INF/lib/fmt.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/lib/c.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/lib/struts-logic.tld"%>
<%@ taglib uri="/WEB-INF/lib/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>


<html lang="en">
<head>

<jsp:include page="_header.html" />


</head>
<body>
	<!-- #header -->

	<div id="header">
		<!-- #logo -->

		<div id="logo">
			<h1><a href="homepage.do"><img src="img/loctaglogo.png"></a></h1>
		</div>
		<!-- end #logo -->
		
		<!-- #menu -->
		
		<logic:present scope="session" name="userID">

			<div id="menu">

				<jsp:include page="_menu.html" />

			</div>
		</logic:present>
		
		<!-- end #menu -->
		

	</div>
	<!-- end #header -->
	

	<div id="wrapper">
		<div id="wrapper-bgtop">
			<div id="wrapper-bgbtm">
				<div id="page">
				
					<!-- #content -->
					<div id="contentbig">


						<logic:notPresent name="annotationsArrayList" >

							<p class="info">Sorry, a LocTag with this ID doesn't exist</p>
						
						</logic:notPresent>

						<form name="editDetails" id="editDetails" action="updatedetails.do">
						<logic:present name="annotationsArrayList">
							<logic:iterate name="annotationsArrayList" id="annotationDetails">

								<!-- #annotation details -->

								<div class="post">
									<h2 class="title">
										<a href="#">Title</a>
									</h2>
									
									<div class="entry">
											<input type="text" id="title" name="title" size="40" value="<bean:write name="annotationDetails" property="title" />" />																					
											<font color="red"><span id="titlestatus"></span> </font>
																			
									</div>
								</div>
								
								<div class="post">
									<h2 class="title">
										<a href="#">Category</a>
									</h2>
									<div class="entry">
									
									<logic:notPresent name="categoriesArrayList">
										<p class="info">No categories to choose from...</p>
									</logic:notPresent>

									<!-- Parse category titles and populate dropdown box -->
									<logic:present name="categoriesArrayList">
										
											<select id="category" name="categoryID">
												<logic:iterate name="categoriesArrayList" id="categoryDetails">
													<option
													
													<c:if test="${categoryDetails.category == annotationDetails.category}">
														selected="selected"
													</c:if>
													
													value="<bean:write name="categoryDetails" property="categoryID" />">
													<bean:write name="categoryDetails" property="category" />																			
													

													

																											
													</option>
												</logic:iterate>
											</select>
										
									</logic:present>
									
									</div>
								</div>
								
								
								<div class="post">
									<h2 class="title">
										<a href="#">Address</a>
									</h2>
									
									<div class="entry">
											<input type="text" id="address" size="40" name="address" value="<bean:write name="annotationDetails" property="address" />" />		
											<font color="red"><span id="addressstatus"></span> </font>																											
									</div>
								</div>
								
								
								<div class="post">
									<h2 class="title">
										<a href="#">Description</a>
									</h2>
									
									<div class="entry">
											<textarea cols="50" rows="5" id="description" name="description" ><bean:write name="annotationDetails" property="description" /></textarea>
											<font color="red"><span id="descriptionstatus" /></font>
																																							
									</div>
								</div>
								
								
								
								<div class="post">
									<h2 class="title">
										<a href="#">Link</a>
									</h2>
									
									<div class="entry">

									<b>Optional:</b> Link this LocTag to a web URL or another LocTag to be triggered when users reach this place while running the mobile app.
									You can chain this LocTag to another by linking to its webpage, ex:<em>www.loctag.mobi/21</em><br><br>
									http://
									<logic:notEqual name="annotationDetails" property="target" value="null">
											<input type="text" size="40" name="target" id="target" value="<bean:write name="annotationDetails" property="target" />" />
									</logic:notEqual>
									<logic:equal name="annotationDetails" property="target" value="null">
											<input type="text" size="40" name="target" id="target" />
									</logic:equal> 
									
									<font color="red"><span id="targetstatus"></span> </font> 
									
									<br><br>
									<b>Optional:</b> Specify a date until when this link will be valid: 							
									
									<input type="text" size="10" name="ADate" id="ADate" onclick="displayDatePicker('ADate');" value="" />

																		
									
									<input type=button value="Pick date" onclick="displayDatePicker('ADate');">
									<br>
									<font color="red"><span id="datestatus"></span> </font> 
									
									
									<br> <br> <br> <br>
									
									<a class="links" id="submitButton" onClick="submitAnnotation()">Submit Changes</a> 
									<br> <br> <br> 
									<font color="red"><span id="submitstatus"></span></font>
									
																																						
									</div>
								</div>
								
								<input type="hidden" name="annotationid" id="annotationID" type="text" value="<bean:write name="annotationDetails" property="annotationID"/>" size="10" />
								<input type="hidden" name="ownerid" id=ownerid type="text" value="<bean:write name="annotationDetails" property="userID"/>" size="10" />
														
								</form>
								<!-- end #annotation details -->

					</logic:iterate>
					</logic:present>
								
				</div>
				</div>
				<!-- end #page -->


<jsp:include page="_footer.html" />


<!-- Stylesheet for datepicker -->
<link rel="stylesheet" href="scripts/datepickerstyle.css" type="text/css" media="screen" charset="utf-8" />

<!-- Script to pick a date -->
<script type="text/javascript" src="scripts/datepicker.js"></script>

<!-- Script to validate a date -->
<script type="text/javascript" src="scripts/datevalidation.js"></script>

<!-- Script to validate a URL -->
<script type="text/javascript" src="scripts/urlvalidation.js"></script>

<!-- Validation of form fields -->
<script type="text/javascript">
function submitAnnotation(){
	
	var title=document.getElementById("title").value;
	var description=document.getElementById("description").value;
	var address=document.getElementById("address").innerHTML;
	var target=document.getElementById("target").value;
	var theDate=document.getElementById("ADate");
	
	var titlestatus=document.getElementById("titlestatus");
	var descriptionstatus=document.getElementById("descriptionstatus");
	var addressstatus=document.getElementById("addressstatus");
	var targetstatus=document.getElementById("targetstatus");
	

	
	if (title==null || title==""){
		titlestatus.innerHTML="Title is required";
		submitstatus.innerHTML="Please review the form and fill in the required fields";	
		return false;
	}
		
	if (description==null || description==""){
		descriptionstatus.innerHTML="Description is required";	
		submitstatus.innerHTML="Please review the form and fill in the required fields";
		return false;
	}
		
	
	if (!isUrl(target)){
		targetstatus.innerHTML="URL is not a valid web address";
		submitstatus.innerHTML="Please review the form and fill in the required fields";
		return false;
	}
	
	if (document.forms[0].ADate.value.length>2&&!checkdate(document.forms[0].ADate)){
		datestatus.innerHTML="Date is not valid. Format should be mm/dd//yyyy and should be a future date";
		submitstatus.innerHTML="Please review the form and fill in the required fields";
		return false;
	}

	document.forms["editDetails"].submit();
          
}

</script>