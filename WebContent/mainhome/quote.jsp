<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<script language="JavaScript" type="text/JavaScript">
/* ��� */
    var wisesaying=new Array();
    wisesaying[0]="\"���Ÿ� �����ϴ� �ڰ� �̷��� �����Ͽ� ���縦 �����ϴ� �ڰ� ���Ÿ� �����Ѵ�.\"<br/>Who controls the past controls the future.<br/>Who controls the present controls the past<br/>���� ����(�����۰�)";
    wisesaying[1]="\"�繰�� ������ ������ �ʴ� ������Դ� �� �Ǹ��� ������<br/>�ູ�� ������ ������ �ʴ� ������Դ� ���� �Ǹ��� ����.\"<br/>We have no more right to consume happiness without producing it<br/>than to consume wealth without producing it.<br/>���� ������ ��(���Ϸ��� ���۰�/�Ҽ���)";
    wisesaying[2]="\"������ �������� ���������� ���� �װ��� �̰ܳ��� �Ϸε� ������ �ִ�.\"<br/>Although the world is full of suffering,<br/>it is full also of the overcoming of it.<br/>�ﷻ �̷�(�̱� �۰�/����)";
    wisesaying[3]="\"����� ������ �������θ� �ùٷ� �� �� �ִ�. �������� ���� ���� ������ �ʴ´�.\"<br/>It is only with the heart that one can see rightly.<br/>what is essential is invisible to the eye.<br/>������ �� �������丮(������ �۰�/�����)";
    wisesaying[4]="\"����� �� ����� ���ֺ��� ���� �ƴ϶� �Բ� ���� ������ �ٶ󺸴� ���̴�.\"<br/>Love dose not consist in gazing at each other,<br/>but in looking together in the same direction.<br/>������ �� �������丮(������ �۰�/�����)";
    wisesaying[5]="\"����� �� �ϴ� ���̶�� �����̳� �ູ�� ������ �ȴ�.\"<br/>Anything you're good at contributes to happiness.<br/>��Ʈ���� ����(���� ö����)";
    wisesaying[6]="\"�¸��ϸ� ���� ��� �� �ְ� �й��ϸ� ��� ���� ��� �� �ִ�.\"<br/>You can learn a little from victory.<br/>you can learn everything from defeat.<br/>ũ����Ƽ ��Ʃ��(�̱� �߱�����)";
    wisesaying[7]="\"�����θ� �ŷ��ϴ� ������� �ٸ� ����鿡�� ������ �� �ִ�.\"<br/>Only the person who has faith in himself is able to be faithful to others.<br/>���� ����(�̱� ���źм�����)";
    wisesaying[8]="\"���� �۶߸� �� �ִ� �ΰ��� ����� �ִ�. <br/>�к��� �ǰų� �Ǵ� �װ��� ���ߴ� �ſ��� �Ǵ� ���̴�.\"<br/>There are two ways of spreading light.<br/>To be candle or the mirror that reflects it.<br/>���� ��ư(�̱� �۰�)";
 
    var random_wisesaying=Math.floor(Math.random()*(wisesaying.length));
</script>
</head>
<body>
	<!-- ��� ��� -->
	<div class="w3-display-bottommiddle"
	style="text-align:center; font-size:18pt; font-family:'Nanum Brush Script', cursive; 
	color:#888888; margin-bottom: 10%; ">
	<script>document.write(wisesaying[random_wisesaying]);</script>
</div>
</body>
</html>