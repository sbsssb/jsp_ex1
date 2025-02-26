<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
            width: 800px;
            margin-bottom: 10px;
        
        }

table, tr, th, td {
            text-align: center;
            border : 2px solid #bbb;
            border-collapse: collapse;
            padding : 5px;
        }
        .t-margin {
        	margin-top: 10px;
        }
        .t-margin th{
            background-color: azure;
            color : black;
        }
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	
	<form action="product-delete.jsp">
	
		<%
			String itemNo = request.getParameter("itemNo");
			
			try{
				
				ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_PRODUCT P"
									+ " LEFT JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO" 
									+ " WHERE P.ITEM_NO = '" + itemNo + "'");
				
	
				if(rs.next()){
					
		
		%>
				<div id="container">
					<table>
	                    <tr>
	                        <th>제품명</th>
	                        <td><%= rs.getString("ITEM_NAME") %></td>
	                    </tr>
	                    <tr>
	                        <th>가격</th>
	                        <td><%= rs.getString("PRICE") %></td>
	                    </tr>
                    </table>
				</div>
				<input type="button" value="수정" onclick="fnUpdate()">
				<input type="submit" value="삭제">
				
				<div class="t-margin">
            		<table id="comment-table">
		<% 
			do {
	    %>
	        	
            			<tr>
		                    <th>리뷰</th>
		                    <th>평점</th>
		                </tr>
		                
	                    <tr>
	                        <td><%= rs.getString("CONTENTS") %></td>
	                        <td><%= rs.getString("SCORE") %>점</td>
	                    </tr>
	                
	   <%
				} while(rs.next());
			
			%>
					 </table>
		        </div>
		
		<%
	        
	                
		
				} 
			} catch(SQLException e) {
		
				out.println("오류 발생");
		
			}
		
		%>
		
		
		<input name="itemNo" value="<%= itemNo %>" hidden>
	</form>
</body>
</html>

<script>
	function fnUpdate() {
		alert("현재 수정은 불가능합니다.")
		location.href="product-list.jsp";
	}
</script>