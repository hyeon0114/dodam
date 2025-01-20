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
<div id="allM_Title">상품 관리</div>

<table id="table2">
	<tr>
		<td>상품사진</td><td>분류</td><td>상품번호</td><td >상품명</td><td>상품수량</td><td>상품가격</td><td>알레르기 성분</td><td>수정</td><td>삭제</td>
	</tr>	
	<tr><td colspan=9 id="hr"><hr></td></tr>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	String jsql = "SELECT * FROM GOODS";
	PreparedStatement  pstmt = con.prepareStatement(jsql);

	ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
			String ctg = rs.getString("ctgType");
			String no = rs.getString("prdNo");
    		String name =  rs.getString("prdName");	
			int price =  rs.getInt("prdPrice");
			int stock =  rs.getInt("prdStock");

%>
 <tr>      
	  <td><a href="selectDetailGoods.jsp?prdNo=<%=no%>"><img src="../image/f_img/<%=no%>.png"></a></td>
	  <td><%=ctg%></td>	
	  <td><%=no%></td>
	  <td><%=name%></td> 
	  <td><%=stock%></td>
	  <td><%=price%> 원</td>
	  <td>
	<%
		String jsql2 = "select * from allgoods where prdNo = ?";   
		PreparedStatement pstmt2  = con.prepareStatement(jsql2);
		pstmt2.setString(1, no);

		ResultSet rs2 = pstmt2.executeQuery();

		while(rs2.next()){
			String allNo = rs2.getString("allergy");
		
			String jsql3 = "select * from allergy where allergy = ?";   
			PreparedStatement pstmt3  = con.prepareStatement(jsql3);
			pstmt3.setString(1, allNo);

			ResultSet rs3 = pstmt3.executeQuery();
			rs3.next();

			String allName = rs3.getString("allName");
		%>
			<b>&nbsp;<%=allName%>&nbsp;</b>
		<%
			}
		%>
	  </td>
	  <td><a href="updateGoods.jsp?prdNo=<%=no%>"><div id="btn">수정</div></a></td>
	  <td><a href="deleteGoods.jsp?prdNo=<%=no%>"><div id="btn2">삭제</div></a></td>
 </tr>
<%
	 }  // while문의 끝
%>
</table>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div>
</body>
</html>