<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script language="javascript" src="js_package.js"></script>
</head>
<body>
<%
	String id =(String)session.getAttribute("sid");

if (id == null)
{ 
%>
<div id="header2">
<div class="menu2">
	<div id="logo2">
		<header class="top2"><a href="main.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap4">
        <nav>
            <ul>
                <li><a href="news.jsp">소식</a></li>
                <li><a href="Products.jsp">상품</a></li>
				<li><a href="search.jsp">식품 알레르기 가이드</a></li>
                <li><a href="foru.jsp">식품 알레르기 맞춤 상품</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="insertMember.jsp">회원가입</a></li>
            </ul>
        </nav>
</div>
<div id="menu_bar2" class="material-symbols-outlined" onclick="toggleNav()">menu</div>
</div>
</div>	

<%
}
else
{
%>

<div id="header">
<div id = "mainTop">
	<ul>
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="showLike.jsp?id=<%=id%>">찜한상품</a></li>
		<li><a href="showCart.jsp?id=<%=id%>">장바구니</a></li>
		<li><a href="center.jsp?id=<%=id%>">고객센터</a></li>
	</ul>
</div>

<div class="menu">
	<div id="logo">
		<header class="top"><a href="main_M.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap">
        <nav>
            <ul>
                <li><a href="news.jsp">소식</a></li>
               	<li><a href="Products.jsp">상품</a></li>
				<li><a href="search.jsp">식품 알레르기 가이드</a></li>
            	<li><a href="foru_2.jsp?id=<%=id%>">식품 알레르기 맞춤 상품</a></li>
				<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>
<%
}
%>
<div id="site">사이트맵</div>

<div class="site">
	<nav id="site1">
		<ul>
			<li><a href="news.jsp">소식</a></li>
			<li>회사소개</li>
			<li>도담소식</li>
		</ul>
	</nav>
	<nav id="site2">
		<ul>
			<li><a href="Products.jsp">제품</a></li>
			<li>전체상품</li>
			<li>상품  검색</li>
		</ul>
	</nav>
	<nav id="site3">
		<ul>
			<li><a href="search.jsp">식품 알레르기 가이드</a></li>
			<li>식품 알레르기 가이드</li>

		</ul>
	</nav>
	<nav id="site4">
		<ul>
<%
		if (id == null){ 
%>
			<li><a href="foru.jsp">식품 알레르기 맞춤상품</a></li>
			<li>맞춤상품 추천</li>
<%
		}else{
%>
			<li><a href="foru_2.jsp">식품 알레르기 맞춤상품</a></li>
			<li>맞춤상품 추천</li>
<%
}
%>
		</ul>
	</nav>
</div>

<div class="site2">
	<nav id="site1">
		<ul>
			<li><a href="">고객센터</a></li>
			<li><div id="line_site"></div></li>
			<li>자주 묻는 질문</li>
			<li>1:1 문의</li>
		</ul>
	</nav>
	<nav id="site2">
		<ul>
			<li><a href="mypage.jsp">마이페이지</a></li>
			<li><div id="line_site"></div></li>
			<li>회원 정보 수정</li>
			<li>나의 주문</li>
			<li>회원 탈퇴</li>
		</ul>
	</nav>
	<nav id="site3">
		<ul>
			<li><a href="login.jsp">회원</a></li>
			<li><div id="line_site"></div></li>
			<li><a href="insertMember.jsp">회원가입</a></li>
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="javascript:findId()">아이디찾기</a></li>
			<li><a href="javascript:findPwd()">비밀번호찾기</a></li>
		</ul>
	</nav>
</div>
<div id="mainPage">

	<div id="footer"><div class="footer"><br>
			<div id="fLeft">
				<p><span class="footer_Fm"><a href="center.jsp">고객센터</a></span></p>
				  <ul>
					  <li><span class="footer_F"> 운영시간</span> 08:00am ~ 18:00pm </li>
					  <li><span class="footer_F"> 점심시간</span> 12:30pm ~ 13:30pm </li>
					  <li><span class="footer_F"> 고객센터 휴무</span> 주말, 공휴일 </li>
				  </ul>
			</div>
			<br><br><br>
			<div id="fRight">
			<div id="fRx"><a href="privacy.jsp"><b>개인정보처리방침</b></a> | <a href="news.jsp">회사소개</a> | <a href="sitemap.jsp">사이트맵</a>  | <a href="manager/manager_login.jsp">관리자 로그인</a></div>
				<ul>
				<li>법인명 (상호) : 도담도담(주) | 대표: 김세현 | 전화: 1577-1659</li>
				<li>사업자등록번호 : 150-72-35764 [사업자정보확인]</li>
				<li>개인정보관리책임자 : 김세현, 조현경</li>
				</ul>
			</div>
			</div>
	
	</div></div>
</div>
</body>
</html>