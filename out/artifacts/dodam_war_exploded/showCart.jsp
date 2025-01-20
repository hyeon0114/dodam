<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>장바구니 내역 조회</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="js_package.js"></script>

</head>
<%
	String id = (String)session.getAttribute("sid");
%>
<div id="header">
<div id = "mainTop">
	<ul>
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="showLike.jsp?id=<%=id%>">찜한상품</a></li>
		<li><a href="showCart.jsp?id=<%=id%>"><b>장바구니</b></a></li>
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
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();

	String jsql = "select * from cart where memId = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next()) 
	{ 
%>
	<center>
	<br>
	<br>장바구니가 비었습니다.
	</center>
<%
	}
	else
	{
%>

<table id="cart_t">
<tr>       
   <td>상품사진</td>       
   <td>상품명</td>       
   <td>상품단가(원)</td>       
   <td>주문수량(개)</td>     
   <td>주문액(원)</td>  
   <td>상품삭제</td>
 </tr> 		

<%  
		String jsql2 = "select * from cart where memId = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, id);

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdNo");
    		int ctQty = rs2.getInt("ctQty");

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	prdName =  rs3.getString("prdName");
			String price =  rs3.getString("prdPrice");	

			int amount = Integer.parseInt(price) * ctQty;
			total = total + amount; 

			String amount2 = Integer.toString(amount);
			if (amount2.length() > 3) {
			String newamount = amount2.substring(0, amount2.length() - 3)
				.concat(",")
				.concat(amount2.substring(amount2.length() - 3));
			amount2 = newamount;
			} 


			if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			} 
%>
 <tr>       
    <td><img src="image/f_img/<%=prdNo%>.png" width="100" height="100" border=0></td>     
	<td><%=prdName%></td> 
	<td><%=price%></td> 
	<td><%=ctQty%></td>
    <td><%=amount2%> 원</td>
    <td><div id="deleteBtn"><a href="deleteCart.jsp?prdNo=<%=prdNo%>">삭제</a></div></td> 	
 </tr>
<%
	     }  // while문의 끝
			String total2 = Integer.toString(total);
			if (total2.length() > 3) {
			String newtotal = total2.substring(0, total2.length() - 3)
				.concat(",")
				.concat(total2.substring(total2.length() - 3));
			total2 = newtotal;
			} 
 %>
  <tr>
	<td colspan = 4 id="allText">전체 주문총액</td>
	<td id="allPrice"><%=total2%> 원</td>
	<td>(선택물품 총합)</td>
  </tr>
 </table>      

<br><br>
<div class="btn">
	<div id="btn_c"><a href="deleteAllCart.jsp" >장바구니 비우기</a></div>
	<div id="btn2_c"><a href="order.jsp" >주문하기</a></div>
</div>

<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>
   
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
 </center> 
</body>  
</html> 