<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="../db.jsp" %>
<%
	String empNo = request.getParameter("empNo");

	ResultSet rs = stmt.executeQuery("SELECT E2.EMPNO, E.ENAME, COUNT(*) AS 부하수"
			+ " FROM EMP E"
			+ " LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO"
			+ " WHERE E2.EMPNO = '" + empNo + "'"
			+ " GROUP BY(E2.EMPNO, E.ENAME)");
	
	while(rs.next()) {
%>

	<input hidden class="ename" value="<%= rs.getString("ENAME") %>">
	<input hidden class="count" value="<%= rs.getString("부하수") %>" >
	

<% 
	}
%>

<div id="chart"></div>
</body>
</html>

<script>

	let ename = document.querySelectorAll(".ename");
	let enameList = [];
	for(let i = 0; i < ename.length; i++) {
		enameList.push(ename[i].value);
	}
	
	let count = document.querySelectorAll(".count");
	let countList = [];
	for(let i = 0; i < count.length; i++) {
	    countList.push(parseInt(count[i].value));
	}
	



	var options = {
	          series: countList,
	          chart: {
	          width: 380,
	          type: 'pie',
	        },
	        labels: enameList,
	        responsive: [{
	          breakpoint: 480,
	          options: {
	            chart: {
	              width: 200
	            },
	            legend: {
	              position: 'bottom'
	            }
	          }
	        }]
	        };

	        var chart = new ApexCharts(document.querySelector("#chart"), options);
	        chart.render();
</script>