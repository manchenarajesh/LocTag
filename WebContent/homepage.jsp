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
	<div id="header">
		<!-- #logo -->

		<div id="logo">
			<h1><a href="homepage.do"><img src="img/loctaglogo.png"></a></h1>
		</div>
		<!-- end #logo -->
		<div id="menu">
			<jsp:include page="_menu.html" />

		</div>
	</div>
	<!-- end #header -->

	<div id="wrapper">
		<div id="wrapper-bgtop">
			<div id="wrapper-bgbtm">
				<div id="page">

					<!-- #content -->
					<div id="content">
					
					
						<!-- #intro -->
					
						<div class="post">
							<h2 class="title">
								<a href="#">Welcome to LocTag </a>
							</h2>
							<div class="entry">
								LocTag is a service with a mission to tag the physical world
								with virtual annotations. You can <a href="create.do">create</a> your own
								annotations on this website or via the mobile app. You can
								also browse or <a href="search.do">search</a> through your friends' LocTags and bookmark them to later get
								directions to reach these places.<br><br> LocTags may have interesting links to the web or to other LocTags. Go to the tagged locations with your mobile device to collect the LocTags and trigger these links!<br>
								<br><br> 
								
								<a href="http://dl.dropbox.com/u/1920045/LocTagAndroid10.apk" class="links">Download the Android app</a>
							</div>
						</div>
						
						<!-- end #intro -->
												
						<br><br>


						<!-- #created -->

						<div class="post">

							<h2 class="title">
								<a href="#">LocTags you created</a>
							</h2>
							
							<div class="entry">
							
								<logic:equal name="createdArrayList" value="[]">
									<p>You haven't created any annotations yet...</p>
								</logic:equal>
								
								<!-- Parse annotations you created -->
								<logic:notEqual name="createdArrayList" value="[]">
									<p class="meta">Showing up to the most recent 5...</p>
									
									<logic:iterate name="createdArrayList" id="annotationDetails">

										<logic:notEqual name="annotationDetails" property="photo" value="">

										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><img
											width=100 
											src="./uploads/thumb_<bean:write name="annotationDetails" property="photo"/>" />
										</a>
										
										</logic:notEqual>
										
										<logic:equal name="annotationDetails" property="photo" value="">

										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><img
											width=100 
											src="./img/loctagdefaultpic.jpg" />
										</a>
										
										</logic:equal>
										
										
										
										<b>
										
										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><bean:write
													name="annotationDetails" property="title" /> 
										</a>
										
										</b>

										<br>
										
										in category: 
										<a
											href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
											<bean:write name="annotationDetails" property="category" /></b>
										</a>
										
										<br>
										
										<p class="meta">Created on: 
										<bean:write name="annotationDetails" property="date" /> GMT</p>
										
										<br><br><br><br>

									</logic:iterate>
								</logic:notEqual>
								
							</div>
						</div>
						<!-- end #created -->
						


						<!-- #collected -->

						<div class="post">

							<h2 class="title">
								<a href="#">LocTags you collected</a>
							</h2>
							
							<div class="entry">
								<logic:equal name="collectedArrayList" value="[]">
									<p>You haven't collected any annotations yet...</p>
								</logic:equal>

								<!-- Parse annotations you collected -->
								
								<logic:notEqual name="collectedArrayList" value="[]">
									<p class="meta">Showing up to the most recent 5...</p>
									
									<logic:iterate name="collectedArrayList" id="annotationDetails">
										<logic:notEqual name="annotationDetails" property="photo" value="">

										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><img
											width=100 
											src="./uploads/thumb_<bean:write name="annotationDetails" property="photo"/>" />
										</a>
										
										</logic:notEqual>
										
										<logic:equal name="annotationDetails" property="photo" value="">

										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><img
											width=100 
											src="./img/loctagdefaultpic.jpg" />
										</a>
										</logic:equal>
										
										
										
										<b>
										
								
										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>">
											<bean:write name="annotationDetails" property="title" /> 
										</a>
										</b>
										<br>
										 
										in category: 
										<a
											href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
											<bean:write name="annotationDetails" property="category" />
										</a>
										<br> 
										by: 
										<a
											href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
											<bean:write name="annotationDetails" property="owner" />
										</a>
										
										
										
										<br><p class="meta">Collected on: 
										<bean:write name="annotationDetails" property="date" /> GMT</p>
										
										<br><br><br><br>

									</logic:iterate>
								</logic:notEqual>

							</div>
						</div>
						<!-- end #collected -->



						<!-- #bookmarks -->

						<div class="post">
						

							<h2 class="title">
								<a href="#">Your bookmarks</a>
							</h2>
							<div class="entry">
							

								
						<logic:equal name="bookmarksArrayList" value="[]">
									<p>You don't have any bookmarks at present...</p>
						</logic:equal>

								<!-- Parse annotations you bookmarked -->
								<logic:notEqual name="bookmarksArrayList" value="[]">
									
								
									<p class="meta">Showing up to the most recent 5...</p>
									
									<logic:iterate name="bookmarksArrayList" id="annotationDetails">

										<logic:notEqual name="annotationDetails" property="photo" value="">

										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><img
											width=100 
											src="./uploads/thumb_<bean:write name="annotationDetails" property="photo"/>" />
										</a>
										
										</logic:notEqual>
										
										<logic:equal name="annotationDetails" property="photo" value="">

										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>"><img
											width=100 
											src="./img/loctagdefaultpic.jpg" />
										</a>
										</logic:equal>
										
										
										<b>
										<a
											href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>">
											<bean:write name="annotationDetails" property="title" /> 
										</a> 
										</b>
										
										<br> 
										
										in category: 
										<a
											href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
											<bean:write name="annotationDetails" property="category" />
										</a>
										
										<br> 
										
										by: 
										<a
											href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
											<bean:write name="annotationDetails" property="owner" />
										</a>

										
										<p class="meta">
										<a
											href="bookmark.do?remove=yes&id=<bean:write name="annotationDetails" property="annotationID"/>">
											[Remove bookmark] 
										</a>
										</p>
										<br><br><br>

									</logic:iterate>
								</logic:notEqual>

							</div>
						</div>
						<!-- end #bookmarks -->
						


					</div>
					<!-- end #content -->
					
					
					<!-- #sidebar -->
					
					<div id="sidebar">
						<ul>
							<li>
							
								<h2>My Profile</h2> <!-- Profile summary is retrieved from the session -->
								
								<a
									href="viewuser.do?user=<c:out value="${sessionScope.userID}"/>">
									<img width=50 height=50 src="<c:out value="${sessionScope.picURL}"/>" /> 
								</a> 
								<b>
								<c:out value="${sessionScope.name}" />
								</b> 
								<em><c:out value="${sessionScope.country}" /></em>
								<br>
								<c:out value="${sessionScope.email}" /> 
								<br>
								<a href="settings.do">[Edit profile settings]</a>
								<br><br><br><br>



								<h2>Users I'm following</h2> 
								
								<logic:equal name="followingArrayList" value="[]">

											<p class="info">You aren't following any users at present...</p>
								</logic:equal> 
								
								<logic:notEqual name="followingArrayList" value="[]">
									<logic:iterate name="followingArrayList" id="listUserDetails">

										<a
											href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
											<img width=50 height=50 src="<bean:write name="listUserDetails" property="picURL"/>" />
										</a>
										
										<b><bean:write name="listUserDetails" property="name" /></b>
										<em><bean:write name="listUserDetails" property="country" /></em>

										<br>
										<a
											href="follow.do?remove=yes&id=<bean:write name="listUserDetails" property="userID"/>">
											[Stop following this user]
										</a>
										
										<br><br><br><br>

									</logic:iterate>
								</logic:notEqual> 
								
								<br>


								<h2>Users following me</h2> 
								
								<logic:equal name="followedbyArrayList" value="[]">

									<p class="info">No users are following you...</p>
								</logic:equal> 
								
								<logic:notEqual name="followedbyArrayList" value="[]">
									<logic:iterate name="followedbyArrayList" id="listUserDetails">

										<a
											href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
											<img width=50 height=50 src="<bean:write name="listUserDetails" property="picURL"/>" />
										</a>
										
										<b><bean:write name="listUserDetails" property="name" /></b>
										
										<em><bean:write name="listUserDetails" property="country" /></em>
										
										<br>
										<a target="_new" href="<bean:write name="listUserDetails" property="link"/>">
										[Go to Facebook page]
										</a>
										
										<br><br><br><br>


									</logic:iterate>
								</logic:notEqual></li>

						</ul>
					</div>
					<!-- end #sidebar -->
					
				</div>
				<!-- end #page -->

				<jsp:include page="_footer.html" />