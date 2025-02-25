<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="stu" action="stu-join-result.jsp">
		<div>
			학번 : <input name="stuId">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			과목: <input name="subject">
		</div>
		<div>
			점수: <input name="grade">
		</div>
		<div>
			<input type="button" value="저장" onclick="fnStuInsert()">
		</div>
	</form>
</body>
</html>

<script>
	
	function fnStuInsert() {
		
		let stu = document.stu;
		
		if(stu.stuId.value.length != 4) {
			alert("학번은 4글자만 입력해 주세요");
			return;
		}
		
		if(stu.grade.value > 100 || stu.grade.value < 0) {
			alert("점수는 0~100점 입력");
			return;
		}
		
		if(stu.stuName.value =="" || stu.stuDept.value =="" || stu.subject.value =="" || stu.grade.value =="") {
			alert("모든 값을 입력해 주세요");
			return;
		}
		
		stu.submit();
		
	}
	
</script>