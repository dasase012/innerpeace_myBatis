<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta charset="euc-kr" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>������ ���� ǥ���ϱ�</title>
    <script src="../../docs/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../../docs/js/examples-base.js"></script>
    <script type="text/javascript" src="../../docs/js/highlight.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vcK0vxqV3L0dmbMHCq6D&submodules=geocoder"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style>
  
  body {
    margin: 40px 10px;
    padding: 50;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }
  #map_search{
  	width: 25%;
  	margin-left: 40%;
  	margin-right: 40%;
  }
  #map {
    max-width: 45%;
    height: 65%;
    margin: 20 auto;
    margin-top: 2%;
    margin-right: 40%;
    margin-bottom: 20%;
  } 
  
#navigation{
  	width: 60%;
  	margin-left: 20%;
  	margin-right: 20%;
  }	
  form.select{
  	width: 30%;
  	margin-left: 20%;
  	
  }
  form.input{
  	margin-right: 20%;
  	
  }
  
</style>
<script type="text/javascript">
	function w3_open() {
	    document.getElementById("mySidebar").style.display = "block";
	}
	function w3_close() {
	    document.getElementById("mySidebar").style.display = "none";
	}
</script>
</script>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<body>
	<!-- home logo top right -->
		<!-- <a href="/innerpeace_aaa/mainhome/home">
		<i id="home" class="material-icons" style="font-size:36px">home</i>
		</a> -->
	<!-- Logout logo top right -->
		<div class="w3-right">
		<a href="/innerpeace_aaa/member/logout">
		<i id="logout" class="material-icons" style="font-size:36px; ">power_settings_new</i>
		</a></div>
	 
	
	<!-- header navigation -->
		
	
	<!-- Sidebar -->
		<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
		  <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
		    <p><div class="w3-container">
		    	<h5 class="w3-center">WELCOME</h5>
		  	</div></p>
		    <p>
		    <a href="/innerpeace_aaa/doc_find/map.jsp" class="w3-bar-item w3-button">����/�Ƿ��� ã��</a>
		    <a href="/innerpeace_aaa/reservation/reservation.jsp" class="w3-bar-item w3-button">���Ό���ϱ�</a>
		    <a href="#" class="w3-bar-item w3-button">�������</a>
		    <a href="/innerpeace_aaa/videochat/video.html" class="w3-bar-item w3-button">��������</a>
		    <a href="#" class="w3-bar-item w3-button">������</a>
		    <a href="#" class="w3-bar-item w3-button">ȸ������</a>
			</p>
		</div>
		
		<!-- Page Content -->
		<div class="w3-white w3-left" >
		  <a onclick="w3_open()" class="w3-bar-item w3-large w3-white"><i class="fa fa-reorder" style="font-size:36px;"></i></a>
		  
		</div>
	
	<!-- map search -->
	<form class="w3-container w3-card-4" action="/action_page.php" style="width: 50%; margin-left: 25%; margin-right: 25%;">
	  <div class="radio w3-display-center" style="margin-left: 35%;" >
         <input type="radio" id="radio1" name="keyfield" value="mb_addr1" checked=checked onClick="calc('b1');" ><label for="radio1"><span><span></span></span>������</label>
         <input type="radio" id="radio2" name="keyfield" value="mb_5"  onClick="calc('b2');"   ><label for="radio2"><span><span></span></span>������</label>
         <input type="radio" id="radio3" name="keyfield" value="mb_name" onClick="calc('b2');"  ><label for="radio3"><span><span></span></span>�����Ǹ�</label>
      </div>
		 
	  <select class="w3-select w3-border" name="option" style="width: 20%;">
	    <option value="" disabled selected>��/��</option>
	    <option value='����'>����</option> 
           <option value='�λ�'>�λ�</option> 
           <option value='�뱸'>�뱸</option> 
           <option value='��õ'>��õ</option> 
           <option value='����'>����</option> 
           <option value='����'>����</option> 
           <option value='���'>���</option> 
           <option value='���'>���</option> 
           <option value='����'>����</option> 
           <option value='���'>���</option> 
           <option value='�泲'>�泲</option> 
           <option value='����'>����</option> 
           <option value='����'>����</option> 
           <option value='���'>���</option> 
           <option value='�泲'>�泲</option> 
           <option value='����'>����</option> 
           <option value='����'>����</option> 
	  </select>
	  <!-- <select name='key2'  class=select> 
        <option value=''>������</option> 
      </select> -->
	  <select class="w3-select w3-border" name="option" style="width: 20%; " >
	    <option value="" disabled selected>Choose your option2</option>
	    <option value="1">Option 1</option>
	    <option value="2">Option 2</option>
	    <option value="3">Option 3</option>
	  </select>
	  <select class="w3-select w3-border" name="option" style="width: 20%;" >
	    <option value="" disabled selected>Choose your option3</option>
	    <option value="1">Option 1</option>
	    <option value="2">Option 2</option>
	    <option value="3">Option 3</option>
	  </select>
		<input type="text" placeholder="Search.." name="search2" style="width: 30%; " >
	    <button type="submit"><i class="fa fa-search"></i></button>
	</form>
	
	<!-- <form class="example" action="/action_page.php" style="margin:auto;max-width:300px">
	  <input type="text" placeholder="Search.." name="search2">
	  <button type="submit"><i class="fa fa-search"></i></button>
	</form> -->
	
	 <!-- <div class="page_container">
            <div class="srch">
                <form method="post" name="form1" action="#">
                <div class="radio">
                  <input type="radio" id="radio1" name="keyfield" value="mb_addr1" checked=checked onClick="calc('b1');"><label for="radio1"><span><span></span></span>������</label>
                  <input type="radio" id="radio2" name="keyfield" value="mb_5"  onClick="calc('b2');"   ><label for="radio2"><span><span></span></span>������</label>
                  <input type="radio" id="radio3" name="keyfield" value="mb_name" onClick="calc('b2');"  ><label for="radio3"><span><span></span></span>�����Ǹ�</label>
                </div>
                ������ �˻�
                <div class="select_box" id="selectbox"  style="display:;">
                    <select title="�˻�����" name=key  onchange="change(this.selectedIndex);">
					                       <option value="">��/��</option>
                      <option value='����'>����</option> 
                      <option value='�λ�'>�λ�</option> 
                      <option value='�뱸'>�뱸</option> 
                      <option value='��õ'>��õ</option> 
                      <option value='����'>����</option> 
                      <option value='����'>����</option> 
                      <option value='���'>���</option> 
                      <option value='���'>���</option> 
                      <option value='����'>����</option> 
                      <option value='���'>���</option> 
                      <option value='�泲'>�泲</option> 
                      <option value='����'>����</option> 
                      <option value='����'>����</option> 
                      <option value='���'>���</option> 
                      <option value='�泲'>�泲</option> 
                      <option value='����'>����</option> 
                      <option value='����'>����</option> 
 
                    </select>
					 <select name='key2'  class=select> 
                      					  
					  <option value=''>������</option> 
                    </select>  -->
					
	
	<!-- map left-body -->
	<div id="map" class="section">
	    <h2>���� ǥ��</h2>
	    <p>����</p>
	    <code id="snippet" class="snippet"></code>
		</div>
		<script id="code">
		//������ ������ HTML ������Ʈ �Ǵ� HTML ������Ʈ�� id�� �����մϴ�.
		var mapDiv = document.getElementById('map'); // 'map' ���� �����ص� ����
		
		//�ɼ� ���� ���� ��ü�� �����ϸ� �����û�� �߽����� �ϴ� 11������ ������ �����˴ϴ�.
		var map = new naver.maps.Map(mapDiv);
		</script>
	
	<!-- map right-body -->
	<div id="hoslist" class="section1">
		
	</div>
	
	<!-- footer contact admin -->
	<h6 class="w3-bottom" align="center">contact: admin@innerpeace.com</h6>
</body>
</html>