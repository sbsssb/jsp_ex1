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
			String stuNo = request.getParameter("stuNo");
			
			try{
				
				ResultSet rs = stmt.executeQuery("SELECT * FROM STUDENT WHERE STU_NO='" + stuNo + "'");
				
	
				if(rs.next()){
					out.println("사용 중인 학번");
		
		%>
			<input name="flg" value="Y" hidden>
		<%
		
				}  else {
					out.println("사용 가능");
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