<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="item" action="product-insert.jsp">
		<div>
			제품 이름 : <input name="itemName">
			<input type="button" value="중복 체크" onclick="fnName()">
		</div>
		<div>
			가격 : <input name="price">
		</div>
		<div>
			<input type="button" value="저장" onclick="fnItemInsert()">
		</div>
	</form>
</body>
</html>

<script>
	let checkFlg = false;
	
	function fnItemInsert() {
		let item = document.item;
		
		if(!checkFlg) {
			alert("중복 체크를 해 주세요.");
			return;
		}
		
		if(item.itemName.value =="" || item.price.value =="") {
			alert("모든 값을 입력해 주세요");
			return;
		}
		
		if(item.price.value.length <= 0) {
			alert("가격은 양수로 입력해 주세요");
			return;
		}
		
		item.itemName.disabled = false;
		item.submit();
		
	}
	
	function fnName() {
		let item = document.item;
		
		window.open('name-check.jsp?itemName='+item.itemName.value, '팝업창', 'width=300, height=300');
	}
	
	function getReturn(flg) {
		console.log(flg);
		if(flg == "N") {
			let target = document.item.itemName;
			checkFlg = true;
			target.disabled = true;
		}
	}
</script>