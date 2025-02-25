<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<%@ page import="java.sql.*" %>

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
	
	a {
		text-decoration: none;
		color: black;
	}
</style>

</head>

<body>

	<%@include file="../db.jsp" %>
	
	<% 

		

	%>

	<table>

		<tr>
		
			<th>학번</th>

			<th>이름</th>

			<th>학과</th>

			<th>평균점수</th>

		</tr>



	

	<% 

	ResultSet rs = null;
	String query = "SELECT S.STU_ID, STU_NAME, STU_DEPT, AVG(GRADE) AS AVG"
			+ " FROM TBL_STULIST S"
			+ " INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID"
			+ " GROUP BY S.STU_ID, STU_NAME, STU_DEPT"
			+ " ORDER BY AVG DESC";

		try{

			rs = stmt.executeQuery(query);	

			while(rs.next()) {
				
				String stuId = rs.getString("STU_ID");

				%>

				<tr>

					<td><%= stuId %></td>

					<td>
						<a href="stu-view.jsp?stuId=<%= stuId %>"><%= rs.getString("STU_NAME") %></a>
					</td>

					<td><%= rs.getString("STU_DEPT") %></td>

					<td><%= rs.getString("AVG") %>점</td>

				</tr>

				

				<%

			}

			

		} catch(SQLException e) {

			out.println("오류 발생!");

		}

	

	%>

		</table>
		
		<div><input type="button" value="학생 추가" onclick="fnInsert()"></div>

</body>

</html>

<script>
	function fnInsert() {
		location.href="stu-insert.jsp";
	}
</script>