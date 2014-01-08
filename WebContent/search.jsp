<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%-- Tag libs --%>
<%@ taglib prefix="fmt" uri="/WEB-INF/lib/fmt.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/lib/c.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/lib/struts-logic.tld"%>
<%@ taglib uri="/WEB-INF/lib/struts-html-el.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>


<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>

<jsp:include page="_header.html" />
	
</head>

<c:choose>		
<c:when test="${!empty param.autoLat}">
		<body onload="load()" >
</c:when>
<c:otherwise>
 		<body>
</c:otherwise>
</c:choose>

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
				<div id="contentbig">
										
					
					<div class="post">
						
						<h2 class="title"><a href="#">Search Users</a></h2>
						<div class="entry">
							
											
						Search for a user by username or country:
						<form name="searchuser" id="searchuser" action="search.do" method='get' onSubmit="checkUserName();">
						<input name="user" id="userkeyword" type="text" size="20" /><input type="submit" value="Search"/>
				
						</form>
						
						
						</div>
					</div>
					
					
					
					
					<div class="post">
						<br>
						<h2 class="title"><a href="#">Search LocTags</a></h2>
						<div class="entry">
							
							By category:
				
							<form name="searchcategories" id="searchcategories" action="search.do" method='get'>
				
								<logic:notPresent name="categoriesArrayList">
									<p class="info">No categories to choose from...</p>
								</logic:notPresent>
								
								<!-- Parse category titles and populate dropdown box -->
								<logic:present name="categoriesArrayList">
								<select id="category" name="category">
								<logic:iterate name="categoriesArrayList" id="categoryDetails">
									<option 
									value="<bean:write name="categoryDetails" property="category" />">
									<bean:write name="categoryDetails" property="category" />
									</option>				
								</logic:iterate>
								</select>
								
								</logic:present>
								
								<input type="submit" value="Search"/>
							</form>
							
						<br>
						Matching this keyword or location or ID:
				
							<form name="searchkeywords" id="searchkeywords" action="search.do" method='get' onSubmit="checkKeywords();">
				
								<input name="keyword" id="keywords" type="text" size="20" /><input type="submit" value="Search"/>
				
							</form>
				
				
				<br>
							<c:choose>
				
				   				 <c:when test="${empty param.autoLat}">
									<br>
				
									<a href="#" class="links" id="submitButton" onClick="searchNearby();">Search Nearby</a>
									<br>
								</c:when>
							</c:choose>
				
							<form name="searchAutoLocation" id="searchAutoLocation" >
							<input type="hidden" name="autoLat" id="autoLat" />
							<input type="hidden" name="autoLon" id="autoLon" />
							
							<br>
							<font color="#D15600"><span id="autoAddressStatus" ></span></font>
							
							</form>
						
						</div>
					</div>

			

			<div class="post">
						<br>
						<h2 class="title"><a href="#">Search Results</a></h2>
						<div class="entry">
				
				
				<c:choose>
				
				    <c:when test="${!empty param.autoLat}">
					
					Your location was detected as shown on the map below. Distances to locations are calculated from that point. Please note that this is only an estimate! You may reposition the marker and search again...<br><br>
				    <div align="center" id="map" style="width: 790px; height: 250px">
        			</div>
        			<br><br>
        			<a href="#" class="links" id="submitButton" onClick="submit();">Search Again</a><br>
					<br>
					</c:when>
				
				</c:choose>
				
				<!-- Parse annotation search results -->
				
				<logic:equal name="annotationsArrayList" value="[]">
					<font color="#D15600"><p id="searchresults">No search results...</p></font>
				</logic:equal>
				
				<logic:present name="annotationsArrayList">
				
				<logic:notEqual name="annotationsArrayList" value="[]">
				
				<p class="meta">Showing up to the most recent 5:</p>
					
				<logic:iterate name="annotationsArrayList" id="annotationDetails">
				
				
					
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
							href="annotation.do?id=<bean:write name="annotationDetails" property="annotationID"/>">
							<bean:write name="annotationDetails" property="title" />
						</a>
						<br>
						</b> 
						Created on:
						<bean:write name="annotationDetails" property="date" /> GMT
						<br> 
						in category: 
						<a href="search.do?category=<bean:write name="annotationDetails" property="category"/>">
								<bean:write name="annotationDetails" property="category"/>
						</a>
						<br> 
						by: 
						<a href="viewuser.do?user=<bean:write name="annotationDetails" property="userID"/>">
							<b><bean:write name="annotationDetails" property="owner"/></b>
						</a>
						
						<logic:notEqual name="annotationDetails" property="distance" value="0.0">
							<br> Distance: <bean:write name="annotationDetails" property="distance"/>m				
						</logic:notEqual>
						
					
					<br><br><br><br><br>
				</logic:iterate>
				</logic:notEqual>
				</logic:present>
				

					
				<!-- Parse user search results -->
				<logic:present name="usersArrayList">	
				<logic:equal name="usersArrayList" value="[]">
					<font color="#D15600"><p id="searchresults">No search results...</p></font>
				</logic:equal>
				
				<logic:notEqual name="usersArrayList" value="[]">
				
				<p class="meta">Showing up to the most recent 5:</p>
				
				<logic:iterate name="usersArrayList" id="listUserDetails">
					
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
						<em><bean:write name="listUserDetails" property="country"/></em>
						<br>
						Joined on:
						<bean:write name="listUserDetails" property="time" /> GMT
						<br>
						<a href="<bean:write name="listUserDetails" property="link"/>">
						[Go to Facebook page]
						</a>
						
						<br><br><br>
					
				</logic:iterate>
				</logic:notEqual>
				</logic:present>
				
				
			
					<logic:equal name="annotationsArrayList" value="[]">
					<logic:equal name="usersArrayList" value="[]">
					<br><font color="#D15600"><p id="searchresults">No search results...</p></font>
					</logic:equal>
					</logic:equal>
					
					
				
						
						</div>
					</div>
					
					
				</div>
				<!-- end #content -->
				
			</div>
			<!-- end #page -->

<jsp:include page="_footer.html" />
			
					
<!-- Script for AJAX reverse geocoding -->
<script src="scripts/greversegeocoder.js" type="text/javascript"></script>

<!-- Script to search close to the user, if the HTML5 location can be obtained -->

<script type="text/javascript"> 

theAutoLat=<c:out value="${param.autoLat}" />
theAutoLon=<c:out value="${param.autoLon}" />

function load() {
    if (GBrowserIsCompatible()) {
      var map = new GMap2(document.getElementById("map"));
      map.addControl(new GSmallMapControl());
      map.addControl(new GMapTypeControl());
      var center = new GLatLng(theAutoLat, theAutoLon);
      map.setCenter(center, 14);
      geocoder = new GClientGeocoder();
      var marker = new GMarker(center, {draggable: true});  
      map.addOverlay(marker);
     
      document.getElementById("autoLat").value = center.lat().toFixed(5);
      document.getElementById("autoLon").value = center.lng().toFixed(5);
      
		 GEvent.addListener(marker, "dragend", function() {
		 		document.getElementById("autoLat").value="";
		 		document.getElementById("autoLon").value="";
				var point = marker.getPoint();
	     		map.panTo(point);
			
	     		document.getElementById("autoLat").value = point.lat().toFixed(5);
	     		document.getElementById("autoLon").value = point.lng().toFixed(5);
	     		
		 });

	 	 GEvent.addListener(map, "moveend", function() {
			  	map.clearOverlays();
	    		var center = map.getCenter();
			  	var marker = new GMarker(center, {draggable: true});
			  	map.addOverlay(marker);
			  	
			  	document.getElementById("autoLat").value = center.lat().toFixed(5);
			    document.getElementById("autoLon").value = center.lng().toFixed(5);
			    
			    
				 GEvent.addListener(marker, "dragend", function() {
				 		document.getElementById("autoLat").value="";
				 		document.getElementById("autoLon").value="";
		  				var point = marker.getPoint();
			     		map.panTo(point);
		   			
			     		document.getElementById("autoLat").value = point.lat().toFixed(5);
			     		document.getElementById("autoLon").value = point.lng().toFixed(5);
			     		
				 });
		    
	    	   
	      });
	 	 

	     		







	  
 

    }
   
    
  }
  </script>
  
<script type="text/javascript"> 
  
//validate keywords
function checkKeywords(){
		var keyword = document.getElementById("keywords").value;
		keyword = keyword.replace(/[^a-zA-Z 0-9]+/g,'');  
		keyword = keyword.trim();
		document.getElementById("keywords").value=keyword;
	
	   return true;
}

//validate username
function checkUserName(){
	var user = document.getElementById("userkeyword").value;
	user = user.replace(/[^a-zA-Z 0-9]+/g,'');  
	user=user.trim();
	document.getElementById("userkeyword").value=user;

   return true;

}


function searchNearby(){
	getLocation();setTimeout('showLocation()', 500);setTimeout('submit()', 3000);
	
}

function showLocation(){
	document.getElementById("autoAddressStatus").innerHTML='Searching around your current location. Please wait... <br>';
	document.getElementById("searchresults").innerHTML='';	
}

function submit(){
	
		if (document.getElementById("autoLat").value==""||document.getElementById("autoLon").value==""){
			document.getElementById("autoAddressStatus").innerHTML="Cannot determine your current position. Please check your browser settings.";	
		}
		else{
		document.forms["searchAutoLocation"].submit();
		}
	
}

function getLocation() {
  if (navigator.geolocation) {
    	  navigator.geolocation.getCurrentPosition(success, error);

  } else {
    	  error('not supported');
    	}

}	

function success(position) {

   		var reversegeocoder = new GReverseGeocoder();
   		
   	    GEvent.addListener(reversegeocoder, "load",
   	            function(placemark) {
   	    	
   	    	document.getElementById("autoAddress").value=placemark.address.toString();  	
   	            }
   	          );

   	    
		var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude); 
   		var lat=latlng.lat().toFixed(5);
   		var lon=latlng.lng().toFixed(5);
   		document.getElementById("autoLat").value=lat;
   		document.getElementById("autoLon").value=lon;
		

   	    reversegeocoder.reverseGeocode(latlng);
 	    	      		
}

function error(msg) {
	  	alert("Cannot determine current position");
	
	}
	

</script>

</html>
