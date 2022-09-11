<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>back</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>

한글 인코딩 테스트<br>

<%=request.getAttribute("all")%> 입니다. <br><hr>

혹은 <br>

${all} 로 받았습니다.


</body>
</html>
