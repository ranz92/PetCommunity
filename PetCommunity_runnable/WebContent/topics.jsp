<jsp:include page="template-top.jsp" />
<a name="topics"></a>
<div class="content-section-a">
	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-sm-6">
				<hr class="section-heading-spacer">
				<div class="clearfix"></div>
				<h1>
					<font color=blue>Hi, @${twitter.screenName }!</font>
				</h1>
				<h2 class="section-heading">Welcome to Pet Lover Community!</h2>
				<br>
				<form class="form-horizontal" role="form" action="./post"
					method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Tweet:</label>
						<div class="col-sm-10">
							<input type="text" name="text" class="form-control"
								id="inputEmail3" /> <br /> <input type="file" name="fileName" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" value="update" class="btn btn-default" ><i class="fa fa-twitter fa-fw"></i>Tweet Your Post</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-5 col-lg-offset-2 col-sm-6">
				<img class="img-responsive" src="img/banner.jpg" alt="">
				
			</div>
		</div>
	</div>

</div>
<!-- /.container -->

</div>
<!-- /.content-section-a -->

<div class="content-section-b">

	<div class="container">

		<div class="row">
			<div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
				<hr class="section-heading-spacer">
				<div class="clearfix"></div>
				<h2 class="section-heading">Twitters about Pets</h2>
				<a class="twitter-timeline" data-dnt="true"
					href="https://twitter.com/hashtag/pets"
					data-widget-id="566636638672289792">#pets Tweets</a>
				<script>
					!function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
								.test(d.location) ? 'http' : 'https';
						if (!d.getElementById(id)) {
							js = d.createElement(s);
							js.id = id;
							js.src = p + "://platform.twitter.com/widgets.js";
							fjs.parentNode.insertBefore(js, fjs);
						}
					}(document, "script", "twitter-wjs");
				</script>
			</div>
			<div class="col-lg-5 col-sm-pull-6  col-sm-6">
				<hr class="section-heading-spacer">
				<div class="clearfix"></div>
				<h2 class="section-heading">Your Twitters</h2>
				<a class="twitter-timeline"
					href="https://twitter.com/${twitter.screenName }"
					data-widget-id="566631024587997187">Tweets by
					@${twitter.screenName }</a>
				<script>
					!function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
								.test(d.location) ? 'http' : 'https';
						if (!d.getElementById(id)) {
							js = d.createElement(s);
							js.id = id;
							js.src = p + "://platform.twitter.com/widgets.js";
							fjs.parentNode.insertBefore(js, fjs);
						}
					}(document, "script", "twitter-wjs");
				</script>
			</div>

		</div>

	</div>
	<!-- /.container -->

</div>
<!-- /.content-section-b -->


<jsp:include page="template-bottom.jsp" />