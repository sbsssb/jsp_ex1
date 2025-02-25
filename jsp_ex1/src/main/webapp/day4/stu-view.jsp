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
			String stuId = request.getParameter("stuId");
			
			try{
				
				ResultSet rs = stmt.executeQuery("SELECT S.STU_ID, STU_NAME, STU_DEPT, SUBJECT, GRADE"
						+ " FROM TBL_STULIST S"
						+ " LEFT JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID"
						+ " WHERE S.STU_ID ='" + stuId + "'");
				
	
				if(rs.next()){
					
		
		%>
	
				<div>
					이름: <%= rs.getString("STU_NAME") %>
				</div>
				<div>
					학과: <%= rs.getString("STU_DEPT") %>
				</div>
		<% 
			do {
	    %>
	                
	                    <div>
	                        과목명: <%= rs.getString("SUBJECT") %>
	                    </div>
	                    <div>
	                        점수: <%= rs.getString("GRADE") %>점
	                    </div>
	                
	   <%
	                } while(rs.next());
	        
	                
		
				} 
			} catch(SQLException e) {
		
				out.println("오류 발생");
		
			}
		
		%>
		
		<input name="stuId" value="<%= stuId %>" hidden>
		<input type="submit" value="수정">
		<input type="button" value="삭제" onclick="fnRemove('<%= stuId %>')">
	</form>
</body>
</html>

<script>
	function fnRemove(stuId) {
		location.href="stu-remove.jsp?stuId=" + stuId;
	}
</script>