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
	/* String empNo = request.getParameter("empNo"); */

	ResultSet rs = stmt.executeQuery("SELECT E2.EMPNO, E2.ENAME, COUNT(*) AS 부하수"
			+ " FROM EMP E"
			+ " LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO"
			+ " WHERE E.MGR IS NOT NULL"
			+ " GROUP BY(E2.EMPNO, E2.ENAME)");
	
	while(rs.next()) {
%>

	<input hidden class="ename" value="<%= rs.getString("ENAME") %>">
	<input hidden class="count" value="<%= rs.getString("부하수") %>" >
	

<% 
	}
%>

<div id="chart"></div>
<div id="chart2"></div>
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
	
	
	
	
	
	 var options = {
	          series: [{
	          name: 'Inflation',
	          data: countList
	        }],
	          chart: {
	          height: 350,
	          type: 'bar',
	        },
	        plotOptions: {
	          bar: {
	            borderRadius: 10,
	            dataLabels: {
	              position: 'top', // top, center, bottom
	            },
	          }
	        },
	        dataLabels: {
	          enabled: true,
	          formatter: function (val) {
	            return val;
	          },
	          offsetY: -20,
	          style: {
	            fontSize: '12px',
	            colors: ["#304758"]
	          }
	        },
	        
	        xaxis: {
	          categories: enameList,
	          position: 'top',
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false
	          },
	          crosshairs: {
	            fill: {
	              type: 'gradient',
	              gradient: {
	                colorFrom: '#D8E3F0',
	                colorTo: '#BED1E6',
	                stops: [0, 100],
	                opacityFrom: 0.4,
	                opacityTo: 0.5,
	              }
	            }
	          },
	          tooltip: {
	            enabled: true,
	          }
	        },
	        yaxis: {
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false,
	          },
	          labels: {
	            show: false,
	            formatter: function (val) {
	              return val + "%";
	            }
	          }
	        
	        },
	        title: {
	          text: 'Monthly Inflation in Argentina, 2002',
	          floating: true,
	          offsetY: 330,
	          align: 'center',
	          style: {
	            color: '#444'
	          }
	        }
	        };

	        var chart = new ApexCharts(document.querySelector("#chart2"), options);
	        chart.render();

</script>