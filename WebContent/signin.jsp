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

<div id="header">
	<div id="logo">
		<h1><a href="homepage.do"><img src="img/loctaglogo.png"></a></h1>
	</div>
	<hr />
	<!-- end #logo -->
	
</div>

<br><br>
<!-- end #header -->
<!-- end #header-wrapper -->
<div id="wrapper">
	<div id="wrapper-bgtop">
		<div id="wrapper-bgbtm">
			<div id="page">
				<div id="contentbig">
														
					<div class="post">
						
						
						<div class="entry">
							
											
				
					
					Log in with your Facebook account and you will automatically become a registered user of LocTag. 
					<br><br>			
					<a href=<fmt:message key="facebook.oauth"/>><img align="middle" border="0" src="img/login-button.png"/></a>
					
							
						
						</div>
					</div>


					
					
				</div>
				<!-- end #content -->
				
			</div>
			<!-- end #page -->
			<div style="clear: both;">&nbsp;</div>
		</div>
	</div>
</div>

<!-- end #footer -->
</body>




</html>
