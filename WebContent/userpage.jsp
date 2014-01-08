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
					<div class="post">
					
					<logic:notPresent name="userInfo">
						<h2 class="title"><a href="#">User doesn't exist !</a></h2>
					</logic:notPresent>
					
					<logic:present name="userInfo">
					<logic:iterate name="userInfo" id="userDetails">
						<h2 class="title">
							<a href="#"><bean:write name="userDetails" property="name" /></a>
						</h2>
					
			
					
					</logic:iterate>
					</logic:present>
				
						
						<div class="entry">
								<logic:equal name="userDetails" property="followed" value="true" >
         				<H3>You are following this user</H3><br>
        			</logic:equal>
							<a href="#"><img src="<bean:write
								name="userDetails" property="picURL" />" /></a>
								<b>
		
								<bean:write name="userDetails" property="name" />
								
								</b>
												
								<em><bean:write name="userDetails" property="country" /></em>
								<br>  
								Joined on: <bean:write name="userDetails" property="time" />
								<br>
								<a target="_new" href="<bean:write name="userDetails" property="link" />" >
								[Go to Facebook page]
								</a>
				
				
						<br>
						
						<logic:notEqual name="userDetails" property="about" value="" >
						<br>
						<bean:write name="userDetails" property="about" />
						<br>
						</logic:notEqual>
												
						
						
        			<logic:notEqual name="userDetails" property="followed" value="true" >
         				<br><br>
         				<a href="follow.do?add=yes&id=<bean:write name="userDetails" property="userID"/>" class="links">
         				Follow this user...
         				</a>
        		 	</logic:notEqual>
        		 	
						
						</div>
						
					</div>
					<br>
						
					
					
					
					<div class="post">
						
						<h2 class="title">
						<a href="#">Created LocTags</a>
						</h2>
						
						<div class="entry">
						<logic:equal name="createdArrayList" value="[]">
								This user hasn't created any LocTags yet...
						</logic:equal>
						
						
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
							href="annotation.loc?id=<bean:write name="annotationDetails" property="annotationID"/>">
							<bean:write name="annotationDetails" property="title" />
						</a>
						
						</b>
						
						<br>
						
						in category: 
						<a href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
						<bean:write name="annotationDetails" property="category"/>
						</a>
						
						<p class="meta">
						
						Created on: 
						<bean:write name="annotationDetails" property="date" /> GMT</p>
					
						<br><br><br><br>
					
					
				</logic:iterate>
				</logic:notEqual>
						</div>
					</div>
					
					
					
					
					<div class="post">
						
						<h2 class="title"><a href="#">Collected LocTags</a></h2>
						<div class="entry">
							<logic:equal name="collectedArrayList" value="[]">
								This user hasn't collected any LocTags yet... <br><br>
							</logic:equal>
						
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
						<a href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
						<bean:write name="annotationDetails" property="category"/>
						</a>
						<br> 
						by: 
						<a href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
						<bean:write name="annotationDetails" property="owner"/>
						</a>
						
						<p class="meta">Collected on: 
						<bean:write name="annotationDetails" property="date" /> GMT</p>
						<br><br><br>
					
				</logic:iterate>
				</logic:notEqual>
						
						</div>
					</div>

				

				<div class="post">
						
						<h2 class="title">
							<a href="#">Bookmarks</a>
						</h2>
						
						<div class="entry">
						<logic:equal name="bookmarksArrayList" value="[]">
							This user doesn't have any bookmarks at present...
						</logic:equal>
						
						<!-- Parse annotations you bookmarked (arraylist in request object) -->
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
						<a href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
						<bean:write name="annotationDetails" property="category"/>
						</a>
						
						<br> 
						
						by: 
						<a href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
						<bean:write name="annotationDetails" property="owner"/>
						</a>
						
						<br><br><br><br><br><br>
					
				</logic:iterate>
				</logic:notEqual>
						
						</div>
					</div>
					
					
				</div>
				<!-- end #content -->
				
				
				<div id="sidebar">
					<ul>
						<li>
							
		
								<h2>Users I'm following </h2>
							
								<logic:equal name="followingArrayList" value="[]">
									<p class="info">Not following any users at present...</p>
								<br><br>
								</logic:equal>
				
				
						<logic:notEqual name="followingArrayList" value="[]">
				
							<logic:iterate name="followingArrayList" id="listUserDetails">
					
						<a
							href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
							<img width=50 height=50 src="<bean:write name="listUserDetails" property="picURL"/>" />
						</a> 
						<b>
						<bean:write name="listUserDetails" property="name" /></b>
						<em><bean:write name="listUserDetails" property="country"/></em>
						<br>
						<a target="_new" href="<bean:write name="listUserDetails" property="link"/>">
						[Go to Facebook page]
						</a>
						
						<br><br><br><br>
					
				</logic:iterate>
				</logic:notEqual>
				
				
				<br><br>
							
						
						<h2>Users following me </h2>
							
								<logic:equal name="followedbyArrayList" value="[]">
									<p class="info">No users are following me at present...</p>
								</logic:equal>

								<logic:notEqual name="followedbyArrayList" value="[]">
								<logic:iterate name="followedbyArrayList" id="listUserDetails">
					
								<a
								href="viewuser.do?user=<bean:write name="listUserDetails" property="userID"/>">
								<img width=50 height=50 src="<bean:write name="listUserDetails" property="picURL"/>" />
								</a> 
								
								<b>
								<bean:write name="listUserDetails" property="name" />
								</b> 
						
								<em><bean:write name="listUserDetails" property="country"/></em>
								<br>
								<a target="_new" href="<bean:write name="listUserDetails" property="link"/>">
								[Go to Facebook page]
								</a>
								
								<br><br><br><br>
				</logic:iterate>
				</logic:notEqual>
							
							
						</li>
						
					</ul>
				</div>
				<!-- end #sidebar -->
			</div>
			
			<!-- end #page -->
			<jsp:include page="_footer.html" />

</html>