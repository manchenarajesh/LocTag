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

<body onload="load()" onunload="GUnload()">

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
					<div id="contentbig">



						<div class="post">

							<h2 class="title">
								<a href="#">Create a new LocTag</a>
							</h2>
							
							<div class="entry">
								<H3>Here you can tag a physical location with a virtual
									'annotation'. To create a LocTag, provide a title and
									description, choose a category, and upload a photo that
									represents the location you're tagging.
								</H3>

							</div>
						</div>

						<form id="submitannotation" name="annotationform" action="submitAnnotation.do" method='post'>

							<div class="post">

								<h2 class="title">
									<a href="#">1. Choose a title</a>
								</h2>
								<div class="entry">
								
									<p>
										Choose a title for your LocTag
										<br> 
										<input name="title" id="title" type="text" size="50" /> 
										<font color="red"><span id="titlestatus"></span> </font>
									</p>

								</div>
							</div>


							<div class="post">

								<h2 class="title">
									<a href="#">2. Select a category</a>
								</h2>
								<div class="entry">
									<logic:notPresent name="categoriesArrayList">
										<p class="info">No categories to choose from...</p>
									</logic:notPresent>

									<!-- Parse category titles and populate dropdown box -->
									<logic:present name="categoriesArrayList">
										<p>
											Choose a category for your LocTag:<br> 
											<select id="category" name="categoryID">
												<logic:iterate name="categoriesArrayList" id="categoryDetails">
													<option
														value="<bean:write name="categoryDetails" property="categoryID" />">
														<bean:write name="categoryDetails" property="category" />
													</option>
												</logic:iterate>
											</select>
									</logic:present>
									</p>

								</div>
							</div>


							<div class="post">

								<h2 class="title">
									<a href="#">3. Provide a description</a>
								</h2>
								<div class="entry">
									<logic:notPresent name="categoriesArrayList">
										No categories to choose from...
									</logic:notPresent>

									<p>Describe the place and what's so interesting about it:</p>
									<textarea name="description" id="description" cols="50" rows="5"></textarea>
									<font color="red"><span id="descriptionstatus" /></font>
								</div>
							</div>



							<div class="post">
								<br>
								<h2 class="title">
									<a href="#">4. Pick a location</a>
								</h2>
								<div class="entry">

									Place the marker onto the location where you want to create the LocTag. <b>You may search by address or provide the exact coordinates (ex: 35.1942, 14.6587)</b><br><br> 
									<input type="hidden" name="lat" id="lat" type="text" size="10" />
									<input type="hidden" name="lon" id="lng" type="text" size="10" />
									<input type="hidden" name="autoAddress" id="autoAddress" type="text" size="10" />
									
									<p>
										<input type="text" size="40" id="searchAddress" name="searchAddress" value=""
											onkeydown="if (event.keyCode == 13) showAddress(document.getElementById('searchAddress').value);" />
											
										<span id="latstatus"></span>, <span id="lonstatus"></span> : <span id="address"></span>
										<br><font color="red"><span id="addressstatus"></span> </font>


									</p>

									

									<div align="center" id="mapDIV" style="width: 770px; height: 400px">
									<br />
									</div>

								</div>
							</div>


							<br> 
							<br>

							<div class="post">

								<h2 class="title">
									<a href="#">5. Upload a photo</a>
								</h2>
								<div class="entry" id="thePicture">
									<p>
										<b>Optional:</b> Upload a pic that represents the place (You can upload a photo later)
										<input type="hidden" name="picture" id="pictureFileName" type="text" value="" size="10" />
									</p>
									
									<!-- Upload Button-->
									<a href="#" class="links" id="upload">Upload Photo</a> 
									<br><br>
									<font color="red"><span id="picturestatus"></span></font> 
									<font color="#D15600"><span id="photostatus"></span></font>

								</div>
							</div>

							<br> <br>

							<div class="post">

								<h2 class="title">
									<a href="#">6. Provide a link</a>
								</h2>
								
								<div class="entry">
									<b>Optional:</b> Link this LocTag to a web URL or another LocTag to be triggered when users reach this place while running the mobile app.
									You can chain this LocTag to another by linking to its quick URL, ex:<em>www.loctag.mobi/21</em><br><br>
									http://<input name="target" id="target" type="text" size="40" /> 
									
									<font color="red"><span id="targetstatus"></span> </font> 
									
									<br><br>
									<b>Optional:</b> Specify a date until when this link will be valid: 							
									<form>
									<input name="ADate" onclick="displayDatePicker('ADate');"> <input type=button value="Pick date" onclick="displayDatePicker('ADate');">
									</form>
									<br>
									<font color="red"><span id="datestatus"></span> </font> 
									<br> <br> <br> <br>
									
									<a class="linksbig" id="submitButton" onClick="submitAnnotation()">Submit</a> 
									<br> <br> <br> 
									<font color="red"><span id="submitstatus"></span></font>
									
								</div>
							</div>
							
							
							


						</form>

						<br><br>

					</div>
					<!-- end #content -->

				</div>
				<!-- end #page -->


				<jsp:include page="_footer.html" />
				

<!-- Include jQuery library -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.js"></script>

<!-- Script for AJAX reverse geocoding -->
<script src="scripts/greversegeocoder.js" type="text/javascript"></script>

<!-- Script to handle AJAX file upload -->
<script type="text/javascript" src="scripts/ajaxupload.3.5.js"></script>

<!-- Script to pick a date -->
<script type="text/javascript" src="scripts/datepicker.js"></script>

<!-- Script to validate a date -->
<script type="text/javascript" src="scripts/datevalidation.js"></script>

<!-- Script to validate a URL -->
<script type="text/javascript" src="scripts/urlvalidation.js"></script>

<!-- Stylesheet for datepicker -->
<link rel="stylesheet" href="scripts/datepickerstyle.css" type="text/css" media="screen" charset="utf-8" />



<script type="text/javascript">


//Function to call AJAX function when the user is writing the title

$(document).ready(function(){
        
    // When the user finishes typing a character in the text box...
    $('#title').keyup(function(e){
    	document.getElementById("titlestatus").innerHTML="";
    	//if spacebar
    	if (e.which == 32) {
        // Call the function to handle the AJAX.
        // Pass the value of the text box to the function.
        sendTitle($(this).val());   
    	 }
        
    }); 
    
    // When the text box looses focus
    $('#title').blur(function(){
    	 
        // Call the function to handle the AJAX.
        // Pass the value of the text box to the function.
        sendTitle($(this).val());   
    	 
        
    }); 
    
});



//Function to handle ajax call for checking if name already exists
function sendTitle(str){
    
    $.get(
        
    "search.do?ajax=yes&keyword="+str,
    
    //function that is called when server returns a value.
    function(data){
    	var myJSONString = JSON.stringify(data);
    	var obj = jQuery.parseJSON(myJSONString);
    	if (obj!="[]"){
    		document.getElementById("titlestatus").innerHTML="There are LocTags with similar titles. <a target='_new' href=search.do?keyword="+str+">Click here</a> to check...";
    	}
    }, 
    
    //Required format of data returned from server
    "text"
    );
    
}


//Function to handle ajax call for checking if there are records at the chosen position
function sendLocation(lat,lon){
    
    $.get(
        
    "search.do?ajax=yes&autoLat="+lat+"&autoLon="+lon,
    
    //function that is called when server returns a value.
    function(data){
    	var myJSONString = JSON.stringify(data);
    	var obj = jQuery.parseJSON(myJSONString);
    	if (obj!="[]"){
    		document.getElementById("addressstatus").innerHTML="There are LocTags close to this location. <a target='_new' href=search.do?autoLat="+lat+"&autoLon="+lon+">Click here</a> to check...";
    	}
    }, 
    
    //Required format of data returned from server
    "text"
    );
    
}


</script>


<!-- Script to upload a pic to the WS via ajax -->

<script type="text/javascript">
	$(function(){
		var btnUpload=$('#upload');
		var status=$('#photostatus');
		new AjaxUpload(btnUpload, {
			action: '/LocTagWS/photos/fileupload',
			name: 'uploadfile',
			onSubmit: function(file, ext){
				 if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){ 
                    // extension is not allowed 
					status.text('Only JPG, PNG or GIF files are allowed');
					return false;
				}
				status.text('Uploading...');
			},
			onComplete: function(file, response){
				//On completion clear the status
				status.text('');
				var theResponse = response.replace(/(<([^>]+)>)/ig,"");
				//Add uploaded file to list
 				if(theResponse==="fail"){
 					$('<li></li>').appendTo('#photostatus').text(file).addClass('error'); 					
 				} else{
 					btnUpload.remove();
 					$('<p></p>').appendTo('#photostatus').html('Successfully uploaded picture:');
 					picturestatus.innerHTML="";	
 					$('<p align="center"></p>').appendTo('#thePicture').html('<img border="0" src="./uploads/medium_'+theResponse+'" />');
 					$('#pictureFileName').attr("value",theResponse);
 				}

			}
		});
		
	});
</script>


<!-- Script for validation of form fields -->

<script type="text/javascript">

map = new GMap2(document.getElementById("mapDIV"));

function submitAnnotation(){
	
	var title=document.getElementById("title").value;
	var description=document.getElementById("description").value;
	var address=document.getElementById("address").innerHTML;
	var lat=document.getElementById("lat").value;
	var lng=document.getElementById("lng").value;
	var picture=document.getElementById("pictureFileName").value;
	var target=document.getElementById("target").value;
	var theDate=document.getElementById("ADate");
	
	var titlestatus=document.getElementById("titlestatus");
	var descriptionstatus=document.getElementById("descriptionstatus");
	var addressstatus=document.getElementById("addressstatus");
	var picturestatus=document.getElementById("picturestatus");
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
		
	if (lat==null || lat=="" || lng==null || lng=="" ){
		addressstatus.innerHTML="Coordinates are required";
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

	document.forms["submitannotation"].submit();
          
}





//Reverse geocoding of lat lon to street address

function reverseGeo(latlng){
	
	document.getElementById("address").innerHTML="";
	document.getElementById("autoAddress").value="";
	
	var reversegeocoder = new GReverseGeocoder(map);

    GEvent.addListener(reversegeocoder, "load",
            function(placemark) {
    			document.getElementById("address").innerHTML=placemark.address;
    			document.getElementById("autoAddress").value=placemark.address;
            }
          );

          reversegeocoder.reverseGeocode(latlng);
          
}


//Called when HTML5 location acquisition succeeds

function success(position) {
	var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude); 

    map.setCenter(latlng, 15);

    document.getElementById("lat").value = latlng.lat().toFixed(5);
    document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;
    
    document.getElementById("lng").value = latlng.lng().toFixed(5);
    document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;
    
    reverseGeo(latlng);

}

//Called when HTML5 location acquisition fails
function error(msg) {
	  	alert("Cannot determine current position");
	
	}
 
 

    
//Attempt to get the current location via HTML5
    if (navigator.geolocation) {
    	  navigator.geolocation.getCurrentPosition(success, error);
    	  
    	} else {
    	  error('not supported');
    	}
    
  
  
  
//Called when the user specifies an address and presses Enter
//Attempts to geocode the address and refresh the map view to reflect the given address
function showAddress(address) {
// 	   var map = new GMap2(document.getElementById("mapDIV"));
       map.addControl(new GSmallMapControl());
       map.addControl(new GMapTypeControl());
       if (geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
              alert(address + " not found");
             	 document.getElementById("lat").value = 0;
    	     	 document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

    	  		 document.getElementById("lng").value = 0;
    	     	 document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;
            } 
            else {
		  		document.getElementById("lat").value = point.lat().toFixed(5);
	      		document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

	   			document.getElementById("lng").value = point.lng().toFixed(5);
	      		document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

		 		map.clearOverlays();
				map.setCenter(point, 14);
   
				var marker = new GMarker(point, {draggable: true});  
		 		map.addOverlay(marker);
		 		
	     		sendLocation(point.lat().toFixed(5),point.lng().toFixed(5));

	     		document.getElementById("autoAddress").innerHTML="";
	     		document.getElementById("addressstatus").innerHTML="";

	     		reverseGeo(point);
	     		
	     		sendLocation(point.lat().toFixed(5),point.lng().toFixed(5));
 
				GEvent.addListener(marker, "dragend", function() {
					document.getElementById("address").value="";
	     			var point =marker.getPoint();
		     		map.panTo(point);
	      			
		     		document.getElementById("lat").value = point.lat().toFixed(5);
	      			document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

		     		document.getElementById("lng").value = point.lng().toFixed(5);
		     		document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

		     		//whenever the map view is updated, attempt to reverse geocode the new coordinates to display the address
					document.getElementById("autoAddress").innerHTML="";
		     		document.getElementById("addressstatus").innerHTML="";

		     		reverseGeo(point);
		     		sendLocation(point.lat().toFixed(5),point.lng().toFixed(5));
				});
 
 
	 			GEvent.addListener(map, "moveend", function() {
			  		map.clearOverlays();
	 				document.getElementById("address").value="";
	    			var center = map.getCenter();
	    			marker.setPoint(center);
	     			var point = marker.getPoint();
		     		
					map.addOverlay(marker);
	      			
		     		document.getElementById("lat").value = point.lat().toFixed(5);
	      			document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

		     		document.getElementById("lng").value = point.lng().toFixed(5);
		     		document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

		     		//whenever the map view is updated, attempt to reverse geocode the new coordinates to display the address
					document.getElementById("autoAddress").innerHTML="";
		     		document.getElementById("addressstatus").innerHTML="";
		     		reverseGeo(point);
		     		sendLocation(point.lat().toFixed(5),point.lng().toFixed(5));
				});
 
            }
          }
        );
      }
    }


//Displays an interactive Google Map

function load() {
    if (GBrowserIsCompatible()) {
      map = new GMap2(document.getElementById("mapDIV"));
      map.addControl(new GSmallMapControl());
      map.addControl(new GMapTypeControl());
      
      //Set the center to Valletta, Malta first
      var center = new GLatLng(35.89779, 14.51411);
      
      map.setCenter(center, 15);
      geocoder = new GClientGeocoder();
      
      var marker = new GMarker(center, {draggable: true});  
      map.addOverlay(marker);
      
      document.getElementById("lat").value = center.lat().toFixed(5);
      document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

      document.getElementById("lng").value = center.lng().toFixed(5);
      document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

 	 GEvent.addListener(marker, "dragend", function() {
	 		document.getElementById("address").value="";
			var point =marker.getPoint();
  		map.panTo(point);
			
  		document.getElementById("lat").value = point.lat().toFixed(5);
			document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

  		document.getElementById("lng").value = point.lng().toFixed(5);
  		document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

  		//whenever the map view is updated, attempt to reverse geocode the new coordinates to display the address
		document.getElementById("autoAddress").innerHTML="";
		document.getElementById("addressstatus").innerHTML="";
  		reverseGeo(point);
  		sendLocation(center.lat().toFixed(5),center.lng().toFixed(5));


 });
 	 

	  GEvent.addListener(map, "moveend", function() {
				document.getElementById("address").value="";

		  		map.clearOverlays();
    			var center = map.getCenter();
		 		var marker = new GMarker(center, {draggable: true});
		  		map.addOverlay(marker);
		  		
		  		document.getElementById("lat").value = center.lat().toFixed(5);
		    	document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

	   			document.getElementById("lng").value = center.lng().toFixed(5);
	    		document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

				//whenever the map view is updated, attempt to reverse geocode the new coordinates to display the address
				document.getElementById("autoAddress").innerHTML="";
		     	document.getElementById("addressstatus").innerHTML="";
				reverseGeo(center);
				sendLocation(center.lat().toFixed(5),center.lng().toFixed(5));
 
 
	 GEvent.addListener(marker, "dragend", function() {
		 		document.getElementById("address").value="";
     			var point =marker.getPoint();
	     		map.panTo(point);
      			
	     		document.getElementById("lat").value = point.lat().toFixed(5);
      			document.getElementById("latstatus").innerHTML = document.getElementById("lat").value;

	     		document.getElementById("lng").value = point.lng().toFixed(5);
	     		document.getElementById("lonstatus").innerHTML = document.getElementById("lng").value;

	     		//whenever the map view is updated, attempt to reverse geocode the new coordinates to display the address
				document.getElementById("autoAddress").innerHTML="";
		     	document.getElementById("addressstatus").innerHTML="";
	     		reverseGeo(point);
	     		sendLocation(center.lat().toFixed(5),center.lng().toFixed(5));

 
        });

      });

    }}
    
</script>