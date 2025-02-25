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
	
	
		<%
			String stuId = request.getParameter("stuId");
			
			try {
				
				int result = stmt.executeUpdate("UPDATE TBL_STULIST SET STU_DEPT = '소프트웨어' WHERE STU_ID='" + stuId + "'");
				
				if(result >= 1) {
					
					out.print("수정되었습니다.");
					
				} else {
					
					out.print("수정 실패");
					
				}
				
			} catch (SQLException e) {
				out.println("오류 발생");
			}
		%>
		
	
</body>
</html>