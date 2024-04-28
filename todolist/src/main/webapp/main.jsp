<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	display: flex;
	justify-content: center;
	align-items: center;
}

.list {
	display: flex;
	font-weight: bold;
	justify-content: center;
	align-items: center;
	position: relative;
}
.todo, .doing, .done {
	display: flex;
	margin-right: 30px;
	margin-top: 150px;
	width: 200px;
	height: 80px;
	background-color: #2F4F4F;
	color: white;
 	align-items: center; 
	padding: 0px 50px;
}

.addBtn {
	position: absolute;
	width: 150px;
	height: 40px;
	right: 305px;
	margin-bottom: 30px;
	background-color: #00BFFF;
	font-weight: bold;
	color: white;
	border: none;
	cursor: pointer;
	
}
</style>
</head>
<body>

<button type="button" onclick="location.href='todoForm.jsp'" class="addBtn">새로운 TODO 등록</button>

<div class="list">
	<div class="todo">TODO</div>
	<div class="doing">DOING</div>
	<div class="done">DONE</div>
</div>
</body>
</html>
