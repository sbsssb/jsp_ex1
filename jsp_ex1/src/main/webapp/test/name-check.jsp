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
	<%@ page import="java.sql.*" %>
	
	<form name="check">
	<%
			String itemName = request.getParameter("itemName");
			
			try{
				
				ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_PRODUCT WHERE ITEM_NAME='" + itemName + "'");
				
	
				if(rs.next()){
					out.println("이미 등록된 제품입니다.");
		
		%>
			<input name="flg" value="Y" hidden>
		<%
		
				}  else {
					out.println("등록 가능한 제품입니다.");
		%>
			<input name="flg" value="N" hidden>
		<%
				}
				
			} catch(SQLException e) {
		
				out.println("오류 발생");
		
			}
		
		%>
		<div>
			<input type="button" onclick="fnBack()" value="되돌아가기">
		</div>
	</form>
</body>
</html>

<script>
	function fnBack() {
		window.opener.getReturn(document.check.flg.value);
		window.close();
		
	}
</script>