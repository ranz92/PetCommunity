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
				<h2 class="text-center">You have voted for ${photo.caption}</h2>

				<hr>
				<div class="row-fluid">
					<div class="span6">
						<div class="col-md-12 column">
							<a href="${photo.url}"> <img src="${photo.url}" alt="800x600"
								style="margin: 0px auto; display: block"></a> <br>
							<p align="center">
								<a class="btn btn-block btn-success btn-lg" href="list.do">&laquo;
									Back</a>
							</p>
						</div>
					</div>

					<hr>
					<br>

					<h2 class="text-center">Share your voting on Twitter!</h2>
					<h4 class="text-center">Add your comments for your voting:</h4>
					<div>
						<div class="tweet">
							<div class="text-center">
								<input type="text" name="tweetbox" value="${text}"
									style="width: 300px;">
							</div>
						</div>
					</div>
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

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="template-bottom.jsp" />