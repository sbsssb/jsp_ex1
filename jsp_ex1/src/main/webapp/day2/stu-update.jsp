<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	
	<form action="stu-update-result.jsp">
	
	
		<%
			String stuNo = request.getParameter("stuNo");
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM STUDENT WHERE STU_NO='" + stuNo +"'");
			
			if(rs.next()) {
		%>
		
		<input name="stuNo" value="<%= stuNo %>" hidden>
	
		<div>
			이름 : <input name="stuName" value="<%= rs.getString("STU_NAME") %>">
		</div>
		<div>
			학과 : <input name="stuDept" value="<%= rs.getString("STU_DEPT") %>">
		</div>
		
		<% } %>
		
		<input type="submit" value="저장">
		
	</form>
	
</body>
</html>