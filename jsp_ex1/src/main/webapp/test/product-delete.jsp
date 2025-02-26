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
		String itemNo = request.getParameter("itemNo");
		
		try {
			
			int result = stmt.executeUpdate("DELETE FROM TBL_PRODUCT WHERE ITEM_NO='" + itemNo + "'");
			
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