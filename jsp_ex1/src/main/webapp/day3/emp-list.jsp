<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	 text-align: center;
	}
</style>
</head>
<body>
	<%@include file="../db.jsp" %>
	
	<table>
		<tr>
		 <th>사번</th>
		 <th>이름</th>
		 <th>급여</th>
		 <th>급여등급</th>
		 <th>팀장(사수)</th>
		 <th>부서명</th>
		</tr>
	
	
	<%
		try {
			
			ResultSet rs = stmt.executeQuery("SELECT E.EMPNO, E.ENAME, E.SAL, GRADE, E2.ENAME AS ENAME2, D.DNAME, E.DEPTNO FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO");
					
			while(rs.next()) {
		
	%>
	
		<tr>
			<td><%= rs.getString("EMPNO") %></td>
			<td><%= rs.getString("ENAME") %></td>
			<td><%= rs.getString("SAL") %></td>
			<td><%= rs.getString("GRADE") %></td>
			<td><a href="emp-t-chart.jsp?empNo=<%= rs.getString("EMPNO") %>"><%= rs.getString("ENAME2") %></a></td>
			<td><a href="emp-d-chart.jsp?deptNo=<%= rs.getString("DEPTNO") %>"><%= rs.getString("DNAME") %></a></td>
		</tr>
	
	<%
			} 
		}catch(SQLException e) {

				out.println("오류 발생!");

			}
	%>
	
	</table>
</body>
</html>
