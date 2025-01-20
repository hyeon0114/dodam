<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>주문정보 조회</title>
	
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

<div id="allM_Title">주문정보 관리</div>

<table id="table3">
	<tr>
		<td>주문번호</td><td>아이디</td><td id="date">날짜</td><td >주문자</td><td>주소</td><td>휴대전화번호</td><td>총 결제 금액</td><td>결제</td><td>배송 상태</td><td>수정</td><td>삭제</td>
	</tr>	
	<tr><td colspan=12 id="hr"><hr></td></tr>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	String jsql = "SELECT * FROM orderinfo";
	PreparedStatement  pstmt = con.prepareStatement(jsql);

	ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
			String no = rs.getString("ordNo");
			String id = rs.getString("memId");
			String odate = rs.getString("ordDate");
			String name= rs.getString("ordReceiver");
			String adr = rs.getString("ordRcvAdr");
			String tel = rs.getString("ordRcvPhone");
			String pay = rs.getString("ordPay");
			String bank = rs.getString("ordBank");
			String cardNo= rs.getString("ordCardNo");
			String cardPass = rs.getString("ordCardPass");
			String delivery = rs.getString("delivery");
%>

 <tr>      
	  <td><%=no%></td>
	  <td><%=id%></td>	
	  <td><%=odate%></td>
	  <td><%=name%></td> 
	  <td><%=adr%></td>
	  <td><%=tel%></td>
	  <td><%=pay%> 원</td>
	  <td><%=bank%><%=cardNo%> <%=cardPass%></td>
	  <td><%=delivery%></td>
	  <td><a href="updateOrder.jsp?ordNo=<%=no%>"><div id="btn">수정</div></a></td>
	  <td><a href="deleteinfo.jsp?ordNo=<%=no%>"><div id="btn2">삭제</div></a></td>
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
</center>
</body>
</html>