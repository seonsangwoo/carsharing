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

<!-- 회원가입폼 CSS -->
<link href="css/signup.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="/login">T-CAR</a>
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
					<li class="nav-item"><a class="nav-link" href="#">로그인</a></li> -->
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div>
		<div class="wrap wd668">
			<div class="container2">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">회원가입</h2>
					<!-- <p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p> -->
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>아이디</span></th>
									<td><input type="text" id="userId" name="test" maxlength="10"
										placeholder="ID를 6~10자리를 입력하세요."><span id="idconfirm"></span></td>
									<td><input type="button" class="btn_confirm" id="idcheck"
										value="중복확인"></td>
								</tr>
								<tr>
									<th><span>이름</span></th>
									<td><input type="text" id="name" maxlength="5"
										placeholder="이름을 입력해주세요."></td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td><input type="password" id="pw1" maxlength="16"
										placeholder="비밀번호를  8~16자리를 입력해주세요."></td>
								</tr>
								<tr>
									<th><span>비밀번호 확인</span></th>
									<td><input type="password" id="pw2" maxlength="16"
										placeholder="비밀번호를 다시 입력해주세요"> <span id="pwcheck"></span>
									</td>
								</tr>
								<!-- <tr class="email">
									<th><span>이메일</span></th>
									<td><input type="text" class="email" id="email1" placeholder="email을 입력해주세요">
									<span class="mar10">@</span>
									<select class="email email2" id="email2" name="email2" style="width:140px; height:35px;">
										<option value="선택">선택</option>
										<option value="네이버">naver.com</option>
										<option value="다음">daum.net</option>
									</select>
									<input type="text" class="email email2">
									</td>
									<td><input type="button" class="btn_confirm" value="인증하기"></td>
								</tr> -->
								<tr>
									<th><span>주소</span></th>
									<td><input type="text" id="postcode" placeholder="우편번호"
										readonly></td>
									<td><input type="button" onclick="execDaumPostcode()"
										value="우편번호 찾기"></td>
								</tr>
								<tr>
									<th></th>
									<td><input type="text" id="address" placeholder="주소"
										readonly>
								</tr>
								<tr>
									<th></th>
									<td><input type="text" id="detailAddress"
										placeholder="상세주소" style="width: 175px;"> <input
										type="text" id="extraAddress" placeholder="참고항목" readonly
										style="width: 110px;"></td>
								</tr>
								<tr>
									<th><span>휴대폰 번호</span></th>
									<td><input type="text" id="phone" maxlength="11"
										placeholder="-없이 11자리 입력해주시기 바랍니다."><span
										id="phoneconfirm"></span></td>
									<td><input type="button" class="btn_confirm"
										id="phonecheck" value="인증하기"></td>
								</tr>
								<tr>
									<th><span>면허증 번호</span></th>
									<td><input type="text" id="licensenumber" maxlength="12"
										placeholder="-없이 12자리 입력해주시기 바랍니다."><span
										id="licenseconfirm"></span></td>
									<td><input type="button" class="btn_confirm"
										id="licensecheck" value="인증하기"></td>
								</tr>
							</tbody>
						</table>
						<div class="exform_txt">
							<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
						</div>
					</div>
					<div class="btn_wrap">
						<a href="javascript:;" onclick="signup();">가 입 하 기</a>
					</div>
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<!-- container E -->
	</div>

	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</body>
</html>


<!-- ******************* 유효성 검사 script ******************** -->
<script>
	var validate = new Array; // 회원가입 유효성을 검사할 배열 (false - 유효성 검증 실패 , true - 유효성 검증 성공)
	// vaildate[0]-아이디중복검사 , validate[1]-이름입력확인, validate[2]-패스워드확인, validate[3]-주소확인
	// validate[4]-상세주소확인, validate[5]-휴대폰중복검사, validate[6]-면허증중복검사
	for (var i = 0; i < 7; i++) {
		validate[i] = false;
	}
	
	//자바스크립트 정규식
	var regType1 = /^[A-Za-z0-9+]{6,10}$/; //6~10글자 영문과 숫자만 사용 (아이디확인)
	var regType2 = /^[가-힣\x20]{2,5}$/; //2~5글자 한글만 사용 (이름 확인)
	var regType3 = /^[0-9]{11}$/; //11글자 숫자만 사용 (핸드폰번호 확인)
	var regType4 = /^[0-9]{12}$/; //12글자 숫자만 사용 (면허증번호 확인)
	
	//아이디 중복검사
	$("#idcheck").click(function() {
		if(regType1.test($('#userId').val())){ //아이디를 정규식에 맞게 입력했을 경우
			var userId = $("#userId").val();
			$.ajax({
				type : "POST",
				url : "idcheck",
				data : {userId},
				async : true,
				success : function(data) {
					if (data == 0) { //중복된 아이디가 없을 경우
						$("#idconfirm").text("사용할수 있는 아이디입니다.");
						$("#idconfirm").css("color", "blue");
						validate[0] = true;
					} else { //중복된 아이디가 있을 경우
						$("#idconfirm").text("중복된 아이디입니다.");
						$("#idconfirm").css("color", "red");
						validate[0] = false;
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		} else { //아이디를 정규식에 맞지 않게 입력했을 경우
			$("#idconfirm").text("영어와 숫자로 6~10자리 입력해주시기 바랍니다.");
			$("#idconfirm").css("color", "red");
			validate[0] = false;
			$("#userId").focus();
		}
	});

	//아이디 중복 확인 후 수정할 경우
	$("#userId").keyup(function() {
		if(validate[0]==true){
			$("#idconfirm").text("중복확인을 다시 해주시기 바랍니다.");
			$("#idconfirm").css("color", "red");
			validate[0] = false;
		}
	});

	//이름입력확인
	$("#name").keyup(function() {
		if(regType2.test($('#name').val())){
			validate[1] = true;
		}else{
			validate[1] = false;
		}
	});

	//패스워드확인
	$("#pw1,#pw2").keyup(function() {
		if ($("#pw1").val() != $("#pw2").val() && $("#pw2").val() !== "") { //비밀번호를 다르게 입력했을 경우
			$("#pwcheck").text("비밀번호가 다릅니다.");
			$("#pwcheck").css("color", "red");
			validate[2] = false;
		}else if ($("#pw1").val() == $("#pw2").val() && $("#pw1").val() !== ""){ //비밀번호를 같게 입력했을 경우
			$("#pwcheck").text("비밀번호가 일치합니다.");
			$("#pwcheck").css("color", "blue");
			validate[2] = true;
		}else if(validate[2]==true){ //비밀번호를 같게 입력했다가 변경했을 경우
			$("#pwcheck").text("비밀번호가 다릅니다.");
			$("#pwcheck").css("color", "red");
			validate[2] = false;
		}
	});
	
	

	//첫번째 비밀번호를 7자 이하로 입력할 경우
	$("#pw2").keyup(function() {
		if ($("#pw1").val().length < 8) {
			alert("비밀번호를 8자리 입력해주시기 바랍니다.");
			$("#pwcheck").text("비밀번호가 다릅니다.");
			$("#pwcheck").css("color", "red");
			$("#pw1").focus();
			$("#pw2").val("");
			validate[2] = false;
		}
	});

	//상세주소입력확인
	$("#detailAddress").keyup(function() {
		if ($("#detailAddress").val().length > 0) {
			validate[4] = true;
		} else {
			validate[4] = false;
		}
	});

	//핸드폰번호 중복검사
	$("#phonecheck").click(function() {
		if(regType3.test($("#phone").val())){ // 핸드폰번호가 정규식에 맞을 경우
			var phone = $("#phone").val();
			$.ajax({
				type : "POST",
				url : "phonecheck",
				data : {phone},
				async : true,
				success : function(data) {
					if (data == 0) { // 중복된 핸드폰번호가 없을 경우
						$("#phoneconfirm").text("인증되었습니다.");
						$("#phoneconfirm").css("color", "blue");
						validate[5] = true;
					} else { // 중복된 핸드폰번호가 있을 경우
						$("#phoneconfirm").text("중복된 핸드폰번호입니다.");
						$("#phoneconfirm").css("color", "red");
						validate[5] = false;
						$("#phone").focus();
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		}else{ // 핸드폰번호가 정규식에 맞지않을 경우
			$("#phoneconfirm").text("숫자로 11자리를 입력해주시기 바랍니다.");
			$("#phoneconfirm").css("color", "red");
			validate[5] = false;
			$("#phone").focus();
		}
	});

	//핸드폰번호 중복 확인 후 수정할 경우
	$("#phone").keyup(function() {
		if(validate[5] == true){
			$("#phoneconfirm").text("인증해 주시기 바랍니다.");
			$("#phoneconfirm").css("color", "red");
			validate[5] = false;
		}
	});

	//면허증번호 중복검사
	$("#licensecheck").click(function() {
		if(regType4.test($("#licensenumber").val())){ // 면허증번호가 정규식에 맞을 경우
			var licensenumber = $("#licensenumber").val();
			$.ajax({
				type : "POST",
				url : "licensecheck",
				data : {licensenumber},
				async : true,
				success : function(data) {
					if (data == 0) { // 중복된 면허증번호가 없을 경우
						$("#licenseconfirm").text("인증되었습니다.");
						$("#licenseconfirm").css("color", "blue");
						validate[6] = true;
					} else { // 중복된 면허증번호가 있을 경우
						$("#licenseconfirm").text("중복된 면허증번호입니다.");
						$("#licenseconfirm").css("color", "red");
						validate[6] = false;
						$("#licensenumber").focus();
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		}else { // 면허증번호가 정규식에 맞지않을 경우
			$("#licenseconfirm").text("숫자로 12자리를 입력해주시기 바랍니다.");
			$("#licenseconfirm").css("color", "red");
			validate[6] = false;
			$("#licensenumber").focus();
		}
		
	});

	//면허증번호 중복 확인 후 수정할 경우
	$("#licensenumber").keyup(function() {
		if(validate[6] == true){
			$("#licenseconfirm").text("인증해 주시기 바랍니다.");
			$("#licenseconfirm").css("color", "red");
			validate[6] = false;
		}
	});

	//최종확인 후 가입하기
	function signup() {
		if (validate[0] == false) {
			alert("아이디를 다시 확인해주시기 바랍니다.");
			$("#userId").focus();
		} else if (validate[1] == false) {
			alert("이름을 다시 확인해주시기 바랍니다.");
			$("#name").focus();
		} else if (validate[2] == false) {
			alert("비밀번호를 다시 확인해주시기 바랍니다.");
			$("#pw1").focus();
		} else if (validate[3] == false) {
			alert("주소를 다시 확인해주시기 바랍니다.");
			$("#address").focus();
		} else if (validate[4] == false) {
			alert("상세주소를 다시 확인해주시기 바랍니다.");
			$("#detailAddress").focus();
		} else if (validate[5] == false) {
			alert("핸드폰번호를 다시 확인해주시기 바랍니다.");
			$("#phone").focus();
		} else if (validate[6] == false) {
			alert("면허증번호를 다시 확인해주시기 바랍니다.");
			$("#licensenumber").focus();
		} else{ //모든 validate를 통과했을 경우 USER DB INSERT
			var userId = $("#userId").val();
			var name = $("#name").val();
			var pw = $("#pw1").val();
			var addr = $("#address").val();
			var detailAddress = $("#detailAddress").val();
			var address = addr+" "+detailAddress;
			var phone = $("#phone").val();
			var licensenumber = $("#licensenumber").val();
			
			$.ajax({
				type : "POST",
				url : "joinuser",
				data : {userId, name, pw, address, phone, licensenumber},
				async : true,
				success : function(data) {
					console.log(data);
					if(data==1){
						alert("회원가입이 완료되었습니다.");
						location.href="/login";
					}else{
						alert("회원가입을 실패하였습니다.");
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
	}
</script>


<!-- *********************** 주소찾기 script ********************** -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;

				// 주소input에 데이터가 들어간다.
				validate[3] = true;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
