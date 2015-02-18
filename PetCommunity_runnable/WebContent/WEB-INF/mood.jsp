<jsp:include page="template-top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <div class="container">
 <h2>How do people feel about</h2>
 <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
<form action = "mood.do" method = "POST" class="form-group" role="search">
	<div class="form-group">
		<input type="text" name = query class="form-control" />
	</div>
	<button type="submit" class="btn btn-default">Submit</button>
</form>
<br>
<form action="mood.do" method="post">
    <a href="#" onclick="parentNode.submit();">#cat</a>
    <input type="hidden" name="query" value="#cat">
</form>
<form action="mood.do" method="post">
    <a href="#" onclick="parentNode.submit();">#dog</a>
    <input type="hidden" name="query" value="#dog">
</form>

<form action="mood.do" method="post">
    <a href="#" onclick="parentNode.submit();">#puppy</a>
    <input type="hidden" name="query" value="#puppy">
</form>

				</div>
				<div class="col-md-8 column">
				<div id="piechart" style="width: 900px; height: 500px; margin-top:-60px;"></div>
<table class="table table-striped">
	<thead>
		<tr>

			<th>Tweets</th>
		</tr>
	</thead>


	<c:forEach var="item" items="${result}">


		<tr>
			<td>${item.text}</td>
		</tr>



	</c:forEach>

</table>

</div>
				</div>


</div>
</div>



	
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#services">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Team 10 Five Sisters. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
    	 var positive = ${positive};
    	 var negative = ${negative};
    	 var neutral = ${neutral};
    	 var query = "${query}";
   		var title = "Sentimental Analysis - ";
   		var title1 = title.concat(query);
    	  var jsAtt = [['Sentimental', 'Number of Tweets'],
    	               ['Positive', positive],
    	               ['Negative', negative],
    	               ['Neutral', neutral]];
        var data = google.visualization.arrayToDataTable(jsAtt);
        var options = {
          title: title1
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
</body>

</html>