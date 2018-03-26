<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title>게시판</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


	<!--Requirement jQuery-->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<!--Load Script and Stylesheet -->
	<script type="text/javascript" src="/innerpeace_myBatis/appointment/jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="/innerpeace_myBatis/appointment/jquery.simple-dtpicker.css" rel="stylesheet" />
	<!---->





</head>

<body>

	<script type="text/javascript">
		$(function(){
			$('*[name=appt_date1]').appendDtpicker();
		});
		$(function(){
			$('*[name=appt_date2]').appendDtpicker();
		});
	</script> 


	<div class="w3-row w3-section">

	<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %> 
	

	<!-- body board -->
	<center>
<div class="container" style="margin-top: 80px;">
	<table class="w3-table-all w3-bordered" style="width:800;">
	<tr height="30">
		<td width="100" align="center"><b>아이디 : </b></td>
		<td width="100" align="center">${member.id}</td>
		<td width="100" align="center"><b>이름 : </b></td>
		<td width="100" align="center">${member.name}</td>
	</tr>
	<tr height="30">			
		<td width="100" align="center"><b>성별 : </b></td>
		<td width="100" >${member.gender}</td>
		<td width="100" align="center"><b>생년월일 : </b></td>
		<td width="100" align="center">${member.birthdate}</td>
	</tr><tr height="30">		
		<td width="100"><b>기본연락처 : </b></td>
		<td width="100">${member.tel}</td>
		<td width="100"><b>이메일 : </b></td>
		<td width="100">${member.email}</td>
 	</tr><tr height="30">
		<td width="100"><b>과거 진료경험 여부 :  </b></td>
		<td width="100" align="center">${member.con_past}</td>
			<td width="100"><b>가장 최근 진료일 : </b></td>
			<td width="100" align="center">${member.con_date}</td>
	</tr><tr height="30">
			<td width="100"><b>과거 진료과목 : </b></td>
			<td width="100" align="center">${member.con_cat}</td>
			<td width="100" align="center"/>
			<td width="100" align="center"/>			
	</tr>
		
	</table></div>
	
	<!-- input form -->
	<!-- <form class="w3-container w3-display-topmiddle w3-card-4 w3-white w3-text-black" action="apptPro" method="post"
	style="height: 100%; width:600px; margin-top: 340px; padding: 10;"> -->
	<form class="w3-container w3-card-4 w3-white w3-text-black" action="apptPro" method="post" style="margin-top:50px; width: 800; height: 700; margin-bottom: 50; top: 400px;">
	<div class="w3-row w3-section">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="id" value="${member.id}">
		<input type="hidden" name="boardid" value="${ boardid }"> <!-- form>hidden으로 내용 저장을 해야함 -->
		<div class="reservation_form" style="height: 100%;">	
	<div>
			<label>연락처 2</label><span></span>
			<input class="w3-input w3-hover-grey" style="width: 50%;" type="text" name="tel2" >
		</div>
		
		
		<div>
			<label>선택하신 기관에서의 진료이력 </label><span></span>
			<input type="radio" name="con_past" value="초진">초진
			<input type="radio" name="con_past" value="재진">재진
		</div>
		<div>
	
			<select id="category1" class="w3-select" name="con_cat" style="width: 50%;" >
				<option value="">상담 받고자 하는 과목*</option>
				<option value=""></option>
				<option value="성인전반">----성인정신건강 전반----</option>
				<option value="우울증">우울증</option>
				<option value="분노조절,스트레스">분노조절,스트레스</option>
				<option value="불면증">불면증</option>
				<option value="대인공포증">대인공포증</option>
				<option value="섭식장애">섭식장애(거식,폭식)</option>
				<option value="중독">중독(게임,성생활,술)</option>
				<option value="불안장애,강박증">불안장애,강박증</option>
				<option value="PTSD">외상 후 스트레스 장애</option>
				<option value="부부갈등,커플 카운셀링">부부갈등,커플 카운셀링</option>
				<option value=""></option>
				<option value="소아청소년 전반">----소아청소년 정신건강 전반----</option>
				<option value="ADHD">주의력 결핍 과잉 행동장애(ADHD)</option>
				<option value="틱">틱장애</option>
				<option value="학습장애,적성 및 진로">학습장애,적성 및 진로지도</option>
				<option value="청소년 인터넷 중독">청소년 인터넷 중독</option>
				<option value="성폭력,왕따 후유증">성폭력 피해 후유증,왕따 후유증</option>
			</select>
			<span></span>
		</div>
		<div>
			<select id="category2" class="w3-select" name="doc" style="width: 50%;" >
				<option value="">병원을 등록된 리스트에서 골라주세요*</option>
				<option value="서울신경정신과의원">서울신경정신과의원</option>
				<option value="세종병원">세종병원</option>
				<option value="김제헌신경정신과의원">김제헌신경정신과의원</option>
				<option value="더블유진병원">더블유진병원</option>
				<option value="순천향대학교부천병원">순천향대학교부천병원</option>
				<option value="연세정정신과의원">연세정정신과의원</option>
				<option value="함께하는정신과의원">함께하는정신과의원</option>
				<option value="밝은마음클리닉">밝은마음클리닉</option>
				<option value="행복마음의원">행복마음의원</option>
				<option value="성빈센트병원">성빈센트병원</option>
				<option value="손신경정신과의원">손신경정신과의원</option>
				<option value="메트로병원">메트로병원</option>
				<option value="박재홍정신과의원">박재홍정신과의원</option>
				<option value="이천소망병원">이천소망병원</option>
				<option value="미래정신과의원">미래정신과의원</option>
				<option value="동희병원">동희병원</option>
				<option value="의령그린병원">의령그린병원</option>
				<option value="근로복지공단창원병원">근로복지공단창원병원</option>
			</select>
			<span></span>
		</div><br>
		<div>
			<label>원하시는 진료 일시를 선택해 주세요.<br><span></span></label>
			<input type="text" name="appt_date1" value="YY/MM/DD h:m">
		</div><br>
		<div>
			<label>차선으로 가능한 진료 일시를 선택해 주세요.<br><span></span></label>
			<input type="text" name="appt_date2" value="YY/MM/DD h:m">
			
		</div><br>		
		<div>
			<label>현재 복용중인 약이 있습니까? </label><span></span>
			<input type="radio" name="medication" value="yes">예
			<input type="radio" name="medication" value="no">아니오
		</div><br>
		<div>
			<label >있다면 아래에 이름을 적어주세요.<br><span></span></label>
			<textarea style="height: 10%; width: 40%;" name="med_name"></textarea>
			<span></span>
		</div><br>
		<div>
			<label class="list">그 밖에 알려주실 사항이 있다면 아래에 적어주세요.<br><span></span></label>
			<textarea style="height: 10%; width: 40%;" name="text"></textarea>
			<span></span>
		<br><br>
		<input class="w3-amber w3-round w3-button" type="submit" name="submit" value="예약하기"></div>
	</div></form>	
	
	</center>
	
	<!-- footer contact admin -->
	<%@ include file="/mainhome/footer.jsp" %>
</body>

</div>
</html>