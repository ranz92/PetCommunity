<%-- <jsp:include page="template-top.jsp" />

<script>
function jsonFlickrApi(rsp) {
	window.rsp = rsp;
	var s="";

	
	/* s = "total number is: " + rsp.photos.photo.length + "<br/>"; */
    
    for (var i=0; i < rsp.photos.photo.length; i++) {
      photo = rsp.photos.photo[i];
      t_url = "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "t.jpg";
      p_url = "http://www.flickr.com/photos/" + photo.owner + "/" + photo.id;
      s +=  '<a href="' + p_url + '">' + '<img alt="'+ photo.title + 
        '"src="' + t_url + '"/>' + '</a>';
    }
    document.writeln(s);
    
}
</script>
<script src="https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=61eb1f34a1d9daa47a4e4e4617d31e72&tags=cat+cats&per_page=100&format=json"></script>


<jsp:include page="template-bottom.jsp" /> --%>


<jsp:include page="template-top.jsp" />

 <script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/lightbox.min.js"></script>
	<link href="css/lightbox.css" rel="stylesheet" /> 


<div class="container">


<div class="row clearfix">
<h2 align="center"> See what others posting about pets</h2>
		<div class="col-md-6 column">
		<p align="center">cat</p>
		<br />
		<script>
function jsonFlickrApi(rsp) {
	window.rsp = rsp;
	var s="";

	
	/* s = "total number is: " + rsp.photos.photo.length + "<br/>"; */
    
    for (var i=0; i < rsp.photos.photo.length; i++) {
      photo = rsp.photos.photo[i];
      /* t_url = "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "t.jpg"; */
        t_url = "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "m.jpg";
      p_url = "http://www.flickr.com/photos/" + photo.owner + "/" + photo.id;
       /* s +=  '<a href="' + p_url + '">' + '<img alt="'+ photo.title + 
        '"src="' + t_url + '"/>' + '</a>';  */
        s +=  '<a href="' + "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "z.jpg" + '" data-lightbox="roadtrip">' + '<img alt="'+ photo.title + 
      '"src="' + t_url + '"/>' + '</a>';  
     
    }
    document.writeln(s);
    
    
}
</script>
<script src="https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=61eb1f34a1d9daa47a4e4e4617d31e72&tags=cat+cats&per_page=20&format=json"></script> 
		
		</div>
		
		
		
		
		<div class="col-md-6 column">
		<p align="center">dog</p>
		<br />
		 <script>
function jsonFlickrApi(rsp) {
	window.rsp = rsp;
	var s="";

	
	/* s = "total number is: " + rsp.photos.photo.length + "<br/>"; */
    
    for (var i=0; i < rsp.photos.photo.length; i++) {
      photo = rsp.photos.photo[i];
      /* t_url = "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "t.jpg"; */
        t_url = "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "m.jpg";
      p_url = "http://www.flickr.com/photos/" + photo.owner + "/" + photo.id;
       /* s +=  '<a href="' + p_url + '">' + '<img alt="'+ photo.title + 
        '"src="' + t_url + '"/>' + '</a>';  */
        s +=  '<a href="' + "http://farm" + photo.farm + ".static.flickr.com/" + 
        photo.server + "/" + photo.id + "_" + photo.secret + "_" + "z.jpg" + '" data-lightbox="roadtrip">' + '<img alt="'+ photo.title + 
      '"src="' + t_url + '"/>' + '</a>';  
     
    }
    document.writeln(s);
    
    
}
</script>
<script src="https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=61eb1f34a1d9daa47a4e4e4617d31e72&tags=dog+dogs&per_page=20&format=json"></script> 
		</div>
	</div>
</div>

<jsp:include page="template-bottom.jsp" />


