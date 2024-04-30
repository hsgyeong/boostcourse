<%@page import="kr.or.connect.todolist.dao.TodoDao"%>
<%@page import="kr.or.connect.todolist.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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

}
.todo, .doing, .done {
	display: flex;
	margin-right: 30px;
	width: 200px;
	height: 80px;
	background-color: #2F4F4F;
	color: white;
 	align-items: center; 
	padding: 0px 50px;
	margin-top: 150px;
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

.li{
	list-style: none;
	width: 200px;
	height: 80px;
	background-color: 99FFCC;
	align-items: center; 
}

.title {
	font-weight: bold;
}

.card {
	margin-top: 250px;
	flex-direction: column;
}
</style>
</head>
<body>
<button type="button" id="addTodo" class="addBtn">새로운 TODO 등록</button>

<div class="list">
	<div class="todo">TODO</div>
	<div class="doing">DOING</div>
	<div class="done">DONE</div>
</div>

</body>
<script type="text/javascript">
	var event = document.querySelector("#addTodo");
	event.addEventListener("click", function(e){
		var target = e.target;
		window.location.href = "/todolist/todo";
		
	})
</script>
</html>
