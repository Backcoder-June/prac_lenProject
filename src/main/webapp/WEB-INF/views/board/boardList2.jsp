<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라디오세상</title>
    <!-- Meta Tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="expire" content="-1" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
    <link rel="stylesheet" type="text/css" href="css/import.css" />
    <link rel="stylesheet" type="text/css" href="css/common.css" />
	<script src="js/jquery-3.6.0.min.js"></script>

	<script>
$(document).ready(function(){

});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<br>
	<div id="container">
	 <div class="inner">
        <h1>라디오 사연 게시판</h1>
        <div class="table">
	<table >
		<colgroup>
   		<col width="100px"><col width=""><col width="150px"><col width="180px"><col width="100px">
   	</colgroup>
   	<thead>
	  <tr>
	    <th>번호</th>
	    <th>제목</th>
	    <th>작성자</th>
	    <th>조회수</th>
	  </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${boardlist}" var="board" >
	    <tr>
	      <th>${board.seq}</th>
	      <td><a href="board/${board.seq}">${board.title}</a></td>
	      <td>${board.writer}</td>
	      <th>${board.viewCount}</th>
	    </tr>
	  </c:forEach>
	  </tbody>
	</table>
	<div style="text-align: right;">
		<button 
		style="border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;
		margin: 3px;padding: 5px;border: 1px solid skyblue;background-color: rgba(0,0,0,0);color: skyblue;">
			<a href='writingBoard'>글쓰기</a>
		</button>
	</div>
	<form action="/miniproject/searchboard">
		<select name="item">
			<option value="seq">번호</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>
			<option value="writer">작성자</option>
		</select>
	
	 : <input type="text" name="search" style="width: 250px;height: 30px; margin: 5px">
		<input type="submit" value="검색" style="width: 80px;height: 35px;  margin: 5px">
	</form>
		</div>
	</div>
</div>
	<br>
	<hr>
	<div style="text-align: center;">
		<button>
			<a href='/home'>홈으로</a>
		</button>
	</div>
</body>
</html>