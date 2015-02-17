<jsp:include page="template-top.jsp"/>

 <script    
          src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true;    
          key=ABQIAAAAevysxt9O5lBUCrSalm80MxQx8gmx0K-_Fjj4Tf8bNXH3BBSxZRRmI_CuZM2zQyuXEpG_uxt-aqPr-A"    
          type="text/javascript"></script> 
    
                  
                        <h2 style = "margin-top:120px; padding-bottom:30px;">Bring a pet home today!</h2>
                        
                       
          
        <body onload="load()">  
         <div id="map" style="width: 1500px; height: 500px; margin-top:-20px"></div> 
        </body>
    
 
<jsp:include page="template-bottom.jsp"/>

      
         <script language="javascript" type="text/javascript">    
      function load() {     
          if (GBrowserIsCompatible()) {     
              var map = new GMap2(document.getElementById("map"));     
              map.addControl(new GSmallMapControl());     
              map.addControl(new GMapTypeControl());         
              map.enableScrollWheelZoom();    
              map.setCenter(new GLatLng(40.4448, -79.9485), 16);    
             
              function createMarker(point, address,name,tel) {  
                 var marker = new GMarker(point);    
                 var html = '<div>'+    
                     '<a >Pet Type:'+ name +'</a><br/>'+    
                     '<a >Address:'+address +'</a><br/>'+    
                     '<a >telephone:'+tel +'</a>'+    
                     '</div>';    
                 GEvent.addListener(marker, "mouseover", function() {    
                     marker.openInfoWindowHtml(html);    
                 });    
                 GEvent.addListener(marker, "mouseout", function() {    
                     marker.closeInfoWindow();    
                 });    
                 GEvent.addListener(marker, "click", function() {    
                     map.setCenter(point, 12);     
                 });    
                 return marker;    
             }    
             var point = new GLatLng(40.4440, -79.9443);    
             map.addOverlay(createMarker(point,'Carnegie Mellon University','dog','4122282682'));   
             var point = new GLatLng(40.4448, -79.9485);     
             map.addOverlay(createMarker(point,'417 Craig Street','dog','4122282682'));
             var point = new GLatLng(40.4464, -79.9510);     
             map.addOverlay(createMarker(point,'Mellon Institute','dog','4122282682'));
             var point = new GLatLng(40.4416, -79.9446);     
             map.addOverlay(createMarker(point,'Baker Hall','dog','4122282682'));
             var point = new GLatLng(40.4457, -79.9492);     
             map.addOverlay(createMarker(point,'Carnegie Mellon University ','dog','4122282682'));
         }      
     }        
  </script>    
