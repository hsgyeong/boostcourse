<%@page import="kr.or.connect.todolist.dao.TodoDao"%>
<%@page import="kr.or.connect.todolist.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header {
	display: flex;
	margin-top: 50px;
	justify-content: space-between;
}

h1 {
	transform: rotate(-35deg);
	color: #008080;
	font-weight: bold;
}

.addBtn {
	justify-content: flex-end;
	width: 280px;
	height: 40px;
	background-color: #00BFFF;
	color: white;
	border-color: none;
	margin-right: 180px;
	font-size: 15px;
	font-weight: bold;
	border: none;
	cursor: pointer;
}

.container {
	display: flex;
	justify-content: center;
}

.title {
	width: 430px;
	height: 80px; 
	margin-bottom: 10px;
	margin-right: 10px;
	align-items: center;
	vertical-align: middle;
	font-weight: bold;
	background-color: #008080;
	color: white;
	display: flex;
	font-family: sans-serif;
	font-size: 25px;
}

li {
	list-style: none;
	width: 430px;
	height: 130px;
	margin-bottom: 10px;
	background-color: #ADD8E6;
}

.nextBtn { 
	float: right;
	margin-right: 20px;
	margin-left: 40px;
}

.todoTitle, .doingTitle, .doneTitle {
	margin-left: 20px;
}

p {
	margin-left: 20px;
}

.item {
	margin-left: 38px;
	font-size: 20px;
	font-weight: bold;
	margin-top: 80px;
}

li {
	padding: 50px 0px 0px 0px;
	align-items: center;
	justify-content: space-between;
}

.content {
	align-items: center;
	display: flex;
	margin-left: 15px;
}

.card { 
	align-items: center;
}
</style>
</head>
<body>
  	<header>	
	  	<h1><span class="todo">나의 해야 할 일들</span></h1>
		<button type="button" id="addTodo" class="addBtn">새로운 TODO 등록</button>
	</header>
	<div class="container">
		<div id="TODO" class="main">
			<div class="title"><span class="todoTitle">TODO</span></div>
			<div class="card"> 
				 <c:forEach items="${todoList }" var="item">
					<li id="${item.id }">
						<span class="item">${item.title }</span><br>
						<div class="content">
							<p>등록날짜: ${item.regDate }, ${item.name }, 우선순위 ${item.sequence }  <button class="nextBtn" style="height: 25px;" onclick="updateType('TODO', '${item.id }');">→</button></p>
						</div>
					</li>
				</c:forEach>
			</div>	
		</div>		 
		<div id="DOING" class="main">
			<div class="title"><span class="doingTitle">DOING</span></div>				 
			<div class="card">	 
				 <c:forEach items="${doingList }" var="item">
					<li id="${item.id }">
						<span class="item">${item.title }</span><br>
						<div class="content">
							<p>등록날짜: ${item.regDate }, ${item.name }, 우선순위 ${item.sequence } <button class="nextBtn" onclick="updateType('DOING', '${item.id }');">→</button></p>
						</div>
					</li>
				</c:forEach>
			</div>	
		</div>
		<div id="DONE" class="main">		 
			<div class="title"><span class="doneTitle">DONE</span></div>	
			<div class="card">	
				<c:forEach items="${doneList }" var="item">
					<li id="${item.id }">
						<span class="item">${item.title }</span><br>
						<div class="content">
							<p>등록날짜: ${item.regDate }, ${item.name }, 우선순위 ${item.sequence } <button class="nextBtn" onclick="updateType('DONE', '${item.id }');">→</button></p>
						</div>
					</li>
				</c:forEach>
			</div>	
		</div>		
	</div>		
</body>
<script type="text/javascript">
	var event = document.querySelector("#addTodo");
	event.addEventListener("click", function(e){
	var target = e.target;
	
	var xhr = new XMLHttpRequest();
	
	xhr.open("GET", "/todolist/todo", true);
	xhr.send();
	
	window.location.href = "/todolist/todo";
		
	});
	
	function updateType(type, id){
		
		console.log(type);
		console.log(id);
		
		var xhr = new XMLHttpRequest();
		
		var selectType = (type === 'TODO') ? 'DOING' : 'DONE';
		
		xhr.addEventListener("load", function(){
			if(xhr.status === 200){
				console.log("success");
				var parent = document.getElementById(selectType);
				var item = document.getElementById(id);
				if(selectType === 'DOING'){
					var button = "<input class=\"main-content-btn\" type=\"button\" onclick=\"updateType(" + selectType + ", \'" + id + "\');\" value=\"→\"/>";
					item.insertAdjacentHTML('beforeEnd', button);
				}
				parent.appendChild(item);
			}
		});
		
		xhr.open("POST", "/todolist/type", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		var params = "type=" + type + "&id=" + id;
		xhr.send(params);
	};
	
</script>
</html>
