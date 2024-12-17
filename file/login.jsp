<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>도담도담</title>

<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script language="javascript" src="js_package.js"></script>
</head>


<body onLoad="login_focus()">

<center>
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
				<li style="background-color:#344835;"><a href="login.jsp" style="color:white;">로그인</a></li>
				<li><a href="insertMember.jsp">회원가입</a></li>
            </ul>
        </nav>
</div>
<div id="menu_bar2" class="material-symbols-outlined" onclick="toggleNav()">menu</div>
</div>
</div>


<div class="login2">
<div id="login"></div>
<div id="login2">
<form name="login" method="post" action="loginOk.jsp" target=_parent> 
	
	<div id="loginT" align=center><span style="color:#335e15; font-weight:800; font-size:35px;">도담도담</span> 에 오신 것을 환영합니다<br></div>

	<div id="id"><input type="text" name="id" id="text" placeholder="아이디를 입력해주세요"></div>
	<div id="pwd"><input type="password" name="pass" id="text" placeholder="비밀번호를 입력해주세요" onkeydown="onEnterSubmit()"></div>

	<div id="findTap"><a href="javascript:findId()">아이디찾기</a>&nbsp;|&nbsp;<a href="javascript:findPwd()">비밀번호찾기</a></div>
	
	<div align=center><a href="javascript:login_check()"><input type="button" class="submit" value="로그인"></a></div>
	<div align=center><br><a href="insertMember.jsp"><div class="signup">회원가입</div></a></div>


  </form>
</div>
</div>


<div id="mainPage2">

	<div id="footer2"><div class="footer"><br>
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
</center>
</body>
</html>