<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="js_package.js"></script>

<script>
$(document).ready(function() {
	$("#foru_form").submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "foru_submit2.jsp",
            data: $(this).serialize(),
            success: function(response) {
                $("#foru_M").html(response);
				$('html, body').animate({
                    scrollTop: $("#foru_c").offset().top
                }, 1000);
            }
        });
    });
});

</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("sid");
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
            	<li><a href="foru_2.jsp?id=<%=id%>" style="color: #cc5555;">식품 알레르기 맞춤 상품</a></li>
			<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>

<%

try {
 	String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
    String DB_ID="root";
    String DB_PASSWORD="1234";
 	 
	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql3 = "SELECT * FROM member WHERE memId=?";
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1, id);

	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();

	String name2 = rs3.getString("memName");
%>
<form name="foru" method=post action="foru_submit2.jsp" id="foru_form" target=main>
	<div id="foru_b"><img src="image/foru/foru.png"></div>
	<div class="foru_T"><font style="color:#89bc8c; font-weight:600;"><%=name2%></font>님이 원하시는 정보를 선택해 보세요 !</div>
	<div class="all_foru">
		<div class="allergy2">
		<div id="aTitle2"><font style="color:#89bc8c; font-weight:600;"><%=name2%></font>님이 가진 알레르기 유발 식품을 선택해 주세요.</div>

<%

	String jsql = "SELECT * FROM memall WHERE memId=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	StringBuilder allergies = new StringBuilder();

	while(rs.next()) {
		String allN = rs.getString("allergy")+" ";
		allergies.append(allN);
	}
	
	String sb = allergies.toString();
	String[] allNArray = sb.split(" ");

	String jsql2 = "SELECT * FROM allergy WHERE allergy not like 0" ;
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 
	ResultSet rs2 = pstmt2.executeQuery();
		
		while(rs2.next()) {
			String no = rs2.getString("allergy");
			String name =  rs2.getString("allName");
			boolean isChecked = false;

			for(String n: allNArray) {
				if(no.equals(n)) {
					isChecked = true;
					break;
				}
			}
			
%>	
			<label for="allergy<%=no%>" id="l_allergy<%=no%>">
				<input type="checkbox" id="allergy<%=no%>" class="check5" onchange="yncheck2(this)" name="allergy<%=no%>" <% if (isChecked) out.print("checked"); %> value=<% out.print('Y'); %>>
				<span class="circle5"><%=name%></span>
			</label>
<%
		}
%> 

<input type="button" id="all_chk" value="모두선택">

<script>
var allChecked2 = false;
document.getElementById("all_chk").addEventListener("click", function() {
  var checkboxes2 = document.getElementsByClassName("check5");
  for (var k = 0; k < checkboxes2.length; k++) {
    checkboxes2[k].checked = !allChecked2;
  }
  allChecked2 = !allChecked2;
  
  var button = document.getElementById("all_chk");
  if (allChecked2) {
    button.value = "초기화";
  } else {
    button.value = "모두선택";
  }
});
</script>

<div class="ingre">

<div id="in_Title">바로 확인하고 싶은 영양성분을 선택해 주세요. <div id="ingre_foru"><img src="image/icon_infor.jpg">
<div id="foru_icon"><img src="image/ingre_foru2.jpg"></div>
</div></div>

<div class="ingreChk">
	<label for="ingre1"><input type="checkbox" id="ingre1" value="car" name="ingre" class="check1"><span class="circle2">탄수화물</span></label>
	<label for="ingre2"><input type="checkbox" class="check1" id="ingre2" value="pro" name="ingre" ><span class="circle2">단백질</span></label>
	<label for="ingre3"><input type="checkbox" class="check1" id="ingre3" value="tFat" name="ingre" ><span class="circle2">지방</span></label>
	<label for="ingre4"><input type="checkbox" class="check1" id="ingre4" value="sod" name="ingre" ><span class="circle2">나트륨</span></label>
	<label for="ingre5"><input type="checkbox" class="check1" id="ingre5" value="sug" name="ingre" ><span class="circle2">당류</span></label>
	<label for="ingre6"><input type="checkbox" class="check1" id="ingre6" value="chol" name="ingre" ><span class="circle2">콜레스테롤</span></label>
	<input type="button" id="all_chk2" value="모두선택">
</div>
</div>

<script>
var allChkBtn = document.getElementById("all_chk2");
allChkBtn.addEventListener("click", function() {
  var checkboxes = document.getElementsByClassName("check1");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = !checkboxes[i].checked;
  }

  if (allChkBtn.value === "모두선택") {
    allChkBtn.value = "초기화";
  } else {
    allChkBtn.value = "모두선택";
  }
});
</script>


<div id="btn_foru">
<input type="submit" id="foru_btn_s" value="조회하기">
<input type="reset" id="reset_btn" value="초기화" onclick="resetCheckboxes()">
</div>

</div>
</div>
<input type=hidden name="id" value="<%=id%>" id="inputType">

</form>


<div id="foru_c"><br></div>
<div id="foru_M"></div>
<%
    } catch (Exception e) {
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

</body>
</html>