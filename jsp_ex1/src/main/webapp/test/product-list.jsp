<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<%@ page import="java.sql.*" %>

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
	
	a {
		text-decoration: none;
		color: black;
	}
</style>

</head>

<body>

	<%@include file="../db.jsp" %>
	
	<div style="margin-bottom: 10px;">
	<input id="keyword" placeholder="검색어" value="">
	<button onclick="fnSearch()">검색</button>
	</div>

	<table>

		<tr>
		
			<th>번호</th>

			<th>이름</th>

			<th>가격</th>

			<th>평점</th>

		</tr>



	

	<% 
	
	String keyword = "";

	if(request.getParameter("keyword") != null){
		
		keyword = request.getParameter("keyword");
	
	}
	
	ResultSet rs = null;
	String query = "SELECT P.ITEM_NO, ITEM_NAME, PRICE, DECODE(AVG(SCORE), NULL, '평점없음', ROUND(AVG(SCORE),2)) AS AVG_SCORE"
			+ " FROM TBL_PRODUCT P"
			+ " LEFT JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO"
			+ " WHERE ITEM_NAME LIKE '%" + keyword + "%'"
			+ " GROUP BY P.ITEM_NO, ITEM_NAME, PRICE"
			+ " ORDER BY ITEM_NO";

		try{

			rs = stmt.executeQuery(query);	

			while(rs.next()) {
				
				String itemNo = rs.getString("ITEM_NO");

				%>

				<tr>

					<td><%= itemNo %></td>

					<td>
						<a href="product-view.jsp?itemNo=<%= rs.getString("ITEM_NO") %>"><%= rs.getString("ITEM_NAME") %></a >
					</td>

					<td><%= rs.getString("PRICE") %></td>

					<td><%= rs.getString("AVG_SCORE") %></td>

				</tr>

				

				<%

			}

			

		} catch(SQLException e) {

			out.println("오류 발생!");

		}

	

	%>

		</table>
		
		<div style="margin-top: 10px;"><input type="button" value="제품 추가" onclick="fnInsert()"></div>

		<input hidden id="paramKey" value="<%= keyword %>">
		
</body>

</html>

<script>

	let paramKey = document.querySelector("#paramKey").value;
	document.querySelector("#keyword").value = paramKey;
	
	
	function fnInsert() {
		location.href="product-insert.jsp";
	}
	
	function fnSearch() {
		let keyword = document.querySelector("#keyword").value;
		location.href="?keyword="+keyword;
	}
</script>