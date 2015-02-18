 <jsp:include page="template-top.jsp" />


<jsp:useBean id="business" class="databeans.BusinessBean" scope="page"/>
<%@page import="databeans.BusinessBean;" %>

<script    
          src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true;    
          key=ABQIAAAAevysxt9O5lBUCrSalm80MxQx8gmx0K-_Fjj4Tf8bNXH3BBSxZRRmI_CuZM2zQyuXEpG_uxt-aqPr-A"    
          type="text/javascript"></script> 
    
    <body onload="load()">  
         <div id="map" style="width: 1500px; height: 500px; margin-top:-20px"></div> 
        </body>
  </body>
   <script type="text/javascript">    
 function load() {     
          if (GBrowserIsCompatible()) {     
              var map = new GMap2(document.getElementById("map"));     
              map.addControl(new GSmallMapControl());     
              map.addControl(new GMapTypeControl());         
              map.enableScrollWheelZoom();    
              map.setCenter(new GLatLng(40.4444316,-79.9956094), 14);    
             
              function createMarker(point,address,img_url,status,name, phone, rating, rating_url, count, url) {  
                 var marker = new GMarker(point);    
                 var html = '<div class="media">'+
                 '<a href="'+url + '" class="pull-left">'+
                 '<img src="'+img_url + '" alt="'+name + '" /></a>'+
                 '<div class="media-body">'+'<h4 class="media-heading"> '+name + '</h4> </div>' +
 		             '<div> '+rating + 
 		                   '<img src="'+rating_url + '" class="media-object" />'+
 		                   count + ' reviews <br> <hr>'+
 		          '</div><div class="media">'+
 		               address+'<br> '+
 		               'Phone: <a href="tel:+1'+phone + '" > '+phone + '</a> <br>'+
 		               'Is closed? '+status + 
 		           '</div> </div>';    
                   
                 GEvent.addListener(marker, "click", function() {    
                	 marker.openInfoWindowHtml(html); 
                 });    
                 return marker;    
             }    
              
              <%
              BusinessBean[] list=(BusinessBean[]) request.getAttribute("businessList");
              for (int i=0;i<list.length;i++) {
              %>
             var point = new GLatLng(<%=list[i].getLatitude() %>,<%=list[i].getLongitude() %>);    
             map.addOverlay(createMarker(point, <%= list[i].getDisplay_address() %>,<%=list[i].getImage_url()%>, <%=list[i].getIs_closed()%>, <%= list[i].getName() %>, <%=list[i].getPhone()  %>, <%=list[i].getRating()  %>, <%= list[i].getRating_img_url_small() %>, <%= list[i].getReview_count() %>, <%=list[i].getUrl()  %>);   
       /*      var point = new GLatLng(40.4448, -79.9485);     
             map.addOverlay(createMarker(point,'417 Craig Street','dog','4122282682'));
             var point = new GLatLng(40.4464, -79.9510);     
             map.addOverlay(createMarker(point,'Mellon Institute','dog','4122282682'));
             var point = new GLatLng(40.4416, -79.9446);     
             map.addOverlay(createMarker(point,'Baker Hall','dog','4122282682'));
             var point = new GLatLng(40.4457, -79.9492);     
             map.addOverlay(createMarker(point,'Carnegie Mellon University ','dog','4122282682'));
       */
             <%  } %>
         }      
     }        
     
     // google.maps.event.addDomListener(window, 'load', initialize);
    </script>
 

  

<jsp:include page="template-bottom.jsp" />