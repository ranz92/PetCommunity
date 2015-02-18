<jsp:include page="template-top.jsp" />


<jsp:useBean id="business" class="databeans.BusinessBean" scope="page"/>
<%@page import="databeans.BusinessBean;" %>

<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
function initialize( ) {
  var center = new google.maps.LatLng(40.4444316,-79.9956094);
  var mapOptions = {
    zoom: 14,
    center: center
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  //Marker.
  var markers = [];

  <%
    BusinessBean[] list=(BusinessBean[]) request.getAttribute("businessList");
    for (int i=0;i<list.length;i++) {
  %>
  
  var pos = new google.maps.LatLng(<%=list[i].getLatitude() %>,<%=list[i].getLongitude() %>);       
  var marker = new google.maps.Marker({
      position: pos,
      map: map,
      //animati4n: google.maps.Animation.DROP,
      //icon: image,
      title:"<%= list[i].getName() %>"
    });
  
   markers.push(marker);
   
   google.maps.event.addListener(markers[1], 'click', function(event) {
		infowindow2.open(map, marker[1]);
	    });   
   google.maps.event.addListener(markers[1], 'click', function(event) {
		infowindow2.open(map, marker[1]);
	    });  
   
   google.maps.event.addListener(marker[0], 'mouseover', function(event) {
	    if (markers[0].getAnimation() != null) {
	        markers[0].setAnimation(null);
	      } else {
	        markers[0].setAnimation(google.maps.Animation.BOUNCE);
	      }
	    });
	    google.maps.event.addListener(markers[0], 'mouseout', function(event) {
	    	markers[0].setAnimation(null);
	        //infowindow.close();
	    });  
   var infowindow1 = new google.maps.InfoWindow({
       content: contentString1
       });
   var infowindow2 = new google.maps.InfoWindow({
       content: contentString2
       });
   var contentString1 ='<div class="media">'+
                '<a href="http://www.yelp.com/biz/ten-penny-pittsburgh" class="pull-left">'+
                '<img src="http://s3-media2.fl.yelpcdn.com/bphoto/hHI3vF-ERCfF0argHCAWRw/ms.jpg" class="media-object" alt="Ten Penny" /></a>'+
                '<div class="media-body">'+'<h4 class="media-heading"> Ten Penny </h4> </div>' +
		             '<div> 3.5'+ 
		                   '<img src="http://s3-media1.fl.yelpcdn.com/assets/2/www/img/2e909d5d3536/ico/stars/v1/stars_small_3_half.png" class="media-object" />'+
		                   '119 reviews <br> <hr>'+
		          '</div><div class="media">'+
		               '960 Penn Ave,Downtown,Pittsburgh, PA 15222 <br> '+
		               'Phone: <a href="tel:+14123188000" > 4123188000 </a> <br>'+
		               'Satus:  Open '+
		           '</div> </div>';
	var contentString2 ='<div class="media">'+
	                '<a href="http://www.yelp.com/biz/ten-penny-pittsburgh" class="pull-left">'+
	                '<img src="http://s3-media4.fl.yelpcdn.com/bphoto/lPVmPU36Chdmavepjv97sg/ms.jpg" class="media-object" alt="Meat & Potatoes" /></a>'+
	                '<div class="media-body">'+'<h4 class="media-heading"> Meat & Potatoes </h4> </div>' +
			             '<div> 4.0'+ 
			                   '<img src="http://s3-media4.fl.yelpcdn.com/assets/2/www/img/f62a5be2f902/ico/stars/v1/stars_small_4.png" class="media-object" />'+
			                   '674 reviews <br> <hr>'+
			          '</div><div class="media">'+
			               '649 Penn Ave",Downtown,Pittsburgh, PA 15222 <br> '+
			               'Phone: <a href="tel:+14123257007" > 4123257007 </a> <br>'+
			               'Satus:  Open '+'</div> </div>';
	                 
  <%  } %>
  
}
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>

  <body>
    <div id="map-canvas"></div>
  </body>

<jsp:include page="template-bottom.jsp" />

