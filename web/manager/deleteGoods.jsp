<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>상품 조회</title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>

</head>

<body>
<center>

<%
	String sid = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	접속관리자 ID : <font color="green"><%=sid%></font> &nbsp;&nbsp;|&nbsp;&nbsp; 접속 시각 : <font color="green"><%=curDate %></font> 
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

<%
try {
	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";

	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String key = request.getParameter("prdNo");
	
     String jsql = "SELECT * FROM GOODS WHERE prdNo = ?";       
	 PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String no = rs.getString("prdNo");
	 String name =  rs.getString("prdName");	
	 String price =  rs.getString("prdPrice");
	 int stock =  rs.getInt("prdStock");	
	 int  accrue= rs.getInt("prdAccrue");
	 String ctg =  rs.getString("ctgType");

	
%>

<div id="manager_title">등록된 상품 정보 삭제</div>
<div> 다음과 같이 등록된 상품정보 내용을 삭제하시겠습니까?</div><br>
<table>
	<tr>
		<td>카테고리분류</td>
		<td><%=ctg%></td>
		<td rowspan="7"><img src="../image/f_img/<%=no%>.png"></td>
	</tr>
	<tr><td>상품번호</td><td><%=no%></td></tr>
	<tr><td>상품명</td><td><%=name%></td></tr>
	<tr><td>상품가격</td><td><%=price%> 원</td></tr>
	<tr><td>재고수량</td><td><%=stock%> 개</td></tr>
	<tr><td>누적판매량</td><td><%=accrue%> 개</td></tr>
</table><p>
<br><br>
<table id="deleteT">
	<tr><td><a href="deleteGoodsResult.jsp?prdNo=<%=no%>"><div id="onebtn3">삭제</div></a></td>
	<td><a href="selectAllGoods.jsp"><div id="twoBtn3">취소</div></a></td></tr>
</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</div>
</center>
</body>
</html>