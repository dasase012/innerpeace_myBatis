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



// jQuery�� ����� ���� �ڵ� ����



$(document).ready(function(){



   // ��ư Ŭ���� �ݹ��Լ� ȣ�� 

   $("button").click(function(){

      // input �� �Է��ϴ� �˻����� ���� keyWord������ ��� �ѱ�ó��

	var keyWord = $("#keyWord").val();			

	keyWord = encodeURIComponent(keyWord);



	// �Էµ� keyWord������ ������ ����� ���� ���� URL ���� +keyWord ���԰� url���� ����

	var url = "https://apis.daum.net/local/v1/search/keyword.json?apikey=c65b3f7f11613aa411ef8643d0cb9aad&query="+keyWord; 



                   // AJAX�� ������Ʈ �ܺο� �ִ°� ��������

			// (�������� ���� ��ó ��å)

			

			// XML : �ڹٷ� �޾Ƽ�(���Ͻ� ����)

			// JSON : ���Ͻ� ����, ����(����)���� JSONP�� �����س�����

				// {} => x

			// JSON with Padding

				// asdasd({}) => o

				// jQuery������ �ּҵڿ� &callback=?���̸� ��밡��



       // ���� ���� ������ URL �ּҷ� �������� �� �����Ǵ� json �����͸� �̿��ϱ� ���� jQuery���� getJSON�ڵ�



       $.getJSON(url + "&callback=?" , function(json){



            // json.channel.item; �� json������ ������ ���� ���ϴ� ���� �����ϱ� ����

            // Daum API���� �������ִ� ���� �°� �ܰ躰�� ���� �ڵ�



            var items = json.channel.item;



                         // �ݺ����� ���� ���ϴ� json���� �̾Ƴ��� �ܰ�. ������ ������ �浵�� �ޱ� ����...



				$.each(items, function(i, it){

                              // items�� ���� �����ص� ����, it�� ���Ƿ� �ۼ��ص� �Ǵ� ��.

                             // ������ �浵�� ������ ����

					var latitude = it.latitude;

					var longitude = it.longitude;

					

					if(i == 0){

						var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���

						var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�

							center: new daum.maps.LatLng(latitude, longitude), //������ �߽���ǥ.

							level: 3 //������ ����(Ȯ��, ��� ����)

						};

	

						var map = new daum.maps.Map(container, options); //���� ���� �� ��ü ����

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

			<h2>��ġ�˻�</h2>

		</div>

		<div data-role="content">

			<input id="keyWord" placeholder="Ű����">

			

			<button>�˻�</button>

			<hr>

			<div id="map"></div>

		

		</div>

	</div>

</body>

</html>