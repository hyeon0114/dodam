<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>도담도담 관리자 모드</title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>

<script>
	function resizeIframe(obj){ obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px' ; }
</script>
</head>

 <body>
 <center>

<%
	String id = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	접속관리자 ID : <font color="green"><%=id%></font> &nbsp;&nbsp;|&nbsp;&nbsp; 접속 시각 : <font color="green"><%=curDate %></font> 
</div>
<div class="logout">
	<a href="../logout.jsp" target=_parent >관리자 로그아웃</a>
	<a href="../main.jsp" target=_parent >도담도담</a>
</div>

<div id="managerT">관리자 모드</div>

<div id="menu">
	<ul>
		<li>
			<a href="selectAllMember.jsp" target=main>회원 관리</a>
			<ul>
				<li><a href="insertMember.jsp" target=main>신규 회원 등록</a></li>
				<li><a href="selectAllMember.jsp" target=main>회원 조회/수정/삭제</a></li>
			</ul>
		</li>
		<li>
			<a href="selectAllGoods.jsp" target=main>상품 관리</a>
			<ul>
				<li><a href="insertGoods.jsp" target=main>신규 상품 등록</a></li>
				<li><a href="selectAllGoods.jsp" target=main>상품 조회/수정/삭제</a></li>
			</ul>
		</li>
		<li>
			<a href="orderInfo.jsp" target=main>주문 관리</a>
			<ul>
				<li><a href="orderInfo.jsp" target=main>주문정보 조회/수정/삭제</a></li>
				<li><a href="orderProduct.jsp" target=main>주문상품 조회/수정/삭제</a></li>
			</ul>
		</li>
	</ul>
</div>

</div>
</center>

</body>
</html>