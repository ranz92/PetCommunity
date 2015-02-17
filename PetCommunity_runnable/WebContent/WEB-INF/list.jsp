<jsp:include page="template-top.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="databeans.PhotoBean"%>

     <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Vote for the Pet of this Week!</h1>
            </div>
			<c:forEach items="${photoList}" var="flickr">
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="${flickr.url}">
                    <img class="img-responsive" alt="" src="${flickr.url }">
                </a>
				<button type="button" class="btn btn-info btn-block active disabled">Current Vote is: ${flickr.vote}</button>
				<button type="button" value="${flickr.photoId}" class="btn btn-info btn-lg btn-block">Vote for him/her!</button> 
            </div>
			</c:forEach>
        </div>

    </div>
<jsp:include page="template-bottom.jsp" />