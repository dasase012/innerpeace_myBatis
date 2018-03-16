<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Demo - jquery-simple-datetimepicker</title>
	
	<!--Requirement jQuery-->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<!--Load Script and Stylesheet -->
	<script type="text/javascript" src="jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="jquery.simple-dtpicker.css" rel="stylesheet" />
	<!---->
	
	<style type="text/css">
		body { background-color: #fefefe; padding-left: 2%; padding-bottom: 100px; color: #101010; }
		footer{ font-size:small;position:fixed;right:5px;bottom:5px; }
		a:link, a:visited  { color: #0000ee; }
		pre{ background-color: #eeeeee; margin-left: 1%; margin-right: 2%; padding: 2% 2% 2% 5%; }
		p { font-size: 0.9rem; }
		ul { font-size: 0.9rem; }
		hr { border: 2px solid #eeeeee; margin: 2% 0% 2% -3%; }
		h3 { border-bottom: 2px solid #eeeeee; margin: 2rem 0 2rem -1%; padding-left: 1%; padding-bottom: 0.1em; }
		h4 { border-bottom: 1px solid #eeeeee; margin-top: 2rem; margin-left: -1%; padding-left: 1%; padding-bottom: 0.1em; }
	</style>
</head>
<body>
	<h3>Append to Input-fieldíê¸</h3>
	<input type="text" name="date" value="">
	<script type="text/javascript">
		$(function(){
			$('*[name=date]').appendDtpicker();
		});
	</script>
	
	<div class="w3-row w3-section">

	<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %>
	

	<!-- body board -->
	<center>
<div class="container" style="margin-top: 80px;">
	<table class="w3-table-all w3-bordered w3-centered" style="width:50%;">
	<tr height="30">
		<td width="125" align="center"><b>ìì´ë : </b></td>
		<td width="125" align="center">${member.id}</td>
		<td width="125" align="center"><b>ì´ë¦ : </b></td>
		<td width="125" align="center">${member.name}</td>
	</tr>
	<tr height="30">			
		<td width="125" align="center"><b>ì±ë³ : </b></td>
		<td width="125" >${member.gender}</td>
		<td width="125" align="center"><b>ìëìì¼ : </b></td>
		<td width="125" align="center">${member.birthdate}</td>
	</tr><tr height="30">		
		<td width="125"><b>ê¸°ë³¸ì°ë½ì² : </b></td>
		<td width="125">${member.tel}</td>
		<td width="125"><b>ì´ë©ì¼ : </b></td>
		<td width="125">${member.email}</td>
 	</tr><tr height="30">
		<td width="125"><b>ê³¼ê±° ì§ë£ê²½í ì¬ë¶ :  </b></td>
		<td width="125" align="center">${member.con_past}</td>
			<td width="125"><b>ê°ì¥ ìµê·¼ ì§ë£ì¼ : </b></td>
			<td width="125" align="center">${member.con_date}</td>
	</tr><tr height="30">
			<td width="125"><b>ê³¼ê±° ì§ë£ê³¼ëª© : </b></td>
			<td width="125" align="center">${member.con_cat}</td>
			<td width="125" align="center"/>
			<td width="125" align="center"/>			
	</tr>
		
	</table></div>
	
	<!-- input form -->
	<form class="w3-container w3-card-4 w3-white w3-text-black" action="apptPro" method="post"
	style="height: 80%; width:50%; margin-top: 10px; padding: 10;">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="id" value="${member.id}">
		<input type="hidden" name="boardid" value="${ boardid }"> <!-- form>hiddenì¼ë¡ ë´ì© ì ì¥ì í´ì¼í¨ -->
		<div class="reservation_form" style="height: 100%;">	
	<div>
			<label>ì°ë½ì² 2</label><span></span>
			<input class="w3-input w3-hover-grey" style="width: 50%;" type="text" name="tel2" >
		</div>
		
		
		<div>
			<label>ì ííì  ê¸°ê´ììì ì§ë£ì´ë ¥ </label><span></span>
			<input type="radio" name="con_past" value="ì´ì§">ì´ì§
			<input type="radio" name="con_past" value="ì¬ì§">ì¬ì§
		</div>
		<div>
	
			<select id="category1" class="w3-select" name="con_cat" style="width: 50%;" >
				<option value="">ìë´ ë°ê³ ì íë ê³¼ëª©*</option>
				<option value=""></option>
				<option value="ì±ì¸ì ë°">----ì±ì¸ì ì ê±´ê° ì ë°----</option>
				<option value="ì°ì¸ì¦">ì°ì¸ì¦</option>
				<option value="ë¶ë¸ì¡°ì ,ì¤í¸ë ì¤">ë¶ë¸ì¡°ì ,ì¤í¸ë ì¤</option>
				<option value="ë¶ë©´ì¦">ë¶ë©´ì¦</option>
				<option value="ëì¸ê³µí¬ì¦">ëì¸ê³µí¬ì¦</option>
				<option value="ì­ìì¥ì ">ì­ìì¥ì (ê±°ì,í­ì)</option>
				<option value="ì¤ë">ì¤ë(ê²ì,ì±ìí,ì )</option>
				<option value="ë¶ìì¥ì ,ê°ë°ì¦">ë¶ìì¥ì ,ê°ë°ì¦</option>
				<option value="PTSD">ì¸ì í ì¤í¸ë ì¤ ì¥ì </option>
				<option value="ë¶ë¶ê°ë±,ì»¤í ì¹´ì´ìë§">ë¶ë¶ê°ë±,ì»¤í ì¹´ì´ìë§</option>
				<option value=""></option>
				<option value="ììì²­ìë ì ë°">----ììì²­ìë ì ì ê±´ê° ì ë°----</option>
				<option value="ADHD">ì£¼ìë ¥ ê²°í ê³¼ì íëì¥ì (ADHD)</option>
				<option value="í±">í±ì¥ì </option>
				<option value="íìµì¥ì ,ì ì± ë° ì§ë¡">íìµì¥ì ,ì ì± ë° ì§ë¡ì§ë</option>
				<option value="ì²­ìë ì¸í°ë· ì¤ë">ì²­ìë ì¸í°ë· ì¤ë</option>
				<option value="ì±í­ë ¥,ìë° íì ì¦">ì±í­ë ¥ í¼í´ íì ì¦,ìë° íì ì¦</option>
			</select>
			<span></span>
		</div>
		<div>
			<select id="category2" class="w3-select" name="doc" style="width: 50%;" >
				<option value="">ë³ìì ë±ë¡ë ë¦¬ì¤í¸ìì ê³¨ë¼ì£¼ì¸ì*</option>
				<option value="ìì¸ì ê²½ì ì ê³¼ìì">ìì¸ì ê²½ì ì ê³¼ìì</option>
				<option value="ì¸ì¢ë³ì">ì¸ì¢ë³ì</option>
				<option value="ê¹ì íì ê²½ì ì ê³¼ìì">ê¹ì íì ê²½ì ì ê³¼ìì</option>
				<option value="ëë¸ì ì§ë³ì">ëë¸ì ì§ë³ì</option>
				<option value="ìì²í¥ëíêµë¶ì²ë³ì">ìì²í¥ëíêµë¶ì²ë³ì</option>
				<option value="ì°ì¸ì ì ì ê³¼ìì">ì°ì¸ì ì ì ê³¼ìì</option>
				<option value="í¨ê»íëì ì ê³¼ìì">í¨ê»íëì ì ê³¼ìì</option>
				<option value="ë°ìë§ìí´ë¦¬ë">ë°ìë§ìí´ë¦¬ë</option>
				<option value="íë³µë§ììì">íë³µë§ììì</option>
				<option value="ì±ë¹ì¼í¸ë³ì">ì±ë¹ì¼í¸ë³ì</option>
				<option value="ìì ê²½ì ì ê³¼ìì">ìì ê²½ì ì ê³¼ìì</option>
				<option value="ë©í¸ë¡ë³ì">ë©í¸ë¡ë³ì</option>
				<option value="ë°ì¬íì ì ê³¼ìì">ë°ì¬íì ì ê³¼ìì</option>
				<option value="ì´ì²ìë§ë³ì">ì´ì²ìë§ë³ì</option>
				<option value="ë¯¸ëì ì ê³¼ìì">ë¯¸ëì ì ê³¼ìì</option>
				<option value="ëí¬ë³ì">ëí¬ë³ì</option>
				<option value="ìë ¹ê·¸ë¦°ë³ì">ìë ¹ê·¸ë¦°ë³ì</option>
				<option value="ê·¼ë¡ë³µì§ê³µë¨ì°½ìë³ì">ê·¼ë¡ë³µì§ê³µë¨ì°½ìë³ì</option>
			</select>
			<span></span>
		</div><br>
		<div>
			<label>ìíìë ì§ë£ ì¼ìë¥¼ ì íí´ ì£¼ì¸ì.<br><span></span></label>
			<input class="date1" id="datetimepicker_mask" name="appt_date1" type="text" required="required" value="MM/DD/YYYY " 
			onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}" >
			<!-- <input class="timepicker timepicker-with-dropdown text-center" value="HH:mm p" /> -->
		</div><br>
		<div>
			<label>ì°¨ì ì¼ë¡ ê°ë¥í ì§ë£ ì¼ìë¥¼ ì íí´ ì£¼ì¸ì.<br><span></span></label>
			<input class="date2" id="datetimepicker2" name="appt_date2" type="text" required="required" value="MM/DD/YYYY" 
			onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}" >
			<input class="timepicker timepicker-with-dropdown text-center" value="HH:mm p"/>
		</div><br>		
		<div>
			<label>íì¬ ë³µì©ì¤ì¸ ì½ì´ ììµëê¹? </label><span></span>
			<input type="radio" name="medication" value="yes">ì
			<input type="radio" name="medication" value="no">ìëì¤
		</div><br>
		<div>
			<label >ìë¤ë©´ ìëì ì´ë¦ì ì ì´ì£¼ì¸ì.<br><span></span></label>
			<textarea style="height: 10%; width: 40%;" name="med_name"></textarea>
			<span></span>
		</div><br>
		<div>
			<label class="list">ê·¸ ë°ì ìë ¤ì£¼ì¤ ì¬í­ì´ ìë¤ë©´ ìëì ì ì´ì£¼ì¸ì.<br><span></span></label>
			<textarea style="height: 10%; width: 40%;" name="text"></textarea>
			<span></span>
		<br><br>
		<input type="submit" name="submit" value="ìì½íê¸°"></div>
	</div></form>	
	</center>
	
	<!-- footer contact admin -->
	<%@ include file="/mainhome/footer.jsp" %>
</body>


</html>
