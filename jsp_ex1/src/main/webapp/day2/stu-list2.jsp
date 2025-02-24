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
</style>

</head>

<body>

	<%@include file="../db.jsp" %>
	
	<% 

		

	%>

	<table>

		<tr>
		
			<th>선택</th>

			<th>학번</th>

			<th>이름</th>

			<th>학과</th>

			<th>성별</th>

		</tr>



	

	<% 

	ResultSet rs = null;

		try{

			rs = stmt.executeQuery("SELECT STU_NO, STU_NAME, STU_DEPT, DECODE(STU_GENDER,'M','남자','여자') AS GENDER FROM STUDENT");

			// 첫번째 학생의 이름, 학번 출력

			//rs.next(); 커서 이동

			//학번,이름,학과,성별(남자,여자)

			//테이블형태로

	

			while(rs.next()) {
				
				String stuNo = rs.getString("STU_NO");

				%>

				<tr>
					<td><input type="radio" name="student" value="<%= stuNo %>"></td>

					<td><%= stuNo %></td>

					<td>
						<a href="stu-view.jsp?stuNo=<%= stuNo %>"><%= rs.getString("STU_NAME") %></a>
					</td>

					<td><%= rs.getString("STU_DEPT") %></td>

					<td><%= rs.getString("GENDER") %></td><!-- .equals("M") ? "남자" : "여자" -->

				</tr>

				

				<%

			}

			

			

			

			/*out.println(rs.getString("STU_NO"));

			rs.next();

			rs.next();

			out.println(rs.getString("STU_NAME"));

			out.println(rs.getString("STU_NO"));*/

			

		} catch(SQLException e) {

			out.println("오류 발생!");

		}

	

	%>

		</table>
		
		<div><input type="button" value="삭제" onclick="fnStuRemove()"></div>

</body>

</html>

<script>
	function fnStuRemove() {
		let select = document.querySelector("input[name='student']:checked");
		console.log(select.value);
		location.href = "stu-delete.jsp?stuNo="+select.value;
	}
</script>