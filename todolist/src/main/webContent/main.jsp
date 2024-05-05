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
.first, .second, .third {
	display: flex;
	margin-right: 10px;
 	width: 200px;
	height: 80px; 
	background-color: #2F4F4F;
	color: white;
 	align-items: center; 
	padding: 0px 50px;
	margin-top: 150px;
	
}

.addBtn {
	width: 150px;
	height: 40px;
	float: right;
	background-color: #00BFFF;
	font-weight: bold;
	color: white;
	border: none;
	cursor: pointer;
	margin-top: 100px;
}

.li{
	list-style: none;
	width: 300px;
	height: 110px;
	background-color: 99FFCC;
	align-items: center; 
}

.title {
	font-weight: bold;
}

.content {
	margin-top: 5px;
	
}

.card {
	width: 300px;
	height: 110px;
	border: 1px solid gray;
	margin-bottom: 2px;
}

.nextBt {
	font-size: 15px;
	font-weight: bold;
	float: right;
	margin-right: 5px;
}

.section{
	justify-content: center;
	align-items: center;
}

.txt {
	padding: 10px 10px 10px 10px;
}
</style>
</head>
<body>
  <div class="section">		
	<button type="button" id="addTodo" class="addBtn">새로운 TODO 등록</button>

	<div class="list">
		<div class="todo"><span class="first">TODO</span><br>
			<div class="content">
				<c:forEach items="${list}" var="item">
					<div class="card">
					 	<div class="txt">
							${item.title }<br>
							${item.regDate } , &nbsp; ${item.name } , 우선순위 ${item.sequence }
						</div>
						<button class="nextBt" onclick="updateType('${item.type}', '${item.id}')">→</button>
					</div><br>
				</c:forEach>	
			</div>
		</div>
		<div class="doing"><span class="second">DOING</span></div>
		<div class="done"><span class="third">DONE</span></div>
	</div>
  </div>
</body>
<script type="text/javascript">
	var event = document.querySelector("#addTodo");
	event.addEventListener("click", function(e){
	var target = e.target;
	window.location.href = "/todolist/todo";
		
	})
	

	function updateType(type, id){
		
		console.log(type);
		console.log(id);
		
		var type = encodeURIComponent(type);
		var id = encodeURIComponent(id);
				
		var xhr = new XMLHttpRequest();
		
		xhr.open("POST", "/todolist/type", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		var params = "type=" + type + "&id=" + id;
		xhr.send(params);
	}

</script>
</html>
