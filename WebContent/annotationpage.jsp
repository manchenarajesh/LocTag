<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%-- Tag libs --%>
<%@ taglib prefix="fmt" uri="/WEB-INF/lib/fmt.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/lib/c.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/lib/struts-logic.tld"%>
<%@ taglib uri="/WEB-INF/lib/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>

<fmt:setBundle basename="ApplicationResources" />

<html lang="en">
<head>

<jsp:include page="_header.html" />

</head>
<body>
	<!-- #header -->

	<div id="header">
		<!-- #logo -->

		<div id="logo">
			<h1>
				<a href="homepage.do"><img src="img/loctaglogo.png">
				</a>
			</h1>
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
					<div id="content">


<!-- 					If a LocTag with a non-existing ID is requested -->
						<logic:notPresent name="annotationsArrayList">

							<p class="info">Sorry, a LocTag with this ID doesn't exist</p>

						</logic:notPresent>

						<logic:present name="annotationsArrayList">
							<logic:iterate name="annotationsArrayList" id="annotationDetails">

								<!-- #annotation details -->

								<div class="post">
									<h2 class="title">
										<a href="#"><bean:write name="annotationDetails" property="title" />
										</a>
									</h2>

									<div class="entry">


											
												Web address (public): 
												<b>
												<a target="_blank" href="http://loctag.mobi/<bean:write name="annotationDetails" property="annotationID" />">
												loctag.mobi/<bean:write name="annotationDetails" property="annotationID" />
												</a>
												</b>
												<br>
											
										<logic:notEqual name="annotationDetails" property="address" value="">
												
												Street address: <bean:write name="annotationDetails" property="address" />
												<br>

										</logic:notEqual>
										
										<logic:present scope="session" name="userID">
											<logic:equal name="annotationDetails" property="bookmarked"
												value="true">
												<br>
												<b>You have bookmarked this LocTag</b>
												<br>


											</logic:equal>
										</logic:present>

										<!-- Show edit details button if the viewing user is the owner of the LocTag-->

										<c:if test="${annotationDetails.userID == userID}">


											<br><br>
											<a
												href="edit.do?id=<bean:write name="annotationDetails" property="annotationID"/>"
												class="links" id="edit">Edit LocTag Details</a>
											
											<br>
											<br>

										</c:if>


										

										<font color="red"><span id="picturestatus"></span></font> 
										<font color="#D15600"><span id="photostatus"></span></font>
										
										<div id="thePicture">

											<logic:notEqual name="annotationDetails" property="photo"
												value="">
												<br>
												<img id="existingPic" border="0"
													style="padding: 3px 3px 3px 3px;" width=500
													src="./uploads/medium_<bean:write name="annotationDetails" property="photo"/>" />
												<br>
												<br>
											</logic:notEqual>


										</div>


										<!-- Show add photo button if the viewing user is the owner of the LocTag-->
										<c:if test="${annotationDetails.userID == userID}">

											<form id="submitphoto" name="photo" action="updatephoto.do" method='post'>
												<input type="hidden" name="annotationid" id="annotationID"
													type="text"
													value="<bean:write name="annotationDetails" property="annotationID"/>"
													size="10" /> <input type="hidden" name="picture"
													id="pictureFileName" type="text" value="" size="10" /> <input
													type="hidden" name="ownerid" id=ownerid type="text"
													value="<bean:write name="annotationDetails" property="userID"/>"
													size="10" />

											</form>
											<br>
											<a href="#" class="links" id="upload">Add / Change Photo</a>
											<br>
											<br>
											<br>

										</c:if>

										<br>
										<H2>
											<em>"<bean:write name="annotationDetails" property="description" />"</em>
										</H2>

										<input type="hidden" id="lat" name="lat"
											value="<bean:write name="annotationDetails" property="lat"/>" />
										<input type="hidden" id="lon" name="lon"
											value="<bean:write name="annotationDetails" property="lon"/>" />


										<br>

										<!-- #map location -->

										<div id="map" align="center">
											<iframe width="500" height="300" frameborder="0"
												scrolling="no" marginheight="0" marginwidth="0"
												src="http://maps.google.co.uk/maps?f=d&amp;hl=en&amp;geocode=&amp;time=&amp;date=&amp;ttype=&amp;saddr=<bean:write name="annotationDetails" property="lat"/>,<bean:write name="annotationDetails" property="lon"/>&amp;daddr=&amp;mra=mi&amp;mrsp=0&amp;sz=17&amp;sll=<bean:write name="annotationDetails" property="lat"/>,<bean:write name="annotationDetails" property="lon"/>&amp;sspn=0.002955,0.007231&amp;ie=UTF8&amp;om=1&amp;s=AARTsJoEyPqIJPj996ukoTxj9NtO76Rocg&amp;ll=<bean:write name="annotationDetails" property="lat"/>,<bean:write name="annotationDetails" property="lon"/>&amp;spn=0.121783,0.205994&amp;z=14&amp;output=embed"></iframe>
											<br />
										</div>

										<!-- end #map location -->

										<logic:notEqual name="annotationDetails" property="target" value="null">

											<logic:notEqual name="annotationDetails" property="target"
												value="">
												<br>
												<b>This LocTag is linked to a webpage or to another LocTag</b>
												<br>Find this place while running the LocTag mobile app to trigger the link<br>

												<logic:notEqual name="annotationDetails" property="eDate" value="null">

													<br>
													<b>The link is valid until </b>
													<bean:write name="annotationDetails" property="eDate" />
													<br>

												</logic:notEqual>
											</logic:notEqual>

										</logic:notEqual>
										<br>



										<logic:present scope="session" name="userID">
											<logic:notEqual name="annotationDetails" property="bookmarked" value="true">
												<br>
												<br>
												<a class="links"
													href="bookmark.do?add=yes&id=<bean:write name="annotationDetails" property="annotationID"/>">
													<b>Add to your bookmarks</b> </a>
												<br>
												<br>
											</logic:notEqual>
										</logic:present>


									</div>
								</div>
								<!-- end #annotation details -->


								<br>


								<!-- #comments -->

								<div class="post">

									<h2 class="title">
										<a href="#">Comments</a>
									</h2>

									<div class="entry">
										<logic:equal name="commentsArrayList" value="[]">
											<p class="info">No comments yet</p>
										</logic:equal>

										<!-- Parse comments (arraylist in request object) -->
										<logic:notEqual name="commentsArrayList" value="[]">
											<logic:iterate name="commentsArrayList" id="commentDetails">
												<a
													href="viewuser.do?user=<bean:write name="commentDetails" property="userID"/>">
													<img width=50 height=50
													src="<bean:write name="commentDetails" property="userPic"/>" />
												</a>

												<a
													href="viewuser.do?user=<bean:write name="commentDetails" property="userID"/>">
													<bean:write name="commentDetails" property="displayName" />
												</a>
												<br>
												on:
													<bean:write name="commentDetails" property="time" /> GMT<br>

												<em><b><bean:write name="commentDetails" property="comment" />
												</b>
												</em>
												<br>
												<br>
											</logic:iterate>
										</logic:notEqual>

										<logic:present scope="session" name="userID">

											<form name="commentform"
												action="postcomment.do?annotationid=<c:out value="${param.id}"/>"
												method="POST">
												<br>
												<TEXTAREA NAME="comment" COLS=40 ROWS=6></TEXTAREA>
												<br /> <input type="submit" value="Submit" />
											</form>

										</logic:present>

									</div>
								</div>
								<!-- end #comments -->

							</logic:iterate>
						</logic:present>



					</div>
					<!-- end #content -->
					

					<logic:present name="annotationDetails">
						<!-- #sidebar -->
						<div id="sidebar">
							<ul>
								<li>
									<h2>Created by</h2> 
									<a href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
										<img width=50 height=50 src="<bean:write name="annotationDetails" property="userPic"/>" />
									</a> 
									<a href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
										<b><bean:write name="annotationDetails" property="owner" />
									</b> 
									</a> <br> on <bean:write name="annotationDetails"
										property="date" /> GMT
										<br> 
										in category: <a href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
										<bean:write name="annotationDetails" property="category" /> 
									</a>

									<br>
									quick URL: 
									<a target="_blank" href="http://www.loctag.mobi/<bean:write name="annotationDetails" property="annotationID" />">
									<b>loctag.mobi/<bean:write name="annotationDetails" property="annotationID" /></b> 
									</a>
								<br>
								<br>
								<br>

									<h2>Collected by</h2> <logic:equal name="collectedByArrayList" value="[]">
										<p class="meta">No users have collected this yet...</p>
									</logic:equal> <logic:notEqual name="collectedByArrayList" value="[]">
										<p class="meta">Showing up to the most recent 5:</p>
										<br>
										<logic:iterate name="collectedByArrayList"
											id="listUserDetails">
											<a
												href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>"><img
												width=50 height=50
												src="<bean:write name="listUserDetails" property="picURL"/>" />
											</a>
											<b> <a
												href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
													<bean:write name="listUserDetails" property="name" /> </a> </b>

											<br>
										on:
										<bean:write name="listUserDetails" property="time" /> GMT
										
										<br>
											<br>
											<br>

										</logic:iterate>
									</logic:notEqual> <br>
								<br>


									<h2>Bookmarked by</h2> <logic:equal name="bookmarkedByArrayList" value="[]">
										<p class="meta">No users have bookmarked this yet...</p>
									</logic:equal> <logic:notEqual name="bookmarkedByArrayList" value="[]">
										<p class="meta">Showing up to the most recent 5:</p>
										<br>

										<logic:iterate name="bookmarkedByArrayList" id="listUserDetails">

											<a
												href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
												<img width=50 height=50
												src="<bean:write name="listUserDetails" property="picURL"/>" />
											</a>
											<b> 
											<a
												href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
													<bean:write name="listUserDetails" property="name" /> 
											</a>
											</b>
											<br>
											<br>
											<br>
											<br>

										</logic:iterate>
									</logic:notEqual> 
									
									<br>
								
									<br> 
									
									<logic:notPresent scope="session" name="userID">
										<h2>Login</h2>

										<p class="meta">Log in with your Facebook account to set
											up an account on LocTag. You will then be able to create new
											LocTags, post comments, add bookmarks, and more!</p>

										<br>
										<a href=<fmt:message key="facebook.oauth"/>><img
											border="0" align="middle" src="img/login-button.png" img
											border="0" /> </a>
										<br>
									</logic:notPresent>
								</li>
							</ul>
						</div>
						<!-- end #sidebar -->
					</logic:present>

				</div>
				<!-- end #page -->


				<jsp:include page="_footer.html" />


				<!-- Include jQuery library -->
				<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.js"></script>

				<!-- Script to upload a pic to the WS via ajax -->
				<script type="text/javascript" src="scripts/ajaxupload.3.5.js"></script>

				<script type="text/javascript">
					$(function() {
						var btnUpload = $('#upload');
						var status = $('#photostatus');
						new AjaxUpload(
								btnUpload,
								{
									action : '/LocTagWS/photos/fileupload',
									name : 'uploadfile',
									onSubmit : function(file, ext) {
										if (!(ext && /^(jpg|png|jpeg|gif)$/.test(ext))) {
											// extension is not allowed 
											status.text('Only JPG, PNG or GIF files are allowed');
											return false;
										}
										status.text('Uploading...');
									},
									onComplete : function(file, response) {
										//On completion clear the status
										status.text('');
										var theResponse = response.replace(/(<([^>]+)>)/ig, "");
										//Add uploaded file to list
										if (theResponse === "fail") {
											$('<li></li>').appendTo(
													'#photostatus').text(file)
													.addClass('error');
										} else {
											btnUpload.remove();
											$('<p></p>')
													.appendTo('#photostatus')
													.html(
															'New picture uploaded. <a href=\"javascript: submitPic()\"><b>Click here to confirm and submit</b></a>');
											picturestatus.innerHTML = "";
											$('<p align="center"></p>')
													.appendTo('#thePicture')
													.html(
															'<img border="0" src="./uploads/medium_'+theResponse+'" />');
											$('#pictureFileName').attr("value",
													theResponse);
											$('#existingPic').remove();
										}

									}
								});

					});
				</script>

				<!-- Submit the form with the picture filename -->
				
				<script type="text/javascript">
					function submitPic() {
						document.forms[0].submit();
					}
				</script>