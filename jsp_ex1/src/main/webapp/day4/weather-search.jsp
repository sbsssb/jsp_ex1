<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	 text-align: center;
	}
</style>
</head>
<body>
	<%@include file="../db.jsp" %>
	
	<span>시:</span>
	<select id="paramSi" onchange="fnSi(this.value)">
		<option>::선택::</option>
	
	<%
		ResultSet rs = null;
		String paramSi = "";
		String paramGu = "";
		
		if(request.getParameter("paramSi") != null){
			
			paramSi = request.getParameter("paramSi");
		
		}
		
		if(request.getParameter("paramGu") != null){
			
			paramGu = request.getParameter("paramGu");
		
		}
	
		try {
			
			rs = stmt.executeQuery("SELECT DISTINCT SI FROM AREA");
					
			while(rs.next()) {
				
				String si = rs.getString("SI");
				String selected = si.equals(paramSi) ? "selected" : "";
		
	%>
			
			<option value="<%= si %>" <%= selected %>><%= si %></option>
		
	
	<%
			} 
		}catch(SQLException e) {

				out.println("오류 발생!");

			}
	%>
	</select>
	

	
	<span>구:</span>
	<select onchange="fnGu(this.value, '<%= paramSi %>')">
		<option>::선택::</option>
	
	<%
		try {
			
			rs = stmt.executeQuery("SELECT DISTINCT GU FROM AREA WHERE SI = '" + paramSi + "' AND GU IS NOT NULL");
					
			while(rs.next()) {
				
				String gu = rs.getString("GU");
				String selected = gu.equals(paramGu) ? "selected" : "";
		
	%>
			<option value="<%= gu %>" <%= selected %>><%= gu %></option>
		
	
	<%
			} 
		}catch(SQLException e) {

				out.println("오류 발생!");

			}
	%>
	</select>
	
	<span>동:</span>
	<select id="dong" onchange="fnDong(this.value)">
		<option>::선택::</option>
	
	<%
		try {
			
			rs = stmt.executeQuery("SELECT DISTINCT DONG FROM AREA WHERE SI = '" + paramSi + "' AND GU='" + paramGu + "' AND DONG IS NOT NULL");
					
			while(rs.next()) {
		
	%>
			<option value="<%= rs.getString("DONG") %>"><%= rs.getString("DONG") %></option>
		
	
	<%
			} 
		}catch(SQLException e) {

				out.println("오류 발생!");

			}
	%>
	</select>
	
	<button onclick="fnAptCall()">검색</button>
</body>
</html>

<script>

	/* let si = document.querySelector("#paramSi").value; */
	
	function fnSi(si) {
		location.href="?paramSi="+si;
	}
	
	function fnGu(gu, paramSi) {
		location.href="?paramSi="+paramSi+"&paramGu="+gu;
	}
	
	function fnAptCall() {
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'gCBQ6hjNyqtzXPWwMiUl%2B7y87beC70h3an%2F91yG4iELtCaQTeTL7qh%2BE9eTQtMU9jU0%2BSyYNiChlbdViU51BSA%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20250225'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
		queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('125'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    }
		};
		
		xhr.send('');
	}
</script>
