<jsp:include page="template-top.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <div class="container">
 <h2>Which pet should you get?</h2>
 <h3>See how do people feel about</h3>
 <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-2 column">
<form action = "mood.do" method = "POST" class="form-group" role="search">
	<div class="form-group">
		<input type="text" name = query1 id = "query1" class="form-control" />
	</div>
	VS
	<div class="form-group">
		<input type="text" name = query2 id = "query2" class="form-control" />
	</div>
	<button type="submit" class="btn btn-default">Submit</button>
</form>
<br>

   <a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#cat</a><br>
    <a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#dog</a><br>
    <a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#chiwawa</a><br>
    <a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Labrador Retriever</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#German Shepherd</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Golden Retriever</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Beagle</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Bulldog</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Persian</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Maine Coon</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Exotic</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Siamese</a><br><a href="#" onclick='document.getElementById("query2").value = document.getElementById("query1").value;
    document.getElementById("query1").value  = this.text;'>#Abyssinian</a>
    
		</div>
				<div class="col-md-5 column">
				<div id="piechart1" style="width: 900px; height: 500px; "></div>
				 <c:if test="${not empty result1}">
<table class="table table-striped">
	<thead>
		<tr>

			<th>Tweets</th>
		</tr>
	</thead>


	<c:forEach var="item" items="${result1}">

	<c:if test="${item.polarity == '4'}">
		<tr class="success">
			<td>${item.text}</td>
		</tr>
</c:if>
<c:if test="${item.polarity == '2'}">
		<tr class="warning">
			<td>${item.text}</td>
		</tr>
</c:if>
<c:if test="${item.polarity == '0'}">
		<tr class="danger">
			<td>${item.text}</td>
		</tr>
</c:if>


	</c:forEach>
	

</table>
</c:if>
</div>
	<div class="col-md-5 column">
				<div id="piechart2" style="width: 900px; height: 500px; "></div>
				 <c:if test="${not empty result2}">
<table class="table table-striped">
	<thead>
		<tr>

			<th>Tweets</th>
		</tr>
	</thead>


	<c:forEach var="item" items="${result2}">


		<c:if test="${item.polarity == '4'}">
		<tr class="success">
			<td>${item.text}</td>
		</tr>
</c:if>
<c:if test="${item.polarity == '2'}">
		<tr class="warning">
			<td>${item.text}</td>
		</tr>
</c:if>
<c:if test="${item.polarity == '0'}">
		<tr class="danger">
			<td>${item.text}</td>
		</tr>
</c:if>
	</c:forEach>
	

</table>
</c:if>
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
    function myFunction(elmnt) {
	    document.getElementById("query2").value = document.getElementById("query1").value;
	    document.getElementById("query1").value  = elmnt.value;
	};
      google.load("visualization", "1", {packages:["corechart"]});
      <c:if test="${not empty query1}">
      google.setOnLoadCallback(drawChart);
      </c:if>
      
      function drawChart() {
    	 var positive1 = ${positive1};
    	 var negative1 = ${negative1};
    	 var neutral1 = ${neutral1};
    	 var query1 = "${query1}";
   		var title = "Sentimental Analysis - ";
   		var title1 = title.concat(query1);
    	  var jsAtt1 = [['Sentimental', 'Number of Tweets'],
    	               ['Positive', positive1],
    	               ['Negative', negative1],
    	               ['Neutral', neutral1]];
        var data1 = google.visualization.arrayToDataTable(jsAtt1);
        var options1 = {
          title: title1,
          chartArea:{left:20,top:60,width:'50%',height:'75%'}
        };
        var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));     
        chart1.draw(data1, options1);
        var positive2 = ${positive2};
   	 var negative2 = ${negative2};
   	 var neutral2 = ${neutral2};
   	 var query2 = "${query2}";
  		var title2 = title.concat(query2);
   	  var jsAtt2 = [['Sentimental', 'Number of Tweets'],
   	               ['Positive', positive2],
   	               ['Negative', negative2],
   	               ['Neutral', neutral2]];
       var data2 = google.visualization.arrayToDataTable(jsAtt2);
       var options2 = {
         title: title2,
         chartArea:{left:20,top:60,width:'50%',height:'75%'}
       };
       var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));     
       chart2.draw(data2, options2);
      }
    </script>
</body>

</html>