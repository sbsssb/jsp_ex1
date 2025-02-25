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
		out.println(stuId);
		
		try {
			
			int result = stmt.executeUpdate("DELETE FROM TBL_STULIST WHERE STU_ID='" + stuId + "'");
			
			if(result >= 1) {
				
				out.print("삭제되었습니다.");
				
			} else {
				
				out.print("삭제 실패");
				
			}
			
		} catch (SQLException e) {
			out.println("오류 발생");
		}
		
	%>

</body>
</html>