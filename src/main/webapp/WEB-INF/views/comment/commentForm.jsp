<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/comment.css">
<script src="js/jquery-3.6.0.min.js" ></script>
<script>
$(function() {
	let sessionId = '<%= session.getAttribute("id") %>';
	let list = [];
	
	$.ajax({
		url: ${param.seq} + "/getAllComment",
		data: {seq: ${param.seq}},
		type: 'post',
		dataType:'json',
		success: function(res) {
			list = res;
			
			$.each(list,function(i, item) {
				$("#comment").append("<li></li>");
				$("#commentNum").html("댓글 " + (i + 1));
				
				$("#comment li:last-child").addClass("commentList" + i);
				$(".commentList" + i).append(
						"<span class='writer'>" + item.writer + "</span>"
						+ "<span class='date'>" + item.writingtime + "</span>"
						+ "<span class='isSecret'>" + (item.secret == 1 ? "비밀글입니다" : "") + "</span>"

						+ (item.secret == 1 && sessionId == item.writer ? "<p class='contents'>" + item.contents + "</p>"
								: (item.secret != 1 ? "<p class='contents'>" + item.contents + "</p>" : ""))
						
						+ "<input class='commentSeq' type='hidden' name='commentSeq' value=" + item.commentSeq +">"
						+ (sessionId == item.writer ? "<input class='updateBtn' type='button' value='수정'><input class='deleteBtn' type='button' value='삭제'>" : "")
				); 
			});
		},
		 error:function(request,status,error){
		/*	 alert(${param.seq});
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);*/
		 }
	})
})


$(document).ready(function(){
	$("#submitBtn").on("click", function() {
		let secret;
		let sessionId = '<%= session.getAttribute("id") %>';
		let seq = '<%= request.getParameter("seq") %>';

		if($("#contents").val() != '') {
			if($("#secretCheckBtn").is(":checked") == true) { secret = 1 } else { secret = 0 };


			$.ajax({
				url: ${param.seq}  + '/insertComment',
				data: {writer: sessionId, contents: $("#contents").val(), secret: secret, seq: seq},
				type: 'post',
				dataType:'json',
				success: function(res) {
					$("#comment").append("<li></li>");
					let listNum = document.querySelectorAll("#comment li").length;
					
					$("#comment li:last-child").addClass("commentList" + listNum);
					$(".commentList" + listNum).append(
							"<span class='writer'>" + res.writer + "</span>"
							+ "<span class='date'>" + res.writingtime + "</span>"
							+ "<span class='isSecret'>" + (res.secret == 1 ? "비밀글입니다" : "") + "</span>"
							
							+ (res.secret == 1 && sessionId == res.writer ? "<p class='contents'>" + res.contents + "</p>"
									: (res.secret != 1 ? "<p class='contents'>" + res.contents + "</p>" : ""))
							
							+ "<input class='commentSeq' type='hidden' name='commentSeq' value=" + res.commentSeq +">"
							+ (sessionId == res.writer ? "<input class='updateBtn' type='button' value='수정'><input class='deleteBtn' type='button' value='삭제'>" : "")
					); 
					$("#commentNum").html("댓글 " + listNum);
					$("#contents").val('');
				}
			})
		} else {
			alert("내용을 입력해 주세요.");
		}
	})
	
	$("#comment").on("click", "input", function(e) {
		if($(e.target).hasClass("updateBtn")) {						// 수정
			let contents = $(e.target).prevAll(".contents").text();
			let secret = $(e.target).prevAll(".isSecret").text();
			
			let isSecret;
			if(secret == "비밀글입니다") { isSecret = "checked" } else { isSecret = '' };
			
			if($(e.target).next().next().attr("id") == "#updateform") {
				return false;
			}
			
			$(e.target).parents("li").append(
					"<form id='#updateform'><textarea width='300px' id='updateContents' name='updateContents'>" + contents + "</textarea>"
					+ "<div class='commentBtn'><input class='completeBtn' type='button' value='완료'>"
					+ "<div class='secret'><span>비밀글 </span><input id='secretUpdateBtn' type='checkbox' name='updateSecret' " + isSecret + "></div></div></form>");
			
			
		} else if($(e.target).hasClass("completeBtn")) {		// 수정완료
			let updateSecret;
			if($("#secretUpdateBtn").is(":checked") == true) { updateSecret = 1 } else { updateSecret = 0 };
			
			$.ajax({
				url: ${param.seq} + '/updateComment',
				data: {updateContents: $("#updateContents").val(), updateSecret: updateSecret, commentSeq: $(".commentSeq").val() },
				type: 'post',
				dataType:'json',
				success: function(res) {
					$(e.target).parents("li").html(
							"<span class='writer'>" + res.writer + "</span>"
							+ "<span class='date'>" + res.writingtime + "</span>"
							+ "<span class='isSecret'>" + (res.secret == 1 ? "비밀글입니다" : "") + "</span>"
							+ "<p class='contents'>" + res.contents + "</p>"
							+ "<input class='commentSeq' type='hidden' name='commentSeq' value=" + res.commentSeq +">"
							+ "<input class='updateBtn' type='button' value='수정'>"
							+ "<input class='deleteBtn' type='button' value='삭제'>");
					
				}
			}) 
			
			
		} else if($(e.target).hasClass("deleteBtn")) {		// 삭제
			let commentSeq = $(e.target).prevAll(".commentSeq").val();
	
			$.ajax({
				url: ${param.seq} + '/deleteComment',
				data: {commentSeq: commentSeq },
				type: 'post',
				success: function(res) {
					$(e.target).parents("li").remove();
					
					let listNum = document.querySelectorAll("#comment li").length;
					$("#commentNum").html("댓글 " + listNum);
				}
			}) 
		} 
	})
});
</script>
<title>라디오세상</title>
</head>
<body>
	<div class="commentBox">
		<div id="commentNum">댓글 0</div>
			
		<form action="${param.seq}" method="post">
			<% if(session.getAttribute("id") != null) { %>
				<textarea placeholder="댓글을 작성해주세요." width="300px" id="contents" name="contents"></textarea>
	            <div class="commentBtn">
			        <input id="submitBtn" type="button" value="댓글달기">
	            	<div class="secret"><span>비밀글 </span><input id="secretCheckBtn" type="checkbox" name="secret"></div>
	    			<input id="boardSeq" type="hidden" name="boardSeq" value="${param.seq}">
	    			<input id="writer" type="hidden" name="writer" value="${param.writer}">
	    		</div>
    		<% } else { %>
				<textarea placeholder="로그인 후 작성해주세요." width="300px" readonly></textarea>
    		<% } %> 
    	</form>

    	<ul id="comment"></ul>
	</div>
</body>
</html>