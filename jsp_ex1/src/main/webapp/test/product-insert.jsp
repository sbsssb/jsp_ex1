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
			
			String itemName = request.getParameter("itemName");
			String price = request.getParameter("price");

			
			String query = "INSERT INTO TBL_PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, '" + itemName + "', '" + price + "')";
			
			
			int result = stmt.executeUpdate(query);
				
			if( result != 0) {
				out.println("등록되었습니다.");
				out.println("<button onclick='fnBack()'>되돌아가기</button>");
			} else {
				out.println("등록에 실패했습니다.");
			}
			
			
			
			
			
		} catch(SQLException e) {
			
			out.println("DB 오류");
			
		}
	%>
</body>
</html>

<script>

	function fnBack(){
		location.href = "product-list.jsp";
	}
	
</script>