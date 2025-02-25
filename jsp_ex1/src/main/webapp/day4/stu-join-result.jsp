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
	<%@ include file="../db.jsp" %>
	<%
		try{
			
			String stuId = request.getParameter("stuId");
			String stuName = request.getParameter("stuName");
			String stuDept = request.getParameter("stuDept");
			String subject = request.getParameter("subject");
			String grade = request.getParameter("grade");
			
			String query = "INSERT INTO TBL_STULIST(STU_ID, STU_NAME, STU_DEPT)"
							+ " VALUES('" + stuId + "', '" + stuName + "', '" + stuDept + "')";
			
			String query2 = "INSERT INTO TBL_GRADE(STU_ID, SUBJECT, GRADE)"
							+ " VALUES('" + stuId + "', '" + subject + "', '" + grade + "')";
			
			int result = stmt.executeUpdate(query);
			int result2 = stmt.executeUpdate(query2);
				
			if( result != 0 && result2 != 0) {
				out.println("등록되었습니다.");
			} else {
				out.println("등록에 실패했습니다.");
			}
			
			
			
			
			
		} catch(SQLException e) {
			
			out.println("DB 오류");
			
		}
	%>
</body>
</html>