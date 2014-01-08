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
<!-- end #header-wrapper -->
<div id="wrapper">
	<div id="wrapper-bgtop">
		<div id="wrapper-bgbtm">
			<div id="page">
				<div id="contentbig">
										
					
					
					<div class="post">
						
						<h2 class="title"><a href="#">Settings and preferences</a></h2>
						<div class="entry">
							
											
				<logic:present name="userInfo">
				<logic:iterate name="userInfo" id="userDetails">
				
				<c:choose>
				
				    <c:when test="${!empty param.updated}">
				    <p><b><font color="#3b5998">Your settings have been updated successfully!</font></b></p>
				    </c:when>
				    
				</c:choose>			
				    

				<form name="settings.do" id="settings" action="settings.do" method="POST" onSubmit="return validate();">
				<p><b><font color="#3b5998">Edit your profile details...</font></b></p>
				<b>Display name:</b><br><input name="displayname" id="displayname" type="text" size="30" value="<bean:write name="userDetails" property="name"/>" />
				<font color="red"><span id="namestatus"></span> </font>
				<br><br>
				<b>Email:</b><br><input name="email" id="email" type="text" size="30" value="<bean:write name="userDetails" property="email"/>" />
				<font color="red"><span id="emailstatus"></span> </font>
				<br><br>
				<b>Country:</b><br><input name="country" id="country" type="text" size="30" value="<bean:write name="userDetails" property="country"/>" />
				<br><br>
				<b>About me:</b><br><textarea name="about" id="about" rows="6" cols="40"><bean:write name="userDetails" property="about"/></textarea>
				<br><br>
				
				<p><b><font color="#3b5998">Edit your preferences...</font></b></p>
				
				Automatically add my new LocTags to my Facebook wall: <input type="checkbox"
 				<logic:equal name="userDetails" property="pref_fbwall" value="Y" > checked </logic:equal>
 				name="fbwall" value="Y" />
				<br /><br />
				
				Log and use my location details: <input type="checkbox" 
 				<logic:equal name="userDetails" property="pref_log" value="Y" > checked </logic:equal>
 				name="log" value="Y" />
				<br /><br />


				Email me when someone posts a comment to one of my LocTags: <input type="checkbox" 
 				<logic:equal name="userDetails" property="pref_emailcom" value="Y" > checked </logic:equal>
 				name="emailcom" value="Y" />
				<br /><br />

				Email me whenever someone collects my LocTags: <input type="checkbox" 
 				<logic:equal name="userDetails" property="pref_emailtrigger" value="Y" > checked </logic:equal>
 				name="emailtrigger" value="Y" />
				<br /><br />
				
				

				
				<br>
				<input type="submit" value="Submit"/><br><br>
				<a href="homepage.do">Cancel changes</a>
				
				</form>
			</div>
			
			</logic:iterate>
			</logic:present>
							
						
						</div>
					</div>


					
					
				</div>
				<!-- end #content -->
				
			</div>
			<!-- end #page -->
			
			<jsp:include page="_footer.html" />




<script type="text/javascript"> 


function validate(){
	var user = document.getElementById("displayname").value;
	user = user.replace(/[^a-zA-Z 0-9 \. \- \_]+/g,''); 
	user=user.trim();
	document.getElementById("displayname").value=user;
	if (user=="") {
		document.getElementById("namestatus").innerHTML = "Username cannot be left blank";
		return false;
	}
	
	var email = document.getElementById("email").value;
	var emailRE = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
	email = email.replace(/[^a-zA-Z 0-9 @ \. \-]+/g,'');  
	email=email.trim();
	document.getElementById("email").value=email;
	if (email=="") {
		document.getElementById("emailstatus").innerHTML = "Email cannot be left blank";
		return false;
	}
	var lastAtPos = email.lastIndexOf('@');
    var lastDotPos = email.lastIndexOf('.');
	if (!email.match(emailRE)){
		document.getElementById("emailstatus").innerHTML = "Invalid email address";
		return false;
	}
	
	var country = document.getElementById("country").value;
	country = country.replace(/[^a-zA-Z 0-9]+/g,'');  
	country=country.trim();
	document.getElementById("country").value=country;
	
	var about = document.getElementById("about").value;
	about = about.replace(/[^a-zA-Z 0-9]+/g,'');  
	about=about.trim();
	document.getElementById("about").value=about;
	
   return true;

}

</script>      

</html>
