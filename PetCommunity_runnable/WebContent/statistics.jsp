<jsp:include page="template-top.jsp" />
<br />
<br />
<br />
<br />
<br />

<div class="container-fluid">
	<div class="row">
	 <link rel="stylesheet" href="css/keen-dashboards.css">
		<div class="col-sm-8">
			<div class="chart-wrapper">
				<div class="chart-title">Trends of Topics (Past 3 days)</div>
				<div class="chart-stage">
					<div id="chart-01"></div>
				</div>
				<div class="chart-notes">Sample data.</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="chart-wrapper">
				<div class="chart-title">Pageviews by browser (past 5 days)</div>
				<div class="chart-stage">
					<div id="chart-02"></div>
				</div>
				<div class="chart-notes">Notes go down here</div>
			</div>
		</div>

	</div>


	<div class="row">

		<div class="col-sm-4">
			<div class="chart-wrapper">
				<div class="chart-title">Impressions by advertiser</div>
				<div class="chart-stage">
					<div id="chart-03"></div>
				</div>
				<div class="chart-notes">Notes go down here</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="chart-wrapper">
				<div class="chart-title">Impressions by device</div>
				<div class="chart-stage">
					<div id="chart-04"></div>
				</div>
				<div class="chart-notes">Notes go down here</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="chart-wrapper">
				<div class="chart-title">Impressions by country</div>
				<div class="chart-stage">
					<div id="chart-05"></div>
				</div>
				<div class="chart-notes">Notes go down here</div>
			</div>
		</div>

	</div>

	<hr>

</div>

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script src="js/holder.js" type="text/javascript"></script>
<script type="text/javascript">
	Holder.add_theme("white", {
		background : "#fff",
		foreground : "#a7a7a7",
		size : 10
	});
</script>

<script src="js/keen.min.js" type="text/javascript"></script>
<script src="js/meta.js" type="text/javascript"></script>
<script src="js/keen.dashboard.js" type="text/javascript"></script>

<jsp:include page="template-bottom.jsp" />
