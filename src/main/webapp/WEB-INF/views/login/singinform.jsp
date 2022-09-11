<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    
<title>라디오세상</title>
<script src="js/jquery-3.6.0.min.js" ></script>
<script>
$(document).ready(function(){

    let check = 0;
$("#idChk").on("click", function(){
	//alert(this.value);
	//ajax 방식 요청
	$.ajax({
		url : '/idChk',
		data : {'id':$("#id").val()},
		type : 'post',
		dataType: 'json', 
		success : function(server){ 
		if(server == 0){
            check = 0;
			alert("사용가능한 아이디입니다");
		}
		else if(server == 1){
            check = 1;
			alert("중복된 아이디입니다.");
		}
		}//success 
	});//ajax
});//on

$("#signbtn").on("click", function(e){
    if (check == 1) {
        e.preventDefault();
        alert("중복된 아이디입니다.")
    }else if( $("#id").val()!="" && $("#password").val()!="" && $("#name").val()!="" &&
        $("#email").val()!="" && $("#phone").val()!=""){
        alert("라디오 세상에 오신걸 환영합니다!");
    } else { e.preventDefault();
        alert("정보를 모두 입력해주세요!");
    }

}); // onclick




});//ready

</script>
</head>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
<div id="container">
    <div class="inner">
        <div class="signup_wrap">
            <h1>Sign Up</h1>
            <form action="signin" method="post">
                <label>아이디</label>
                <input type="text" id="id" name="id" placeholder="ID">
                <input type="button" id="idChk" value="중복체크">
                <label>비밀번호</label>
                <input type="password" id="password" name="password" placeholder="Password">
                <label>이름</label>
                <input type="text" id="name" name="name" placeholder="이름">
                <label>폰번호</label>
                <input type="text" id="phone" name="phone" placeholder="010-1234-5678">
                <label>이메일</label>
                <input type="email" id="email" name="email" placeholder="Email">
                <input id="signbtn" type="submit" value="가입하기" style="background-color:#2186db;">
            </form>
        </div>
    </div>
</div>
</body>
</html>
