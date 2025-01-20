<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="style.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>


</head>


<body>
<script>

$(document).ready(function(){
	$("#mypage_div").load("showOrder.jsp");

	$("#wrap2 a, #level").click(function(e){
		e.preventDefault();
		var jsp = $(this).data("jsp");
		$("#mypage_div").load(jsp);
	});
});
</script>
<%
	String id = (String)session.getAttribute("sid");
if (id == null)
{ 
%>
	<script>
		var errorMessage = "로그인이 필요합니다!";
        alert(errorMessage);
        window.location.href = "login.jsp";
	</script>
<%
}
else
{

	 try{
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String jsql = "select * from member where memId = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

	String name = rs.getString("memName");
	String adr = rs.getString("memAdr");
	String point = rs.getString("memPoint");
	String percent = rs.getString("percent");

		if (point.length() > 3) {
		String newpoint = point.substring(0, point.length() - 3)
			.concat(",")
			.concat(point.substring(point.length() - 3));
		point = newpoint;
		} 

	String percent2 = null;

	if (percent.equals("0.1")){
		percent2 = "Friends";
	} else{
		percent2 = "Friends";
	}

	String jsql2 = "select * from orderinfo where memId = ?";   
	PreparedStatement pstmt2  = con.prepareStatement(jsql2);
	pstmt2.setString(1, id);

	ResultSet rs2 = pstmt2.executeQuery();
	int count = 0;
	while(rs2.next()){
		count++;
	}

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
				<li style="background-color:#344835;"><a href="mypage.jsp?id=<%=id%>" style="color:white;">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>

<div id="wrap3">
	<div id="wrap2"> 
		<div id="profile">
			<div class="level"><img src="image/level.png"></div>
			<div class="name"><%=name%>님</div>

			<a href="#" data-jsp="updateMember.jsp?id=<%=id%>" target=main><div id="info" class="mypage">개인 정보 수정</div></a>
			<a href="#" data-jsp="deleteMember.jsp?id=<%=id%>"><div id="deleteM">탈퇴</div></a>

						
			<div id="level" class="mypage"><a href="#" data-jsp="level.jsp"><span style="color:#5d865f;"><%=percent2%></span> 등급혜택 보기 ></a></div>

		</div>

			<div id="list">
				<div class="point1">도담 적립금</div>
				<div class="point2"><%=point%> 원</div>
			</div>

			<a href="#" data-jsp="showOrder.jsp?id=<%=id%>" target=main><div id="list" class="mypage">
				<div class="point1">주문내역</div>
				<div class="point2"><%=count%> 건</div>
			</div></a>
			<a href="#" data-jsp="updateAllergy.jsp?id=<%=id%>" target=main ><div class="list" class="mypage">
				<div class="point1">알레르기 정보 수정</div>
				<div class="point2">
<%
	String jsql3 = "select * from memall where memId = ?";   
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1, id);

	ResultSet rs3 = pstmt3.executeQuery();
	while(rs3.next()){
		String allNo = rs3.getString("allergy");
				
		String jsql4 = "select * from allergy where allergy = ?";   
		PreparedStatement pstmt4  = con.prepareStatement(jsql4);
		pstmt4.setString(1, allNo);

		ResultSet rs4 = pstmt4.executeQuery();
		rs4.next();

		String allName = rs4.getString("allName");
		%>
			&nbsp;<%=allName%>&nbsp;
		<%
			}
		%></div></a>

	</div>
</div>

<div id="mypage_div"></div>
<%
    } catch(Exception e) {
		out.println(e);
}
%>

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
<%
}
%>
</body>
</html> 