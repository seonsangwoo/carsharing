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

<!-- 달력 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/datepicker-ko.js"></script>

<!-- 모달팝업창 CSS -->
<link href="css/modal.css" rel="stylesheet">
<link href="css/rental.css" rel="stylesheet">

<style>
.searchbutton {
	width: 150px;
	background-color: #343a40;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin: 4px;
	cursor: pointer;
	margin-left: 180px;
}

.impossiblebutton {
	width: 150px;
	background-color: blue;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-right: 30px;
}

.norentalbutton {
	width: 150px;
	background-color: red;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-right: 0px;
}

.rentalbutton {
	width: 150px;
	background-color: #343a40;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-right: 0px;
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
	<div>
		<div id="rentaldiv" style="float: left;">
			<p
				style="font-size: 350%; font-weight: bold; margin-top: 50px; margin-left: 135px; margin-bottom: 30px;">예약하기</p>
			<hr style='border:solid 1px; margin-bottom: 70px; margin-left: 125px;'>
			<div id="datediv">
				<span
					style="font-size: 200%; font-weight: bold; margin-left: 60px; margin-bottom: 30px;">날짜선택</span><br>
				<br> <span
					style="font-size: 150%; margin-left: 100px; margin-bottom: 30px;">대여일&emsp;:&emsp;</span><input
					type="text" id="datepicker1" style="width: 150px" readonly><br>
				<br> <span
					style="font-size: 150%; margin-left: 100px; margin-bottom: 30px;">반납일&emsp;:&emsp;</span><input
					type="text" id="datepicker2" style="width: 150px" readonly>
			</div>
			<div id="timediv" style="margin-top: 50px; margin-bottom: 80px;">
				<span
					style="font-size: 200%; font-weight: bold; margin-left: 60px; margin-bottom: 30px;">시간선택</span><br>
				<br> <span
					style="font-size: 150%; margin-left: 100px; margin-bottom: 30px;">대여시간&emsp;:&emsp;</span>
				<select id="starttime" name="starttime" style="width: 100px">
					<option value="선택">선택</option>
				</select><br> <br> <span
					style="font-size: 150%; margin-left: 100px; margin-bottom: 30px;">반납시간&emsp;:&emsp;</span>
				<select id="endtime" name="endtime" style="width: 100px">
					<option value="선택">선택</option>
				</select>
			</div>
			<input type="button" class="searchbutton" value="검     색"
				id="search_btn"></input>
		</div>
		<div id="map" style="float: right; height: 880px; width: 1400px;">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f51f7860ed8829a8f36e95287d941b55&libraries=services,clusterer,drawing"></script>
		</div>
	</div>
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div>
			<div class="modal_close">
				<a href="#">close</a>
			</div>
			<div id="carinfo"
				style="overflow: auto; height: 900px; margin-top: 20px;"></div>
		</div>

	</div>
</body>
</html>

<script>
	//달력 표시
	$(function() {
		$("#datepicker1").datepicker();
	});
	$(function() {
		$("#datepicker2").datepicker();
	});

	var date = new Date(); //현재 날짜 객체
	var nowYear = date.getFullYear(); //현재 연도
	var nowMonth = (date.getMonth() + 1); //현재 월
	var nowDate = date.getDate(); //현재 일
	var nowHours = date.getHours(); //현재 시
	if (nowMonth < 10) { //현재 '월'이 10월보다 작을경우 앞에 0을 추가
		nowMonth = "0" + nowMonth;
	}
	if (nowDate < 10) { //현재 '일'이 10월보다 작을경우 앞에 0을 추가
		nowDate = "0" + nowDate;
	}
	if (nowHours < 10) { //현재 '시'가 10시보다 작을경우 앞에 0을 추가
		nowHours = "0" + nowHours;
	}
	var now = nowYear + nowMonth + nowDate; //현재 날짜
	var nowtime = now + nowHours; //현재 날짜시간
	
	var tomorrow = new Date(date.setDate(date.getDate() + 1)); //내일 날짜 객체
	var tomorrowYear = tomorrow.getFullYear(); //내일 연도
	var tomorrowMonth = (tomorrow.getMonth() + 1); //내일 월
	var tomorrowDate = tomorrow.getDate(); //내일 일
	if (tomorrowMonth < 10) { //현재 '월'이 10월보다 작을경우 앞에 0을 추가
		tomorrowMonth = "0" + tomorrowMonth;
	}
	if (tomorrowDate < 10) { //현재 '일'이 10월보다 작을경우 앞에 0을 추가
		tomorrowDate = "0" + tomorrowDate;
	}
	
	var datepicker1 = null; //대여일 날짜
	var datepicker2 = null; //반납일 날짜
	var datepicker1arr = null; //대여일 날짜 (-)절삭을 위한 배열
	var datepicker2arr = null; //반납일 날짜 (-)절삭을 위한 배열
	var starttimeval = null; //대여시간
	var endtimeval = null; //반납시간
	var starttime = null; //대여 날짜와시간
	var endtime = null; //반납 날짜와시간
	var timediff1 = null; //5일이상 예약 금지를 위한 대여시간
	var timediff2 = null; //5일이상 예약 금지를 위한 반납시간
	var datediff = null; //반납시간 - 대여시간 (5일이상 금지)
	
	$("#datepicker1").change( //대여일 변경
			function() {
				$("#starttime").val("선택"); //날짜와 시간을 모두 선택했다가 변경했을 때 시간조정을 위해
				$("#endtime").val("선택"); //날짜와 시간을 모두 선택했다가 변경했을 때 시간조정을 위해
				datepicker1arr = $("#datepicker1").val().split('-');
				datepicker1 = datepicker1arr[0] + datepicker1arr[1]
						+ datepicker1arr[2]; //대여일 절삭 (ex.20210428)
				datepicker2arr = $("#datepicker2").val().split('-');
				datepicker2 = datepicker2arr[0] + datepicker2arr[1]
						+ datepicker2arr[2]; //반납일 절삭 (ex.20210428)
				starttimeval = $("#starttime").val(); //starttime 값
				endtimeval = $("#endtime").val(); //endtime 값
				starttime = datepicker1 + $("#starttime").val(); //대여날짜+시간 (ex.2021042800)
				endtime = datepicker2 + $("#endtime").val(); //반납날짜+시간 (ex.2021042823)
				
				//5일이상 시간비교를 위한 변수
				timediff1 = new Date(datepicker1arr[0], datepicker1arr[1]-1, datepicker1arr[2]);
				timediff2 = new Date(datepicker2arr[0], datepicker2arr[1]-1, datepicker2arr[2]);
				datediff = Math.ceil(timediff2.getTime()-timediff1.getTime())/(1000*3600*24);
				
				if (now > datepicker1) { //대여일을 오늘이전 날짜로 선택할 경우
					alert("대여일을 오늘 날짜 이후로 선택해주시기 바랍니다.");
					$("#datepicker1").val(nowYear+"-"+nowMonth+"-"+nowDate);
					$("#datepicker1").focus();
				} else if (datepicker2 !== null && datepicker1 > datepicker2) { //반납일을 대여일 이전으로 선택할 경우
					alert("반납일을 대여일 이후로 선택해주시기 바랍니다.");
					$("#datepicker2").val($("#datepicker1").val());
					$("#datepicker2").focus();
				} else if($("#datepicker2").val() == ''){
					$("#datepicker2").val($("#datepicker1").val());
				} else if(nowHours == 23 && now == datepicker1){ //23시에 예약할 경우 다음날 00시로 예약 유도
					alert("예약할 수 있는 최소 시간은  "+tomorrowYear+"년 "+tomorrowMonth+"월 "+tomorrowDate+"일 00시 입니다.");
					$("#datepicker1").val(tomorrowYear+"-"+tomorrowMonth+"-"+tomorrowDate);
				} else if(datediff>4){ //5일 이상 예약 불가
					alert("5일 이상은 예약이 불가능합니다.");
					$("#datepicker2").focus();
					$("#datepicker2").val($("#datepicker1").val());
				}
			});

	$("#datepicker2").change( //반납일 변경
			function() {
				$("#starttime").val("선택"); //날짜와 시간을 모두 선택했다가 변경했을 때 시간조정을 위해
				$("#endtime").val("선택"); //날짜와 시간을 모두 선택했다가 변경했을 때 시간조정을 위해
				datepicker1arr = $("#datepicker1").val().split('-');
				datepicker1 = datepicker1arr[0] + datepicker1arr[1]
						+ datepicker1arr[2]; //대여일 절삭 (ex.20210428)
				datepicker2arr = $("#datepicker2").val().split('-');
				datepicker2 = datepicker2arr[0] + datepicker2arr[1]
						+ datepicker2arr[2]; //반납일 절삭 (ex.20210428)
				starttimeval = $("#starttime").val(); //starttime 값
				endtimeval = $("#endtime").val(); //endtime 값
				starttime = datepicker1 + $("#starttime").val(); //대여날짜+시간 (ex.2021042800)
				endtime = datepicker2 + $("#endtime").val(); //반납날짜+시간 (ex.2021042823)
				
				//5일이상 시간비교를 위한 변수
				var timediff1 = new Date(datepicker1arr[0], datepicker1arr[1]-1, datepicker1arr[2]);
				var timediff2 = new Date(datepicker2arr[0], datepicker2arr[1]-1, datepicker2arr[2]);
				var datediff = Math.ceil(timediff2.getTime()-timediff1.getTime())/(1000*3600*24);
				
				if (datepicker1 > datepicker2) { //반납일을 대여일 이전으로 선택할 경우
					alert(datepicker1arr[0]+"년 "+datepicker1arr[1]+"월 "+datepicker1arr[2]+"일 이후로 선택해주시기 바랍니다.");
					$("#datepicker2").focus();
					$("#datepicker2").val($("#datepicker1").val());
				} else if(datediff>4){ //5일 이상 예약 불가
					alert("5일 이상은 예약이 불가능합니다.");
					$("#datepicker2").focus();
					$("#datepicker2").val($("#datepicker1").val());
				}
			});

	//대여일을 선택하지 않고 반납일을 먼저 선택할 경우
	$("#datepicker2").click(function() {
		if ($("#datepicker1").val() == "") {
			alert("대여일을 먼저 선택해주시기 바랍니다.");
			$("#datepicker1").focus();
		}
	});

	//시간선택 (00시~23시 넣기)
	for (var i = 0; i < 24; i++) {
		var h = i.toString().padStart(2, "0");
		$("#starttime").append("<option value="+h+">" + h + "시</option>");
		$("#endtime").append("<option value="+h+">" + h + "시</option>");
	}

	$("#starttime").change( //대여시간 변경
			function() {
				var changestime = Number(nowHours) + 1;
				if ((changestime) < 10) {
					changestime = "0" + changestime
				}
				datepicker1arr = $("#datepicker1").val().split('-');
				datepicker1 = datepicker1arr[0] + datepicker1arr[1]
						+ datepicker1arr[2]; //대여일 절삭 (ex.20210428)
				datepicker2arr = $("#datepicker2").val().split('-');
				datepicker2 = datepicker2arr[0] + datepicker2arr[1]
						+ datepicker2arr[2]; //반납일 절삭 (ex.20210428)
				starttimeval = $("#starttime").val(); //starttime 값
				endtimeval = $("#endtime").val(); //endtime 값
				starttime = datepicker1 + $("#starttime").val(); //대여날짜+시간 (ex.2021042800)
				endtime = datepicker2 + $("#endtime").val(); //반납날짜+시간 (ex.2021042823)
				var endtimesub = endtime.substring(8, 10) - 1;
				
				//5일이상 시간비교를 위한 변수
				var timediff1 = new Date(datepicker1arr[0], datepicker1arr[1]-1, datepicker1arr[2]);
				var timediff2 = new Date(datepicker2arr[0], datepicker2arr[1]-1, datepicker2arr[2]);
				var datediff = Math.ceil(timediff2.getTime()-timediff1.getTime())/(1000*3600*24);

				//대여일과 반납일이 같을 때 대여시간을 23시로 설정할 경우 반납일을 다시 설정
				var nextday = new Date(datepicker1arr[0], datepicker1arr[1]-1, datepicker1arr[2]);
				nextday.setDate(nextday.getDate()+1); //대여일의 다음날로 설정
				var nextYear = nextday.getFullYear(); //대여일의 다음날 연도
				var nextMonth = (nextday.getMonth() + 1); //대여일의 다음날 월
				var nextDate = nextday.getDate(); //대여일의 다음날 일
				if (nextMonth < 10) { //'월'이 10월보다 작을경우 앞에 0을 추가
					nextMonth = "0" + nextMonth;
				}
				if (nextDate < 10) { //'일'이 10월보다 작을경우 앞에 0을 추가
					nextDate = "0" + nextDate;
				}
				
				if ($("#datepicker1").val() == null
						|| $("#datepicker1").val() == '') { //대여날짜가 선택이 안되어있을 경우
					alert("대여일을 먼저 선택해주시기 바랍니다.");
					$("#datepicker1").focus();
				} else if ($("#datepicker2").val() == null
						|| $("#datepicker2").val() == '') { //반납날짜가 선택이 안되어있을 경우
					alert("반납일을 먼저 선택해주시기 바랍니다.");
					$("#datepicker2").focus();
				} else if (starttime <= nowtime) { //현재시간 이전으로 예약할 경우
					alert("예약할 수 있는 최소 시간은 " + (changestime) + "시 입니다.");
					$("#starttime").val(changestime);
				} else if (starttime > endtime && endtimeval !== "00") { //대여시간이 반납시간보다 늦을 경우
					alert((endtimesub) + "시 이전으로 선택해주시기 바랍니다.");
					if ((endtimesub) < 10) {
						endtimesub = "0" + endtimesub
					}
					$("#starttime").val(endtimesub);
				}else if ($("#datepicker1").val() == $("#datepicker2").val()
						&& $("#starttime").val() == 23) { //대여일과 반납일이 같을 때 대여시간을 23시로 예약하는 경우
					alert("반납할 수 있는 최소 시간은 "+nextYear+"년 "+nextMonth+"월 "+nextDate+"일 00시 입니다.");
					$("#endtime").val("00");
					$("#datepicker2").val(nextYear+"-"+nextMonth+"-"+nextDate);
				} else if (datediff == 4 && endtimeval > starttimeval && endtimeval !== "선택"){ //5일 이상 예약 불가
					alert("5일 이상은 예약이 불가능합니다.");
					$("#endtime").focus();
					$("#endtime").val($("#starttime").val());
				}
			});

	$("#endtime").change( //반납시간 변경
			function() {
				datepicker1arr = $("#datepicker1").val().split('-');
				datepicker1 = datepicker1arr[0] + datepicker1arr[1]
						+ datepicker1arr[2]; //대여일 절삭 (ex.20210428)
				datepicker2arr = $("#datepicker2").val().split('-');
				datepicker2 = datepicker2arr[0] + datepicker2arr[1]
						+ datepicker2arr[2]; //반납일 절삭 (ex.20210428)
				starttimeval = $("#starttime").val(); //starttime 값
				endtimeval = $("#endtime").val(); //endtime 값
				starttime = datepicker1 + $("#starttime").val(); //대여날짜+시간 (ex.2021042800)
				endtime = datepicker2 + $("#endtime").val(); //반납날짜+시간 (ex.2021042823)
				
				var changeetime = parseInt(starttime.substring(8, 10)) + 1;
				
				//5일이상 시간비교를 위한 변수
				var timediff1 = new Date(datepicker1arr[0], datepicker1arr[1]-1, datepicker1arr[2]);
				var timediff2 = new Date(datepicker2arr[0], datepicker2arr[1]-1, datepicker2arr[2]);
				var datediff = Math.ceil(timediff2.getTime()-timediff1.getTime())/(1000*3600*24);
				
				if ($("#datepicker1").val() == null
						|| $("#datepicker1").val() == '') {//대여날짜가 선택이 안되어있을 경우
					alert("대여일을 먼저 선택해주시기 바랍니다.");
					$("#datepicker1").focus();
					$("#starttime").val("선택");
					$("#endtime").val("선택");
				} else if ($("#datepicker2").val() == null
						|| $("#datepicker2").val() == '') {//반납날짜가 선택이 안되어있을 경우
					alert("반납일을 먼저 선택해주시기 바랍니다.");
					$("#datepicker2").focus();
					$("#starttime").val("선택");
					$("#endtime").val("선택");
				} else if ($("#starttime").val() == "선택") {//대여시간이 선택이 안되어있을 경우
					alert("대여시간을 먼저 선택해주시기 바랍니다.");
					$("#endtime").val("선택");
				} else if (starttime >= endtime) { //반납시간보다 대여시간이 빠를 경우
					if ((changeetime) < 10) {
						changeetime = "0" + changeetime
					}
					alert("예약할 수 있는 최소 반납 시간은 " + (changeetime) + "시 입니다.");
					$("#endtime").val((changeetime));
				} else if (datediff == 4 && $("#endtime").val()>$("#starttime").val()){ //5일 이상 예약 불가
					alert("5일 이상은 예약이 불가능합니다.");
					$("#endtime").focus();
					$("#endtime").val($("#starttime").val());
				}
			});

	//모달창 생성
	function modalOn() {
		$('.modal_wrap').show();
		$('.black_bg').show();
	}
	function modalOff() {
		$('.modal_wrap').hide();
		$('.black_bg').hide();
	}
	//모달창 닫기(버튼클릭)
	document.querySelector('.modal_close').addEventListener('click', modalOff);
	//모달창 닫기(흑백화면클릭)
	$('.black_bg').click(function(){
		modalOff();
	});

	//지도생성
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		center : new kakao.maps.LatLng(37.516351354628775, 127.01999915575075), // 지도의 중심좌표 
		level : 8, // 지도의 확대 레벨
		maxLevel : 15 // 지도의 확대 최대 레벨
	});

	//마커 생성
	var marker;
	//마커 이미지 생성
	var markerImage = new daum.maps.MarkerImage(
			'images/icons/t_zone.png', new daum.maps.Size(60, 35));

	//검색 버튼 클릭 시
	$("#search_btn").click(
			function() {
				//날짜 시간 체크 및 ajax 파라미터 전송 변수
				var rentalTime = $("#datepicker1").val() + " " + $("#starttime").val()+":00:00";
				var returnTime = $("#datepicker2").val() + " " + $("#endtime").val()+":00:00";
				
				//차량 가격을 계산하기 위한 대여시간 변수
				var date1 = new Date(rentalTime); //대여 시간
				var date2 = new Date(returnTime); //반납 시간
				var diffTime = (date2.getTime() - date1.getTime())/(1000*60*60); //대여할 시간
				
				//날짜와 시간을 모두 선택하였는지 체크하고 선택하였으면 지점위치 가져오기
				if (rentalTime.indexOf("선택") != -1 || returnTime.indexOf("선택") != -1) {
					alert("날짜 및 시간을 모두 선택해주시기 바랍니다.");
				} else{
					//지도위에 찍어줄 대여점위치정보 가져오기
					$.ajax({
						type : "POST",
						url : "getlatlong",
						data : {rentalTime, returnTime},
						async : true,
						success : function(data) {
							//console.log(data);
							if(data==""){
								alert("겹치는 시간에 예약한 차량이 있습니다.\n다시 확인 부탁드립니다.");
								location.href="/mypage";
							}else{
								data.forEach(function(data) {
									//마커 생성
									marker = new kakao.maps.Marker({
										map : map, //마커 표시되는 영역
										position : new kakao.maps.LatLng(data.latitude,
												data.longitude), //마커 위치 좌표
										image : markerImage //마커 이미지
									});
		
									//마커에 위치코드 주입 (해당 대여점의 차량목록을 가져오기위한 작업)
									marker.locationCode = data.locationCode;
		
									//마커 클릭 이벤트 발생
									kakao.maps.event.addListener(marker, 'click',
											function() {
												var locationCode = this.locationCode;
												//차량 상세정보 가져오기
												$.ajax({
													type : "POST",
													url : "getcarinfolist",
													data : {locationCode, rentalTime, returnTime},
													async : true,
													success : function(data) {
														//console.log(data);
														$("#carinfo").empty();
															temp = "<div style='padding-left:185px; padding-top:10px;'>";
															temp += "<h1 style='font-weight:bold;'>"+rentalTime+"  ~  "+returnTime+"</h1>";
															temp += "</div>";
															temp += "<hr style='border:solid 1px;'>";
														if(data.length==0){
															temp += "<h1 style='font-weight:bold; font-size:250%; text-align:center; margin-top:300px;'>해당 대리점은 서비스 준비중입니다.</h1>";
															$("#carinfo").append(temp);
											   				temp = "";
														}
														data.forEach(function(data) {
															//모달팝업창에 차량정보 입력해주기
															//예약결제 페이지에 정보를 넘겨주기 위한 데이터 hidden 처리
															temp += "<form action='/reservation' method='post'>";
															temp += "<input type='hidden' name='rentalTime' value='"+rentalTime+"'>";
															temp += "<input type='hidden' name='returnTime' value='"+returnTime+"'>";
															temp += "<input type='hidden' name='carSeq' value='"+data.carSeq+"'>";
															temp += "<input type='hidden' name='carNo' value='"+data.carNo+"'>";
															temp += "<input type='hidden' name='locationName' value='"+data.locationName+"'>";
															temp += "<input type='hidden' name='carKinds' value='"+data.carKinds+"'>";
															temp += "<input type='hidden' name='carOil' value='"+data.carOil+"'>";
															temp += "<input type='hidden' name='carImg' value='"+data.carImg+"'>";
															temp += "<input type='hidden' name='rentalPrice' value='"+((data.carPrice)*(diffTime))+"'>";
															temp += "<div style='padding-left:30px; padding-top:20px;";
															if(data.rentalStatus==1){
																temp += "opacity:0.5;'>";
															}else{
																temp += "'>";
															}
															temp += "<p class='info' style='font-weight:bold; font-size:40px;'>"+data.carKinds+"</p>";
															temp += "<div style='float:right; margin-right:30px;'>";
															temp += "<img width='300px;' height='200px;' src='/fileimages/"+data.carImg+"'>";
															temp += "</div>";
															temp += "<p class='info'>"+data.locationName+"</p>";
															temp += "<p class='info'>"+data.carOil+"</p><br>";
															temp += "<p class='info'>결제금액 : "+((data.carPrice)*(diffTime)).toLocaleString();+"원</p>";
															temp += "</div>";
															temp += "<div align='right' style='margin-right:100px'>";
															//선택한 날짜와 시간에 겹치는 차량이 존재할 경우 예약불가
															if(data.rentalStatus==1){
																temp += "<input type='button' class='impossiblebutton' value='불 가 능 시 간'";
																temp += "onclick='impossibletime(\""+rentalTime+"\",\""+returnTime+"\","+data.carSeq+");'>";
																temp += "<input type='button' class='norentalbutton' value='예 약 불 가'>";
																temp += "<div id='show"+data.carSeq+"' style='font-weight: bold'></div>";
															}else{
																temp += "<button type='submit' class='rentalbutton'>예 약 하 기</button>";
															}
															temp += "</div>";
															temp += "<hr style='border:solid 1px;'>";
															temp += "<form>";
															$("#carinfo").append(temp);
											   				temp = "";
														});
													},
													error : function(e) {
														console.log(e);
													}
												});
												
												modalOn();
											});
		
								});
							}
	
						},
						error : function(e) {
							console.log(e);
						}
					});
				}
			});
	
	//예약불가능한 시간 보기
	function impossibletime(rentalTime, returnTime, carSeq){
		//시간 가져오기
		$.ajax({
			type : "POST",
			url : "impossibletime",
			data : {rentalTime, returnTime, carSeq},
			async : true,
			success : function(data) {
				//console.log(data);
				
				$("#show"+carSeq).empty();
				data.forEach(function(data) {
					$("#show"+carSeq).append(data.rentalTime+" ~ "+data.returnTime+"<br>");
				});
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	
	
	
</script>