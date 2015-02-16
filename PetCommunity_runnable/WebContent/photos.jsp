<jsp:include page="template-top.jsp" />

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


<jsp:include page="template-bottom.jsp" />