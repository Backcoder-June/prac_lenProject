<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라디오세상</title>
<link rel="stylesheet" href="css/writingForm.css">
<script src="jquery-3.6.0.min.js" ></script>
<script>
$(document).ready(function(){
});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container">
		<h1 class="title"> 게시물 작성 </h1>
		
		<form class="writingForm" action="/writingBoard" method="post">
			<table>
				<tr><th>제목</th><td><input type ='text' name = 'title'></td></tr>
				<tr><th>내용</th><td><textarea name = 'contents' rows=5 cols=50></textarea></td></tr>
				<tr><th>작성자</th><td><input type ='text' name = 'writer'
				value="${sessionScope.id}" readonly></td></tr>
				<tr><th>비밀글</th><td><input type ="checkbox" name = 'secret' value = 1></td></tr>
			</table>
		    <input class="writingBtn" type="submit" value="작성">
		</form>

	</div>
</body>
</html>