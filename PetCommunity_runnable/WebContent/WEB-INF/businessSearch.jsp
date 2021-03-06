<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Yelp Search based on Google Map</title>
    <style type="text/css">
        html, body {width: 100%; height: 100%; font-family: arial;}  
        body {margin:0;padding 0;overflow: hidden;}
        #mapContainer {padding-top: 50px;}
        #map, #mapContainer {width:100%; height: 100%;}
        #top {position:absolute; top:0; left:0; width: 100%; height: 50px; line-height: 50px;}
        #spinner { visibility: hidden; margin-left:3px;}
        #poweredby, #searchbox {line-height: 50px;}
        #searchbox {text-align: center;}
        #poweredby { float: right; margin-right: 3px;}
        #poweredby img { vertical-align: baseline;}
        .marker {font-size: 11px;}
        .marker .businessimage { float: left;}
        .marker .ratingsimage {vertical-align:middle; margin-top:0px;}
        .marker .businessinfo { margin-left: 110px;}
    </style>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyCV0t5DdgitNNjZOQ5scasHrtWD8fHDd70" 
        type="text/javascript"></script>
    <script type="text/javascript">
    var YWSID = "u2fS4UNuHWCwwt1DzhSl5A"; // common required parameter (api key)
    var map = null;
    var icon = null;
    /*
     * Creates the map object and calls setCenterAndBounds
     * to instantiate it.
     */
    function load() {
        map = new GMap2(document.getElementById("map"));
        GEvent.addListener(map, "load", function() {updateMap();});    
        map.setCenter(new GLatLng(37.7916,-122.4418),13);
        map.addControl(new GLargeMapControl());
        map.addControl(new GMapTypeControl());
        map.setMapType(MapTypeId.ROADMAP );
                
        if (window.attachEvent) window.attachEvent("onresize", function() { map.checkResize()} );
        else if (window.addEventListener) window.addEventListener("resize", function() { map.checkResize()}, false);
        // setup our marker icon
        icon = new GIcon();
        icon.image = "images/marker_star.png";
        icon.shadow = "images/marker_shadow.png";
        icon.iconSize = new GSize(20, 29);
        icon.shadowSize = new GSize(38, 29);
        icon.iconAnchor = new GPoint(15, 29);
        icon.infoWindowAnchor = new GPoint(15, 3);
    }
    /*
     * Construct the URL to call for the API request
     */
    function constructYelpURL() {
        var mapBounds = map.getBounds();
        var URL = "http://api.yelp.com/" +
            "business_review_search?"+
            "callback=" + "handleResults" +
            "&term=" + document.getElementById("term").value + 
            "&num_biz_requested=10" +
            "&tl_lat=" + mapBounds.getSouthWest().lat() +
            "&tl_long=" + mapBounds.getSouthWest().lng() + 
            "&br_lat=" + mapBounds.getNorthEast().lat() + 
            "&br_long=" + mapBounds.getNorthEast().lng() +
            "&ywsid=" + YWSID;
        return encodeURI(URL);
    }
    /*
     * Called on the form submission: updates the map by
     * placing markers on it at the appropriate places
     */
    function updateMap() {
        // turn on spinner animation
        document.getElementById("spinner").style.visibility = 'visible';
        var yelpRequestURL = constructYelpURL();
        /* clear existing markers */
        map.clearOverlays();
        
        /* do the api request */
        var script = document.createElement('script');
        script.src = yelpRequestURL;
        script.type = 'text/javascript';
        var head = document.getElementsByTagName('head').item(0);
        head.appendChild(script);
        return false;
    }
    /*
     * If a sucessful API response is received, place
     * markers on the map.  If not, display an error.
     */
    function handleResults(data) {
        // turn off spinner animation
        document.getElementById("spinner").style.visibility = 'hidden';
        if(data.message.text == "OK") {
            if (data.businesses.length == 0) {
                alert("Error: No businesses were found near that location");
                return;
            }
            for(var i=0; i<data.businesses.length; i++) {
                biz = data.businesses[i];
                createMarker(biz, new GLatLng(biz.latitude, biz.longitude), i);
            }
        }
        else {
            alert("Error: " + data.message.text);
        }
    }
    /*
     * Formats and returns the Info Window HTML 
     * (displayed in a balloon when a marker is clicked)
     */
    function generateInfoWindowHtml(biz) {
        var text = '<div class="marker">';
        // image and rating
        text += '<img class="businessimage" src="'+biz.photo_url+'"/>';
        // div start
        text += '<div class="businessinfo">';
        // name/url
        text += '<a href="'+biz.url+'" target="_blank">'+biz.name+'</a><br/>';
        // stars
        text += '<img class="ratingsimage" src="'+biz.rating_img_url_small+'"/>&nbsp;based&nbsp;on&nbsp;';
        // reviews
        text += biz.review_count + '&nbsp;reviews<br/><br />';
        // categories
        text += formatCategories(biz.categories);
        // neighborhoods
        if(biz.neighborhoods.length)
            text += formatNeighborhoods(biz.neighborhoods);
        // address
        text += biz.address1 + '<br/>';
        // address2
        if(biz.address2.length) 
            text += biz.address2+ '<br/>';
        // city, state and zip
        text += biz.city + ',&nbsp;' + biz.state + '&nbsp;' + biz.zip + '<br/>';
        // phone number
        if(biz.phone.length)
            text += formatPhoneNumber(biz.phone);
        // Read the reviews
        text += '<br/><a href="'+biz.url+'" target="_blank">Read the reviews �</a><br/>';
        // div end
        text += '</div></div>'
        return text;
    }
    /*
     * Formats the categories HTML
     */
    function formatCategories(cats) {
        var s = 'Categories: ';
        for(var i=0; i<cats.length; i++) {
            s+= cats[i].name;
            if(i != cats.length-1) s += ', ';
        }
        s += '<br/>';
        return s;
    }
    /*
     * Formats the neighborhoods HTML
     */
    function formatNeighborhoods(neighborhoods) {
        s = 'Neighborhoods: ';
        for(var i=0; i<neighborhoods.length; i++) {
            s += '<a href="' + neighborhoods[i].url + '" target="_blank">' + neighborhoods[i].name + '</a>';
            if (i != neighborhoods.length-1) s += ', ';
        }
        s += '<br/>';
        return s;
    }
    /*
     * Formats the phone number HTML
     */
    function formatPhoneNumber(num) {
        if(num.length != 10) return '';
        return '(' + num.slice(0,3) + ') ' + num.slice(3,6) + '-' + num.slice(6,10) + '<br/>';
    }
    
    /*
     * Creates a marker for the given business and point
     */
    function createMarker(biz, point, markerNum) {
        var infoWindowHtml = generateInfoWindowHtml(biz)
        var marker = new GMarker(point, icon);
        map.addOverlay(marker);
        GEvent.addListener(marker, "click", function() {
            marker.openInfoWindowHtml(infoWindowHtml, {maxWidth:400});
        });
        // automatically open first marker
        if (markerNum == 0)
            marker.openInfoWindowHtml(infoWindowHtml, {maxWidth:400});
    }
    //]]>
    </script>
  </head>
  <body onload="load()" onunload="GUnload()">
    <div id="top">
        <div id="poweredby">Powered by <a href="http://www.yelp.com"><img src="http://static.px.yelp.com/i/map/miniMapLogo.png" border="0" /></a></div> 
        <div id="searchbox">
            <form>
                Search for <input type="text" id="term" name="term" value="pet service"/> <input type="button" value="Search" onclick="return updateMap();"/>
                <img id="spinner" src="images/spinner.gif" />
                <span class="error" id="errorMessage" />
            </form>
        </div>
    </div>
    <div id="mapContainer"><div id="map"></div></div>
  </body>
</html>