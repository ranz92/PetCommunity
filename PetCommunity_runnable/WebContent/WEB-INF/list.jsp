<jsp:include page="template-top.jsp" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="databeans.PhotoBean"%>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load('visualization', '1');
</script>

<p>
<div class="container">

	<form method="POST" action="vote.do">
		<div class="row">
			<h2 class="text-center">Vote for the Pets of the Week!</h2>
			<div class="row clearfix">
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
										<div class="col-md-4 column">
											<a href="${flickr.url}"><img alt="140x140" class="img-thumbnail" src="${flickr.url}"></a>
											<form action="vote.do" method="POST">
												<input type="submit" class="btn btn-lg btn-info btn-block" value="Like"> <input
													type="hidden" name="vote" value="${flickr.photoId}">
												<button type="button" class="btn btn-sm disabled btn-block">Current vote: ${flickr.vote}</button>
												<br><br>
											</form>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</section>
				</div>
			</div>
			<hr>
			<div class="col-md-12 column">
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
		<br> <br>

	</form>
	<div id="visualization" style="width: 600px; height: 400px;"></div>
	<br>
	<hr>
	<br>

</div>
</p>

<jsp:include page="template-bottom.jsp" />

<script type="text/javascript">
	function drawVisualization() {
		var d1 = '${flickrIdList}';
		var d2 = '${flickrVoteList}';

		d1 = d1.substring(1, d1.length - 1);

		var s1 = d1.split(",");
		var firstv;
		for (var a = 0; a < d2.length; a++) {
			if (d2[a] == ',')
				break;
			firstv += d2[a];
		}
		firstv = firstv.substring(10, firstv.length);
		d2 = d2.substring(1, d2.length - 1);

		var s2 = d2.split(",");
		var tArray = new Array();
		for (var a = 0; a < 2; a++) {
			tArray[a] = new Array();
		}
		;
		tArray[0][0] = '1';
		//tArray[0][1] = 0;
		tArray[0][1] = parseInt(firstv);
		for (var a = 1; a <= s1.length; a++) {
			tArray[0][a] = 'Photo ' + s1[a - 1];
			//tArray[0][a]= firstv[a - 1];
			tArray[1][a] = parseInt(s2[a - 1]);
			//tArray[0][a]= 'a';
			//tArray[1][a]= a;
		}
		;
		var wrapper = new google.visualization.ChartWrapper({
			chartType : 'ColumnChart',
			dataTable : tArray,
			options : {
				'title' : 'Vote Statistics'
			},
			containerId : 'visualization'
		});
		wrapper.draw();
	}
	google.setOnLoadCallback(drawVisualization);
</script>

