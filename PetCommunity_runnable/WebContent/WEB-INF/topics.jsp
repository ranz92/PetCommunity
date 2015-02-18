<jsp:include page="template-top.jsp"/>
	<br />
	<br />
	<br />
	<br />
	<br />
	<a  name="topics"></a>
    <div class="content-section-a">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h1><font color=blue>Hi, @${twitter.screenName }!</font></h1>
                    <h2 class="section-heading">Welcome to Pet Lover Community!<br>Special Thanks</h2>
                    <p class="lead">Pet Lover is the Best Place for all Pet Lovers for providing the services and activities as a community.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="img/cat.jpg" alt="">
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
                    <h2 class="section-heading">Your Twitters</h2>
                </div>
                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                    <img class="img-responsive" src="img/dog.png" alt="">
                </div>
                <a class="twitter-timeline" href="https://twitter.com/SuperBacky" data-widget-id="566631024587997187">Tweets by @SuperBacky</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

    
<jsp:include page="template-bottom.jsp"/>