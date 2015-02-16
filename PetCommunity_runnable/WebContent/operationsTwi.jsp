<jsp:include page="template-top.jsp" />
	<br />
	<br />
	<br />
	<br />
	<br />

<small> <p align="right"> <font color="blue"> <a href="./logout">Welcome ${twitter.screenName } (${twitter.id })</a></font></p></small>

<div class="row clearfix">
		<div class="col-md-12 column">
		<p>
		
		</p>
			<form class="form-horizontal" role="form" action="./post" method="POST">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">Tweet to Post:</label>
					<div class="col-sm-10">
						<input type="text" name="text" class="form-control" id="inputEmail3" />
						 <br />
						<input type="file" name="fileName" /> 
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" value="update" class="btn btn-default">Post</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-12 column">
		<div class="row clearfix">
				<div class="col-md-6 column">
				</div>
				<div class="col-md-6 column">
				<a class="twitter-timeline" data-dnt="true" href="https://twitter.com/hashtag/pets" data-widget-id="566636638672289792">#pets Tweets</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
				</div>
		</div>	
	</div>
	
			
<jsp:include page="template-bottom.jsp" />