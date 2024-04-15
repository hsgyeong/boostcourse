<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*
	스크립트릿에는 자바코드가 들어갈 수 있다.
	자바는 항상 모든 변수가 선언이 되어있어야지만 쓸 수 있다.
	하지만 out, request 등은 내장객체이기 때문에 그냥 사용이 가능하다. 우리가 따로 선언하거나 생성하지 않아도 쓸 수 있다.
*/
	StringBuffer url = request.getRequestURL();	

	out.print("url :" + url.toString());
	out.print("<br>");

/*
	jsp는 그냥 실행되는 것이 아니라 항상 servlet으로 바뀌어서 실행이 된다.
	jsp는 내장객체들이 존재하고 있기 때문에 핋요에 따라서 가져다가 쓸 수 있다.
*/	
%>
</body>
</html>