<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라디오세상</title>
<link rel="stylesheet" href="${path}/css/comment.css">
<link rel="stylesheet" href="${path}/css/oneboard.css">
<link rel="stylesheet" type="text/css" href="css/import.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script src="${path}/js/jquery-3.6.0.min.js" ></script>
<script>

$(document).ready(function(){			
	const id = '${sessionScope.id}';
	const password = '${sessionScope.password}';
	const secret = '${oneBoard.secret}';
	const boardseq = '${oneBoard.seq}';

	if(secret == '1') {
		$("#secretForm").attr("hidden", false);
		$("#pwBtn").on("click", function() {
			if($("#pw").val() == <%=session.getAttribute("password")%>) {
				$("#nonSecret").attr("hidden", false);
				$("#secretForm").attr("hidden", true);	
			}else {
				alert("비밀번호가 다릅니다.");
			}
		})
	}else if(secret == '0') {
		$("#nonSecret").attr("hidden", false);
		$("#secretForm").attr("hidden", true);
	}
	
	$("#edit").on("click", function(e) {
		if(id != '${oneBoard.writer}') {
			e.preventDefault();
			alert("본인만 수정 가능합니다.");
		}
	});
	
	$("#delete").on("click", function(e) {
		if(id != '${oneBoard.writer}') {
			e.preventDefault();
			alert("본인만 삭제 가능합니다.");
		} else{
			if(!confirm("게시물을 삭제하시겠습니까?")){
				e.preventDefault();
			} else{ alert("게시물 삭제가 완료되었습니다.")}
		}
	});


	// 추천
	$("#like_btn").on("click", function(e){
	     $.ajax({
	            type : "POST",  
	            url : "/board/like",
	            dataType : "json",   
	            data : {'boardseq' : boardseq, 'memberid' : id },

	            success : function(resp) {
	            if(resp.result == 0){
                	alert("추천완료.");
                	$("#like_btn").html("추천취소")
                }
                else if (resp.result == 1){
                 alert("추천취소");
             	$("#like_btn").html("추천")
                }

	            $("#likediv").html(resp.result2);
	            
		     } 
	     }); // ajax 
	}); // onclick
});
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div id="secretForm" hidden="true">
		<div class="container">
			<h1>비밀글 입니다</h1>
			암호 : <input type="password" id="pw"><br>
			<input type="button" value="입력" id="pwBtn">
		</div>
	</div>
	<div id="nonSecret" hidden="true">
		<div class="container">
		 <div class="inner">
			<h1>라디오 사연 게시판</h1>
				<table class="boardTable" >
				   	<thead>
						  <tr>
						      <th>No.${oneBoard.seq}</th>
						      <th class="boardTitle">${oneBoard.title}</th>
						      <th>조회수 ${oneBoard.viewCount}</th>
						  </tr>
				    </thead>
			  		<tbody>
			  			<tr>
					      <td class="writerId">작성자 ${oneBoard.writer}</td>
					      <td class="writingTime">${oneBoard.writingTime}</td>
			  			</tr>
					    <tr>
					      <td class="boardContents">${oneBoard.contents}</td>
					    </tr>
				     </tbody>
				</table>
			</div>
		</div>
		
		<div class="btnContainer">
			<span class="likeSpan">좋아요</span>  
			<div id="likediv">
				${oneBoard.likeCount}
			</div>
			<form>
				<button type="button" id="like_btn" >추천</button>
			</form>


			<form action="/editBoard/${oneBoard.seq}">
			  <input id="edit" type="submit" name="edit" value="수정하기">
			</form>
			<form action="/deleteBoard/${oneBoard.seq}">
			  <input id="delete" type="submit" name="delete" value="삭제하기">
			</form>
		</div>
		
		<jsp:include page="../comment/commentForm.jsp">
			<jsp:param name="seq" value="${oneBoard.seq}" />
			<jsp:param name="writer" value="${oneBoard.writer}" />
		</jsp:include>
		
		<div class='linkContainer'>
			<a href="/boardList">게시판 이동</a>
			<a href="/">홈으로</a>
		</div>
	</div>
</body>
</html>