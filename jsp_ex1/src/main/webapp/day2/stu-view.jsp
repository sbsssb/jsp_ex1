<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	
	<form action="stu-update.jsp">
	
		<%
			String stuNo = request.getParameter("stuNo");
			
			try{
				
				ResultSet rs = stmt.executeQuery("SELECT S.STU_NO, STU_NAME, STU_DEPT, STU_GRADE, ENR_GRADE "
						+ "FROM STUDENT S"
						+ " LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO"
						+ " WHERE S.STU_NO = '"
						+ stuNo + "'");
				
	
				if(rs.next()){
		
		%>
		
				<div>
					학번: <%= stuNo %>
				</div>
				<div>
					이름: <%= rs.getString("STU_NAME") %>
				</div>
				<div>
					학과: <%= rs.getString("STU_DEPT") %>
				</div>
				<div>
					학년: <%= rs.getString("STU_GRADE") %>학년
				</div>
				<div>
					점수: <%= rs.getString("ENR_GRADE") %>
				</div>
		
		<%
		
				} 
			} catch(SQLException e) {
		
				out.println("오류 발생");
		
			}
		
		%>
		
		<input name="stuNo" value="<%= stuNo %>" hidden>
		<input type="submit" value="수정">
	</form>
</body>
</html>