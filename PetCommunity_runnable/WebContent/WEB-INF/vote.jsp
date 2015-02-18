<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="template-top.jsp" />

<style>
.grid {
	width: 90%;
	padding: 15px;
	background: #fff;
	margin: 8px;
	font-size: 12px;
	box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-moz-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-transition: top 1s ease, left 1s ease;
	-moz-transition: top 1s ease, left 1s ease;
	-o-transition: top 1s ease, left 1s ease;
	-ms-transition: top 1s ease, left 1s ease;
}
</style>

<br>
<br>

<div class="container">

	<div class="row-fluid">
		<div class="span12">
			<div class="hero-unit">
				<h2 class="text-center">You have voted for {photo.id}</h2>

				<hr>
				<div class="row-fluid">
					<div class="span6">
						<div class="col-md-12 column">
							<a href="${photo.url}"> <img src="${photo.url}" style="margin:0px auto;display:block"></a>
						</div>
					</div>

					<div class="span6">
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
								var wrapper = new google.visualization.ChartWrapper(
										{
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

					</div>
				</div>
				<hr>
				<br>
				<p align="center">
					<a class="btn btn-block btn-success btn-lg" href="list.do">&laquo; Back</a>
				</p>
				<p>
					Share your voting on Twitter!
					<!--Twitter Share Button  -->
					<a href="https://twitter.com/share" class="twitter-share-button"
						data-lang="en" data-via="Team10_FS" data-url="${photo.url}"
						data-hashtags="Task8PetsoftheWeekCampaign"
						data-text="I vote for ${photo.caption} because ${tweetbox}"
						data-size="large">Share on Twitter</a>
					<script>
						!function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (!d.getElementById(id)) {
								js = d.createElement(s);
								js.id = id;
								js.src = "https://platform.twitter.com/widgets.js";
								fjs.parentNode.insertBefore(js, fjs);
							}
						}(document, "script", "twitter-wjs");
					</script>
				</p>

				<div></div>

			</div>
		</div>
	</div>
</div>

	<jsp:include page="template-bottom.jsp" />