<jsp:include page="template-top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="business" class="databeans.BusinessBean" scope="page"/>
<%@page import="databeans.BusinessBean;" %>

<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple markers</title>
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
  var center = new google.maps.LatLng(40.4433,-79.9436);
  var mapOptions = {
    zoom: 14,
    center: center
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  //Marker.
  
  <%
    BusinessBean[] list=(BusinessBean[]) request.getAttribute("businessList");
    for (int i=0;i<list.length;i++) {
  %>
  
  var contentString = '<div class="media">'+
                      '<a href="<%=list[i].getUrl()  %>" class="pull-left">'+
                      '<img src="<%=list[i].getImage_url()  %>" class="media-object" alt="<%= list[i].getName() %>" /></a>'+
                      '<div class="media-body">'+
                      '<h4 class="media-heading"> <%= list[i].getName() %> </h4> </div>' +
                      '<div> <%=list[i].getRating()  %>'+ 
                          '<img src="<%= list[i].getRating_img_url_small() %> " class="media-object" alt="<%=list[i].getRating()  %> stars" />'+
                          '<%= list[i].getReview_count() %> reviews <br> <hr>'+
                      '</div><div class="media">'+
                          '<%= list[i].getDisplay_address() %> <br> '+
                          'Phone: <a href="tel:+1<%=list[i].getPhone()  %>" ><%=list[i].getPhone()  %> </a> <br>'+
                          'Satus: <% if (list[i].getIs_closed()=="false") {  %> Open <%} else {%> Closed <% } %>'+
                      '</div> </div>';

    var infowindow = new google.maps.InfoWindow({
        content: contentString,
        position : pos
    });
  
  var pos = new google.maps.LatLng(<%=list[i].getLatitude() %>,<%=list[i].getLongitude() %>);       
  var marker = new google.maps.Marker({
      position: pos,
      map: map,
      //animati4n: google.maps.Animation.DROP,
      //icon: image,
      title:"<%= list[i].getName() %>"
    });
  
    google.maps.event.addListener(marker, 'click', function(event) {
	  if (infowindow) {
          infowindow = new google.maps.InfoWindow();
          infowindow.open(map, marker);
      }
  });
    google.maps.event.addListener(marker, 'mouseover', function(event) {
    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
      } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
      }
    });
    google.maps.event.addListener(marker, 'mouseout', function(event) {
    	marker.setAnimation(null);
        infowindow.close();
    });  
	
	                 
  <%  } %>
  
}

    google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>

  <body>
    <div id="map-canvas"></div>
  </body>

<jsp:include page="template-bottom.jsp" />