<jsp:include page="template-top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="databeans.PhotoBean" %>

<p>
	<div class="container">
		<form method="POST" action="vote.do">
			<div class="row">
				<h2 class="text-center">Vote for the Pets of the Week!</h2>
				<div class="span6">
					<div class="hero-unit" align="center">
						<section id="wrapper">
							<h4>Choose Pictures</h4>
							<div id="container">
								<c:if test="${empty photoList}">
									<p>No result found. Please try another key word.</p>
								</c:if>
								<c:if test="${!empty photoList}">
									<c:forEach items="${photoList}" var="flickr">
										<div class="grid">
											<div class="imgholder">
												<a href="${flickr.url}"> <img src="${flickr.url}" height="180" width="320"></a>
											</div>
											<p>
												<input type="radio" name="flickrbox"
													value="${flickr.photoId}">
												<input type="button" value="Vote ${flickr.vote}" disabled>
											</p>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</section>
					</div>
				</div>
				<hr>
				<div class="span6">
					<div class="hero-unit">
						<h4 class="text-center">Reason</h4>

						<div>
								<div class="tweet">
										<div class="text-center">
											<input type="text" name="tweetbox" value="${text}" style="width: 300px;">
										</div>
									</div>
							</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div align="center">
				<button type="submit" class="btn btn-primary">Let's vote &raquo;</button>
			</div>

		</form>

		<br>
		<hr>
		<br>

	</div>
</p>

<jsp:include page="template-bottom.jsp" />