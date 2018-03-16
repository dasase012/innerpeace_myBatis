<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>



<style type="text/css">

	#map{

		border:blue outset 3px;

		width:98%;

		height:150px;

	}

</style>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c65b3f7f11613aa411ef8643d0cb9aad&libraries=services"></script>
<script>



// jQuery를 사용을 위한 코드 열기



$(document).ready(function(){



   // 버튼 클릭시 콜백함수 호출 

   $("button").click(function(){

      // input 에 입력하는 검색어의 값을 keyWord변수에 담고 한글처리

	var keyWord = $("#keyWord").val();			

	keyWord = encodeURIComponent(keyWord);



	// 입력된 keyWord변수의 값으로 결과를 내기 위해 URL 끝에 +keyWord 삽입과 url변수 선언

	var url = "https://apis.daum.net/local/v1/search/keyword.json?apikey=c65b3f7f11613aa411ef8643d0cb9aad&query="+keyWord; 



                   // AJAX로 프로젝트 외부에 있는거 못가져옴

			// (브라우저의 동일 출처 정책)

			

			// XML : 자바로 받아서(프록시 서버)

			// JSON : 프록시 서버, 서버(다음)에서 JSONP를 적용해놨으면

				// {} => x

			// JSON with Padding

				// asdasd({}) => o

				// jQuery에서는 주소뒤에 &callback=?붙이면 사용가능



       // 위와 같은 이유로 URL 주소로 연결했을 때 제공되는 json 데이터를 이용하기 위한 jQuery내의 getJSON코드



       $.getJSON(url + "&callback=?" , function(json){



            // json.channel.item; 은 json데이터 내에서 내가 원하는 값에 접근하기 위해

            // Daum API에서 제공해주는 형식 맞게 단계별로 들어가는 코드



            var items = json.channel.item;



                         // 반복문을 통해 원하는 json값을 뽑아내는 단계. 지금은 위도와 경도를 받기 위해...



				$.each(items, function(i, it){

                              // items는 위에 선언해둔 변수, it는 임의로 작성해도 되는 거.

                             // 위도와 경도의 변수를 저장

					var latitude = it.latitude;

					var longitude = it.longitude;

					

					if(i == 0){

						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

						var options = { //지도를 생성할 때 필요한 기본 옵션

							center: new daum.maps.LatLng(latitude, longitude), //지도의 중심좌표.

							level: 3 //지도의 레벨(확대, 축소 정도)

						};

	

						var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

					}

					});	

				});				

			});

                $("#keyWord").val("");

		});

</script>



</head>

<body>

	<div data-role="page" data-theme="b">

		<div data-role="header" data-theme="b">

			<h2>위치검색</h2>

		</div>

		<div data-role="content">

			<input id="keyWord" placeholder="키워드">

			

			<button>검색</button>

			<hr>

			<div id="map"></div>

		

		</div>

	</div>

</body>

</html>