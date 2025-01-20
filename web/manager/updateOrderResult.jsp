<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>주문정보 수정 결과</title>
	<link rel="stylesheet" href="../style.css">
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
	 request.setCharacterEncoding("euc-kr");
	
	 String no = request.getParameter("no");
     String name = request.getParameter("receiver");
 	 String adr = request.getParameter("rcvAddress");
	  String tel = request.getParameter("memTel");
	  String delivery = request.getParameter("delivery");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String jsql = "UPDATE orderinfo SET ordReceiver=?, ordRcvAdr=?, ordRcvPhone=?, delivery=? WHERE ordNo=?";  
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
     pstmt.setString(1, name);
	 pstmt.setString(2, adr);  
	 pstmt.setString(3, tel);
	  pstmt.setString(4, delivery);
	 pstmt.setString(5, no);

     pstmt.executeUpdate();  

	 String jsql2 =  "SELECT * FROM orderinfo WHERE ordNo=?";  	 
	 PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1, no);

	 ResultSet rs = pstmt2.executeQuery();
     rs.next();

	String id = rs.getString("memId");
	String odate = rs.getString("ordDate");
	String pay = rs.getString("ordPay");
	String bank = rs.getString("ordBank");
	String cardNo= rs.getString("ordCardNo");
	String cardPass = rs.getString("ordCardPass");
%>

<div style="font-size:18px; margin:30px 0;">수정된 상품정보는 다음과 같습니다.</div>
<table id="table6">
	<tr><td>주문번호</td><td><%=no%></td></tr>	
	<tr><td>아이디</td><td><%=id%></td>	</tr>	
	<tr><td>날짜</td>  <td><%=odate%></td></tr>	
	<tr><td >주문자</td><td><%=name%></td> </tr>	
	<tr><td>주소</td> <td><%=adr%></td></tr>	
	<tr><td>휴대전화번호</td><td><%=tel %></td></tr>	
	<tr><td>총 결제 금액</td><td><%=pay%> 원</td></tr>	
	<tr><td>무통장입금</td> <td><%=bank%></td></tr>	
	<tr><td>카드번호</td><td><%=cardNo%></td></tr>	
	<tr><td>카드비밀번호</td><td><%=cardPass%></td></tr>	
	<tr><td>배송상태</td><td><%=delivery%></td></tr>	
</table><p>


<a href="orderInfo.jsp" style="color:#fff;"><div id="btn5">전체 주문정보 조회</div></a>

<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>