<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function howMany(selectObject){
	var numberSelected = 0;
	for(var i=0; i<selectObject.options.length; i++){
		if(selectObject.options[i].selected){
			numberSelected++;
		}
	}
	return numberSelected;
}
</script>
<body>

</body>
</html>