<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/rental.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
	<div>
		<div class="wrap wd668">
			<div class="container2">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">예약결제</h2>
					<div class="join_form">
					
					<!-- 시간을 보여주기 위해 날짜데이터로 치환 -->
					<fmt:parseDate value='${result.rentalTime}' var='parserental' pattern='yyyy-MM-dd HH:mm:ss'/>
					<fmt:parseDate value='${result.returnTime}' var='parsereturn' pattern='yyyy-MM-dd HH:mm:ss'/>
					<fmt:formatDate value="${parserental}" pattern="yyyy년MM월dd일 HH시" var="rentalShow" />
					<fmt:formatDate value="${parsereturn}" pattern="yyyy년MM월dd일 HH시" var="returnShow" />
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>대여기간</span></th>
									<td><p class="info">${rentalShow} ~ 
											${returnShow}</p></td>
								</tr>
								<tr>
									<th><span>차량정보</span></th>
									<td><img width="250px;" height="150px;" src="/fileimages/${result.carImg}"></td>
								</tr>
								<tr>
									<th><span></span></th>
									<td><p class="info">${result.carNo}</p></td>
								<tr>
								<tr>
									<th><span></span></th>
									<td><p class="info">${result.carKinds} /
											${result.carOil}</p></td>
								<tr>
									<th><span>대여위치</span></th>
									<td><p class="info">${result.locationName}</p></td>
								</tr>
								<tr>
									<th><span>요금정보</span></th>
									<td><p class="info"><fmt:formatNumber
												value="${result.rentalPrice}" pattern="#,###" />원</p></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="javascript:;" onclick="payment();"> <fmt:formatNumber
								value="${result.rentalPrice}" pattern="#,###" />원 결제하기
						</a>
					</div>
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<!-- container E -->
	</div>


</body>
</html>

<script>
	var date = new Date(); //현재 날짜 객체
	var nowYear = date.getFullYear(); //현재 연도
	var nowMonth = (date.getMonth() + 1); //현재 월
	var nowDate = date.getDate(); //현재 일
	var nowHours = date.getHours(); //현재 시
	if (nowMonth < 10) { //현재 '월'이 10월보다 작을경우 앞에 0을 추가
		nowMonth = "0" + nowMonth;
	}
	if (nowHours < 10) { //현재 '시'가 10시보다 작을경우 앞에 0을 추가
		nowHours = "0" + nowHours;
	}
	var now = nowYear + nowMonth + nowDate; //현재 날짜
	var nowtime = now + nowHours; //현재 날짜시간
	
	//결제하기 버튼 클릭
	function payment(){
		
		//난수를 생성하여 예약번호 만들기
		var nan = Math.floor(Math.random() * 1000000) + 100000;
		if (nan > 1000000) {
			nan = nan - 100000;
		}
		nan = nan.toString();
		var rentalNo = nowtime + "_" + nan;
		
		//전송 파라미터 생성
		var carSeq = "${result.carSeq}";
		var rentalPrice = "${result.rentalPrice}";
		var rentalTime = "${result.rentalTime}";
		var returnTime = "${result.returnTime}";
		
		if(confirm("결제하시겠습니까??")){
			//예약정보 DB INSERT
			$.ajax({
				type : "POST",
				url : "payment",
				data : {rentalNo, carSeq, rentalPrice, rentalTime, returnTime},
				async : true,
				success : function(data) {
					if(data==1){ //차량 예약에 성공했을 경우 mypage로 이동.
						alert("차량이 예약되었습니다.");
						location.href="/mypage";
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
	
	
	
</script>