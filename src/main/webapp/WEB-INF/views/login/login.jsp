<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라디오세상</title>
    <!-- css, javascript -->
    <link rel="stylesheet" type="text/css" href="css/import.css" />
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){

    $("#btnLogin").click(function(ev) {
        var id = $("#id").val();
        var password = $("#password").val();

        if (id == "") {
                ev.preventDefault();//submit 중지
                alert("아이디를 입력하세요");
                $("#id").focus(); //입력포커스 이동
            } else if (password == "") {
                ev.preventDefault();
                alert("비밀번호를 입력하세요");
                $("#password").focus();
            }
        }); // onlcik

    }); //onload
</script>


</head>
<body>
	<jsp:include page="../header.jsp" />
<div id="container">
    <div class="inner">
        <div class="login_wrap" method="post">
            <h1>LOG IN</h1>
            <form action="loginprocess" name="form1" method="post">
                <fieldset>회원가입 폼</fieldset>
                <input id="id" type="text" name="id" placeholder="Id">
                <input id="password" type="password" name="password" placeholder="Password">
                <a href="signin">Sign in</a>
                <input id="btnLogin" type="submit" value="Log in" style="background-color: #2186db;">
 				<c:if test="${message == 'error'}">
                <div  style="color:red;">아이디 또는 비밀번호가 일치하지 않습니다.
 					</div>
                </c:if>

            </form>
        </div>
    </div>
</div>
</body>
</html>
