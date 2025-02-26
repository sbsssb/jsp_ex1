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
			학번 : <input name="stuNo">
			<input type="button" value="중복 체크" onclick="fnId()">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			성별:
			<input type="checkbox" name="gender" value="M">남자
			<input type="checkbox" name="gender" value="F">여자
		</div>
		<div>
			<input type="button" value="저장" onclick="fnStuInsert()">
		</div>
	</form>
</body>
</html>

<script>
	let checkFlg = false;
	
	function fnStuInsert() {
		let stu = document.stu;
		
		if(!checkFlg) {
			alert("중복 체크를 해 주세요.");
			return;
		}
		
		if(stu.stuNo.value.length != 8) {
			alert("학번은 8글만 입력해 주세요");
			return;
		}
		if(stu.stuName.value =="" || stu.stuDept.value =="") {
			alert("모든 값을 입력해 주세요");
			return;
		}
		
		stu.stuNo.disabled = false;
		stu.submit();
		
	}
	
	function fnId() {
		let stu = document.stu;
		
		window.open('id-check.jsp?stuNo='+stu.stuNo.value, '팝업창', 'width=300, height=300');
	}
	
	function getReturn(flg) {
		console.log(flg);
		if(flg == "N") {
			let target = document.stu.stuNo;
			checkFlg = true;
			target.disabled = true;
		}
	}
</script>