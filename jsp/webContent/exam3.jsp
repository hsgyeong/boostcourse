<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- JSP 주석입니다. --%>

<!-- html 주석입니다. -->


<%

//자바 주석입니다.

/*
여러 줄에 걸친 자바 주석입니다.
*/

	for(int i=1; i<=5; i++){
%>
<h<%=i %>>아름다운 한글</h<%=i %>>
<%
	}
%>



<h1>아름다운 한글</h1>
<h2>아름다운 한글</h2>
<h3>아름다운 한글</h3>
<h4>아름다운 한글</h4>
<h5>아름다운 한글</h5>

</body>
</html>