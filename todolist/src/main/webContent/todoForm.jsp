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

.title {
	margin-top: 80px;
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 50px;
	text-align: center;
}

.whoBox {
	width: 250px;
	height: 40px;
}

.contentBox {
	width: 500px;
	height: 40px;
}

.contentBox, .whoBox, .number {
	margin-top: 15px;
}

.content, .who, .ranking, .btns, #pre {
	margin-top: 50px;
}

.section {
	margin-top: 20px;
}

.number {
	margin-right: 20px;
}

.btns {
	float: right;
}

#delete {
	margin-left: 15px;
}

#pre {
	text-decoration: underline;
	font-weight: bold;
	background-color: white;
}
#delete, #submit, #pre{
	width: 130px;
	height: 40px;
	font-size: 16px;
	cursor: pointer;
}

#delete, #submit {
	background-color: #00bfff;
	color: white;
	border: none;
	font-weight: bold;
}
</style>
</head>
<body>
<div>
	<form action="todo" method="post">
		<header>
			<div class="title">할일 등록</div>
		</header>
		<section>
			<div class="section">
				<div  class="content">
					어떤일인가요?<br>
					<input type="text" class="contentBox" name="title" required="required" placeholder="swift 공부하기(24자까지)"
					maxlength="24">
				</div>
				<div class="who">
					누가 할일인가요?<br>
					<input type="text" class="whoBox" required="required" name="name" placeholder="김도리">
				</div>
				<div class="ranking">
					우선순위를 선택하세요<br>
					<span class="number"><input type="radio" name="sequence" value="1" required>1순위</span>
					<span class="number"><input type="radio" name="sequence" value="2">2순위</span>
					<span class="number"><input type="radio" name="sequence" value="3">3순위</span>
				</div>
			</div>
		</section>
		<button type="button" name="pre" id="pre" onclick="location.href='todolist'">&lt; &nbsp;이전</button>
		<div class="btns">	
			<button type="submit" id="submit" class="submit">제출</button>
			<button type="button" id="delete" class="delete">내용지우기</button>
		</div>
	</form>
</div>
<script type="text/javascript">
	var remove = document.querySelector("#delete");
	remove.addEventListener("click", function(e){
		var form = document.querySelector("form");
		var input = form.querySelectorAll("input");
		input.forEach(function(input){
			if(input.type==="radio"){
				if(input.checked){
					input.checked=false;
				}
			}else{
				input.value="";
			}
		});
	})
</script>
</body>
</html>