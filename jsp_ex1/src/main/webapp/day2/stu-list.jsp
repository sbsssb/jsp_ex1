<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<%@ page import="java.sql.*" %>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>

	<%@include file="../db.jsp" %>

	

	<% 

	

		ResultSet rs = null;

		try{

			rs = stmt.executeQuery("SELECT STU_NO, STU_NAME, STU_DEPT, DECODE(STU_GENDER,'M','남자','여자') AS GENDER FROM STUDENT");

			// 첫번째 학생의 이름, 학번 출력

			//rs.next(); 커서 이동

			//학번,이름,학과,성별(남자,여자)

			//테이블형태로

			

			out.println("<table border=1>");

			out.println("<tr>");

			out.println("<th>학번</th>");

			out.println("<th>이름</th>");

			out.println("<th>학과</th>");

			out.println("<th>성별</th>");

			out.println("</tr>");

			while(rs.next()) {

				out.println("<tr>");

				out.println("<td>");

				out.println(rs.getString("STU_NO"));

				out.println("</td>");

				out.println("<td>");

				out.println(rs.getString("STU_NAME"));

				out.println("</td>");

				out.println("<td>");

				out.println(rs.getString("STU_DEPT"));

				out.println("</td>");

				out.println("<td>");

				out.println(rs.getString("GENDER"));

				out.println("</td>");

				out.println("</tr>");

				out.println("<br>");

				

			}

			out.println("</table>");

			

			

			/*out.println(rs.getString("STU_NO"));

			rs.next();

			rs.next();

			out.println(rs.getString("STU_NAME"));

			out.println(rs.getString("STU_NO"));*/

			

		} catch(SQLException e) {

			out.println("오류 발생!");

		}

	

	%>

</body>

</html>