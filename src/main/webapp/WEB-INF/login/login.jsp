<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>T-CAR 카셰어링</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="#">T-CAR</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<!-- <li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
					-->
					<li class="nav-item"><a class="nav-link" href="/policy">T-CAR 서비스 정책</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<span class="login100-form-title p-b-33"> Account Login </span>

				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" id="userId" name="id" placeholder="ID" maxlength="10" onkeyup="enterkey();">
					<span class="focus-input100-1"></span> <span
						class="focus-input100-2"></span>
				</div>

				<div class="wrap-input100 rs1 validate-input"
					data-validate="Password is required">
					<input class="input100" type="password" id="pw" name="pw" onkeyup="enterkey();"
						placeholder="Password" maxlength="16"> <span class="focus-input100-1"></span>
					<span class="focus-input100-2"></span>
				</div>

				<div class="container-login100-form-btn m-t-20">
					<button type="button" class="login100-form-btn" id="login" onclick="login();">Sign in</button>
				</div>
				
				<!-- <div class="text-center p-t-45 p-b-4">
					<span class="txt1"> Forgot </span> <a href="#" class="txt2 hov1">
						Username / Password? </a>
				</div> -->

				<div class="text-center p-t-45 p-b-4">
					<span class="txt1"> Create an account? </span> <a href="/signup"
						class="txt2 hov1"> Sign up </a>
				</div>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>


</body>
</html>


<script>
	
	//엔터키로 로그인
	function enterkey() {
	    if (window.event.keyCode == 13) {
	
	         // 엔터키가 눌렸을 때 실행할 내용
	         login();
	    }
	}
	
	//로그인 버튼 클릭
	function login(){
		var userId = $("#userId").val();
		var pw = $("#pw").val();
		
		//데이터베이스 id, pw 체크
		$.ajax({
			type : "POST",
			url : "logincheck",
			data : {userId, pw},
			async : true,
			success : function(data) {
				console.log(data);
				if(data==1){ //로그인에 성공했을 경우 rental 페이지로 이동.
					location.href="/rental";
				}else{ //로그인에 실패했을 경우
					alert("아이디와 비밀번호를 다시 확인해주시기 바랍니다.");
					$("#userId").focus();
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
		
	};
</script>