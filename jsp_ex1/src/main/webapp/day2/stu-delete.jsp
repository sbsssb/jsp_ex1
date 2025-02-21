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
		// 1. db 연결(include)
		// 2. try~catch()
		// 3. statement 객체에서 executeUpdate() 함수를 통해 쿼리 호출
		// 4. 리턴 값이 1 이상이면 삭제된 것.
		
		String stuNo = request.getParameter("stuNo");
		out.println(stuNo);
		
		try {
			
			int result = stmt.executeUpdate("DELETE FROM STUDENT WHERE STU_NO='" + stuNo + "'");
			
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