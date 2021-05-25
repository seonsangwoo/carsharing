<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<!-- 모달팝업창 CSS -->
<link href="css/modal2.css" rel="stylesheet">
<link href="css/mypage.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>

.locationbutton {
	width: 120px;
	background-color: #343a40;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 0px;
	cursor: pointer;
	margin-left: 10px;
}

.cancelbutton {
	width: 120px;
	background-color: red;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 0px;
	cursor: pointer;
	margin-left: 10px;
}

.endbutton {
	width: 120px;
	background-color: #343a40;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 0px;
	margin-left: 10px;
}

.waitbutton {
	width: 120px;
	background-color: green;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 0px;
	margin-left: 10px;
}

.ingbutton {
	width: 120px;
	background-color: blue;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 0px;
	margin-left: 10px;
}

.pwchangebutton {
	width: 150px;
	background-color: #343a40;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 17px;
	font-weight: bold;
	margin: 0px;
	cursor: pointer;
	margin-left: 370px;
}

</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="/rental">T-CAR</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<!-- <li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li> -->
					<li class="nav-item"><a class="nav-link" href="/rental">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div id="left" style="float: left; width: 50%; padding-left:10%;padding-right:5%;">
		<h1 style="text-align: center; font-weight: bold; font-size:40px; margin: 50px;">예 약 내 역</h1>
		<hr style='border:solid 1px;'>
		<div style="overflow: auto; height: 700px;">
			<!-- 예약내역이 비어있을 경우 -->
			<c:if test="${empty result}">
				<h1 style="text-align: center; font-weight: bold; font-size:40px; margin: 50px;">예약내역이 비어있습니다.</h1>
			</c:if>
			<!-- 예약내역이 존재할 경우 -->
			<c:forEach var="result" items="${result}">
			
				<!-- 날짜를 비교하여 예약상태를 확인해주기 위한 시간계산 -->
				<jsp:useBean id="nowDate" class="java.util.Date" />
				<fmt:formatDate value="${nowDate}" pattern="yyyyMMddHH" var="now" />
				<fmt:parseNumber value="${now}" var="int_now" integerOnly="true" />
				<fmt:parseDate value='${result.rentalTime}' var='parserental' pattern='yyyy-MM-dd HH:mm:ss'/>
				<fmt:formatDate value="${parserental}" pattern="yyyyMMddHH" var="rentalTime" />
				<fmt:parseNumber value="${rentalTime}" var="int_rentalTime" integerOnly="true" />
				<fmt:parseDate value='${result.returnTime}' var='parsereturn' pattern='yyyy-MM-dd HH:mm:ss'/>
				<fmt:formatDate value="${parsereturn}" pattern="yyyyMMddHH" var="returnTime" />
				<fmt:formatDate value="${parserental}" pattern="yyyy년MM월dd일 HH시" var="rentalShow" />
				<fmt:formatDate value="${parsereturn}" pattern="yyyy년MM월dd일 HH시" var="returnShow" />
				
				<div style='text-align: center;'>
				<p style='font-weight:bold; color:blue;'><c:out value="${rentalShow}"/>  ~  <c:out value="${returnShow}"/></p>
				</div>
				<!-- <hr style='border:solid 1px; width:400px;'> -->
				
				<div style='padding-left:50px;'>
				<div>
				<div style="float:right; margin-right:30px;">
				<img width="250px;" height="150px;" src="/fileimages/${result.carImg}">
				</div>
				<h1 style='font-weight:bold; font-size:35px;'><c:out value="${result.carKinds}"/></h1>
				</div>
				<a style="font-size:25px;"><c:out value="${result.locationName}"/>
				<button type="button" class="locationbutton" onclick="locationInfo(${result.latitude}, ${result.longitude});">위치보기</button></a>
				<h2><c:out value="${result.carOil}"/></h2><br>
				<h4 style='font-weight:bold;'>결제금액 : <fmt:formatNumber value="${result.rentalPrice}" pattern="#,###" />원</h4>
				</div>
				<div align='right' style='margin-right:50px'>
				
				<c:choose>
						<c:when test="${now > rentalTime && now > returnTime}">
							<button type="button" class="endbutton">사용완료</button>
						</c:when>
						<c:when test="${now >= rentalTime && now <= returnTime}">
							<button type="button" class="ingbutton">사용중</button>
						</c:when>
						<c:when test="${(int_now - int_rentalTime) eq -1}">
							<button type="button" class="waitbutton">사용대기</button>
						</c:when>
						<c:when test="${now < rentalTime}">
							<button type="button" class="cancelbutton" onclick="cancel(${result.rentalNo}, '${result.carKinds}');">예약취소</button>
						</c:when>
				</c:choose>
				</div>
				<hr style='border:solid 1px;'>
			</c:forEach>
		</div>
	</div>
	<div id="right" style="float: right; width: 50%; height: 850px;">
	<h1 style="text-align: center; font-weight: bold; font-size:40px; margin: 50px;">위 치 정 보</h1>
		<div style="padding: 0 10% 5% 5%">
			<div id="map" style="width: 100%; height:600px;">
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f51f7860ed8829a8f36e95287d941b55&libraries=services,clusterer,drawing"></script>
			</div>
		</div>
		<div>
			<button type="button" class="pwchangebutton" onclick="modalOn();">비밀번호변경</button>
		</div>
	</div>
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div>
			<div class="modal_close">
				<a href="#">close</a>
			</div>
				<div class="wrap wd668">
				<div class="container2">
					<div class="form_txtInput">
						<h2 class="sub_tit_txt">비밀번호 변경</h2>
						<div class="join_form">
							<table>
								<colgroup>
									<col width="30%" />
									<col width="auto" />
								</colgroup>
								<tbody>
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
								</tbody>
							</table>
						</div>
						<div class="btn_wrap">
							<a href="javascript:;" onclick="pwchange();">변 경 하 기</a>
						</div>
					</div>
					<!-- form_txtInput E -->
				</div>
				<!-- content E-->
			</div>
		</div>

	</div>
</body>

<script>
	
	//예약취소
	function cancel(rentalNo, carKinds){
		rentalNo = rentalNo+"";
		var data1 = rentalNo.substr(0,10);
		var data2 = rentalNo.substr(10,16);
		rentalNo = data1+"_"+data2;
		if(confirm(carKinds+" 차량의 예약을 취소하시겠습니까??")){
			$.ajax({
				type : "POST",
				url : "reservationcancel",
				data : {rentalNo},
				async : true,
				success : function(data) {
					//console.log(data);
					if(data ==1 ){ //예약이 취소 되었으면 새로고침
						alert("예약이 취소되었습니다.");
						window.location.reload();
					}else{
						alert("예약에 실패하였습니다.");
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		} else{
			return;
		}
	}

	//모달창 생성
	function modalOn() {
		$('.modal_wrap').show();
		$('.black_bg').show();
	}
	function modalOff() {
		$('.modal_wrap').hide();
		$('.black_bg').hide();
		$('#pw1').val('');
		$('#pw2').val('');
		$('#pwcheck').text('');
	}
	//모달창 닫기(버튼클릭)
	document.querySelector('.modal_close').addEventListener('click', modalOff);
	
	var validate = false;
	
	//패스워드확인
	$("#pw1,#pw2").keyup(function() {
		if ($("#pw1").val() != $("#pw2").val() && $("#pw2").val() !== "") { //비밀번호를 다르게 입력했을 경우
			$("#pwcheck").text("비밀번호가 다릅니다.");
			$("#pwcheck").css("color", "red");
			validate = false;
		}else if ($("#pw1").val() == $("#pw2").val() && $("#pw1").val() !== ""){ //비밀번호를 같게 입력했을 경우
			$("#pwcheck").text("비밀번호가 일치합니다.");
			$("#pwcheck").css("color", "blue");
			validate = true;
		}else if(validate==true){ //비밀번호를 같게 입력했다가 변경했을 경우
			$("#pwcheck").text("비밀번호가 다릅니다.");
			$("#pwcheck").css("color", "red");
			validate = false;
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
		}
	});
	
	//비밀번호변경
	function pwchange(){
		if(validate == true){ //validate를 통과하면 비밀번호변경 실행
			var pw = $("#pw1").val();
			$.ajax({
				type : "POST",
				url : "pwchange",
				data : {pw},
				async : true,
				success : function(data) {
					console.log(data);
					if(data == 1){ // 비밀번호를 변경했을 경우 세션을 끊고 login창으로 이동.
						alert("비밀번호가 변경되어 다시 로그인해 주시기 바랍니다.");
						location.href="/logout";
					}else if(data == 0){ // 비밀번호 변경에 실패했을 경우
						alert("비밀번호 변경을 실패하였습니다.");
					}else if(data == 2){ // 기존에 비밀번호와 같은 비밀번호를 입력했을 경우
						alert("기존 비밀번호와 다른 비밀번호를 입력해주세요.");
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		}else { //validate를 통과하지 못했을 경우
			alert("비밀번호를 다시 확인해주시기 바랍니다.");
			$("#pw1").focus();
		}
	}

	//지도생성
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		center : new kakao.maps.LatLng(37.47657345267246, 126.981661557085), // 지도의 중심좌표 
		level : 3, // 지도의 확대 레벨
		maxLevel : 15 // 지도의 확대 최대 레벨
	});
	
	//마커 생성
	var marker;
	//이전 마커 제거를 위해 생성
	var oldmarker = null;
	//마커 이미지 생성
	var markerImage = new daum.maps.MarkerImage(
			'images/icons/t_zone.png', new daum.maps.Size(60, 35));
	//위치보기 클릭이벤트
	function locationInfo(latitude, longitude){
		marker = new kakao.maps.Marker({
			map : map, //마커가 표시되는 영역
			position : new kakao.maps.LatLng(latitude, longitude), //마커 위치 설정
			image : markerImage //마커 이미지 설정
		});
		//oldmarker에 값이 존재하면 지도에서 없애주고, 새로운마커를 oldmarker변수안에 넣어준다. 
		if(oldmarker){
			oldmarker.setMap(null);
		}
		marker.setMap(map);
		oldmarker = marker;
		
		map.setCenter(new kakao.maps.LatLng(latitude, longitude)); //맵의 중심좌표
	}
	
	
</script>
</html>