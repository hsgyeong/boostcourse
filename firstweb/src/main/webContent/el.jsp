<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "홍길동");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

요청 URI : ${pageContext.request.requestURI } <br>   <!--pageContext.getRequest().getRequestURI()-->
request의 name 속성 : ${requestScope.name } <br>		<!--request.getAttribute("name")-->
code의 파라미터 : ${param.code }						<!--request.getParameter("code")-->

</body>
</html>