<jsp:include page="template-top.jsp" />
<jsp:useBean id="business" class="databeans.BusinessBean" scope="page"/>
<%@page import="databeans.BusinessBean;" %>

<div class="container">
	<div class="row clearfix">
	 	<div class="col-md-6 column">
		   <jsp:include page="yelpSearch.jsp" />
		</div>  
		<div class="col-md-6 column">
		<jsp:include page="map.jsp" />
		</div>
	</div>
</div>


<jsp:include page="template-bottom.jsp" />