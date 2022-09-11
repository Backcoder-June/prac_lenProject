<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라디오세상</title>
<link rel="stylesheet" href="${path}/css/writingForm.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){

  $("#editbtn").on("click", function (e){
    if(!confirm("게시글을 수정하시겠습니까?")){
      e.preventDefault();
    }else {alert("수정이 완료되었습니다.")}



  });


  // 비밀글 체크박스 유지
	const check = '${editTarget.secret}';
	if(check == '1') {
		$("#check").attr("checked", "checked");
	}
});
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container">
		<h1 class="title"> 게시물 수정 </h1>

<form class="writingForm" action="/editBoard/${editTarget.seq}" method="post">
  <table border = 5>
    
    <tr><th>번호</th><td><input type ='text' name = 'seq' value="${editTarget.seq}" readonly></td></tr>
    <tr><th>제목</th><td><input type ='text' name = 'title' value="${editTarget.title}"></td></tr>
    <tr><th>내용</th><td><textarea name = 'contents' rows=5 cols=50>${editTarget.contents}</textarea></td></tr>
    <tr><th>작성자</th><td><input type ='text' name = 'writer' value="${editTarget.writer}" readonly></td></tr>
    <tr><th>비밀글</th><td><input type ="checkbox" name = 'secret' id="check" value="0"></td></tr>
  </table>

  <input type="hidden" name="writingTime" value="${editTarget.writingTime}">
  <input type="hidden" name="viewCount" value="${editTarget.viewCount}">
  <input class="writingBtn" type="submit" value="수정" name="edit" id="editbtn">
</form>

<br>
    </div>
</body>
</html>