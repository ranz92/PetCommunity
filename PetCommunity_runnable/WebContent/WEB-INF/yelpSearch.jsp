<jsp:include page="template-top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <div class="container">
	<div class="row clearfix">
	 	<div class="col-md-12 column">
			<h3>
				Popular Pet Friendly Restaurants
			</h3>
			
			<a href="mapFinal.jsp">Show these in the map. </a>
			<c:set var="count" value="0" />
			<c:forEach var="business" items="${businessList}">
			<c:set var="count" value="${count+1 }" />
			<div class="media">
				 <a href="${ business.url}" class="pull-left"><img src="${business.image_url}" class="media-object" alt='${business.name }' /></a>
				<div class="media-body">
					<h4 class="media-heading">
						${count }. ${business.name}
					</h4>
					<div>
						${business.rating } 
						<img src="${business.rating_img_url_small }  " class="media-object" alt='${business.name }' />
						${business.review_count } reviews<br>
						Address: ${business.display_address } <br>
						Phone: ${business.phone }  <br>
						Status: 
						<c:choose>
                            <c:when test="${business.is_closed == false}"> Open.  </c:when>
                            <c:otherwise>Close   </c:otherwise>
						</c:choose>
					</div>
					
					
				</div>
			</div>
			<hr>
			</c:forEach>
	</div>
	</div>
</div>		
<jsp:include page="template-bottom.jsp" />
