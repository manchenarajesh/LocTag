<%-- JSTL and Struts tag libs --%>
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
		<div id="menu">
			<jsp:include page="_menu.html" />

		</div>
		<!-- end #menu -->

	</div>
	<!-- end #header -->


	<div id="wrapper">
		<div id="wrapper-bgtop">
			<div id="wrapper-bgbtm">
				<div id="page">

					<!-- #content -->
					<div id="content">


					<!-- #registered users -->

						<div class="post">

							<h2 class="title">
								<a href="#">Recently registered users</a>
							</h2>
							
							<div class="entry">


								<logic:notPresent name="recentUsersArrayList">
									No users yet...
								</logic:notPresent>

								<!-- Parse users that joined recently -->
								<logic:present name="recentUsersArrayList">
									<p class="meta">Showing up to the most recent 5:</p>
									
									<logic:iterate name="recentUsersArrayList" id="listUserDetails">

										<a
											href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
											<img width=50 height=50 src="<bean:write name="listUserDetails" property="picURL"/>" />
										</a>
										
										<b>
										
										<a
											href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
											<bean:write name="listUserDetails" property="name" /> 
										</a>
										
										</b>
										
										<em><bean:write name="listUserDetails" property="country" /></em>
										
										<br>
						 				Joined on:
											<bean:write name="listUserDetails" property="time" /> GMT
										<br>
										<a target="_new"
											href="<bean:write name="listUserDetails" property="link"/>">
											[Go to Facebook page]
										</a>
										
										<br><br><br>

									</logic:iterate>
								</logic:present>
								
								<br> You can search for more users in the <a href="search.do">search page</a>

							</div>
						</div>
						<!-- end #registered users -->
						

						<br>
						<br>
						
						<!-- #FB friends on loctag -->

						<div class="post">

							<h2 class="title">
								<a href="#">My Facebook friends on LocTag</a>
							</h2>
							<div class="entry">

								<logic:equal name="fbFriendsArrayList" value="[]">

									None of your Facebook friends are on LocTag

								</logic:equal>

								<logic:notEqual name="fbFriendsArrayList" value="[]">								

									<p class="meta">Showing the most recently registered:</p>
									
										<%
											int count = 0;
										%>
										<logic:iterate name="fbFriendsArrayList" id="listUserDetails">
											<!-- skip a line after every 5 pics -->
											
											<%
												if (count%5==0 && count!=0) {
											%>
											<p>
												<br>
											
												<br>
											</p>
											<%
												}
											%>
											
											<a
												href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
												<img width=50 height=50 src="<bean:write name="listUserDetails" property="picURL"/>"
												title="<bean:write name="listUserDetails" property="name"/> " />
											</a>

										<% count++; %>

										</logic:iterate>
										
										<br><br><br><br><br><br>
									</logic:notEqual>



							</div>
						</div>
						<!-- end #FB friends on loctag -->
						

						<br>


					<!-- #latest loctags -->

						<div class="post">

							<h2 class="title">
								<a href="#">Latest LocTags</a>
							</h2>
							
							<div class="entry">

								<p class="meta">Showing up to the most recent 5:</p>
								<logic:notPresent name="recentAnnotationsArrayList">
									No annotations yet...
								</logic:notPresent>

								<!-- Parse latest loctags -->
								<logic:present name="recentAnnotationsArrayList">
									<logic:iterate name="recentAnnotationsArrayList" id="annotationDetails">

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
										<p class="meta">Created on:
										<bean:write name="annotationDetails" property="date" /> GMT</p>
										

										<br><br><br>
										
									</logic:iterate>
								</logic:present>
								
								<br>
								
								You can search for more annotations in the <a href="search.do">search page</a>

							</div>
						</div>
						<!-- end #latest loctags -->
						

					</div>
					<!-- end #content -->

				</div>
				<!-- end #page -->
				
				<jsp:include page="_footer.html" />
				
