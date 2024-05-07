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
body, .all {
	position: relative;
}

header {
	position: relative;

}

.new {
	position: relative;
	text-align: right;
	width: 675px;
}

.top {
	display: inline-block;
	margin-left: 190px;
	transform: rotate(-35deg);
	font-size: 24px;
	font-weight: bold;
	color: #008080;
	margin-top: 100px;
}

.part {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100px;
	/* min-height: 200px; */
	width: 350px;
	flex-direction: column;
	vertical-align: middle;
	margin-right: 10px;
	border: 1px solid red;
	
}

.part > div {
	margin-right: 10px;
}

.todoTitle, .doingTitle, .doneTitle {
	position: relative;
	display: inline-block;
	align-items: center;
	width: 100%;
	height: 100%;
	font-weight: bold;
	color: white;
	font-family: 'Malgun Gothic';
	background-color: #008080;
	font-size: 24px; 
	vertical-align: middle;
	flex-direction: column; 
	margin-left: 10px;
}
.addBtn {
	width: 150px;
	height: 30px;
	background-color: #00BFFF;
	font-weight: bold;
	color: white;
	border: none;
	cursor: pointer;
	position: absolute;
	margin-left: 345px;
	margin-top: -50px;
}

.nextBtn {
	float: right;
}

.allSection {
	display: flex;
	align-items: stretch;
	justify-content: center;
}

h3 {
	font-weight: bold;
}

ul {
  display: flex;
  flex-direction: column; 
  width: 350px;
  list-style-type: none; 
  padding: 0; 
  border: 1px solid gray;
  margin-top: 10px;
}

.firstSection, .secondSection, .thirdSection {
	flex-direction: column;
}
</style>
</head>
<body>
  <div class="all">	
  	<header>	
	  	<span class="top">나의 해야 할 일들</span>
	</header>
	<div class="new">
		<button type="button" id="addTodo" class="addBtn">새로운 TODO 등록</button>
	</div>
	<div class="allSection">	
		<div class="firstSection">
			<div class="part">
				<div class="todoTitle">TODO</div>
			</div>	
			<ul id="todo">
				<c:forEach items="${todoList }" var="todo">
					<li id="${todo.id }">
						<h3>${todo.title }</h3>
						<p>등록날짜: ${todo.regDate }, ${todo.name }, 우선순위 ${todo.sequence }</p>
						<button class="nextBtn" onclick="updateType('${todo.type}, ${todo.id }')">→</button>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="secondSection">
			<div class="part">
				<div class="doingTitle">DOING</div>
			</div>
			<ul id="doing">
				<c:forEach items="${doingList }" var="doing">
					<li id="${doing.id }">
						<h3>${doing.title }</h3>
						<p>등록날짜: ${doing.regDate }, ${doing.name }, 우선순위 ${doing.sequence }</p>
						<button class="nextBtn" onclick="updateType('${doing.type}, ${doing.id }')">→</button>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="thirdSection">
			<div class="part">
				<div class="doneTitle">DONE</div>
			</div>	
				<ul id="done">
				<c:forEach items="${doneList }" var="done">
					<li id="${done.id }">
						<h3>${done.title }</h3>
						<p>등록날짜: ${done.regDate }, ${done.name }, 우선순위 ${done.sequence }</p>
						<button class="nextBtn" onclick="updateType('${done.type}, ${done.id }')">→</button>
					</li>
				</c:forEach>
			</ul>
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
		
		xhr.open("POST", "/todolist/type", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		var params = "type=" + type + "&id=" + id;
		xhr.send(params);
	};

</script>
</html>
