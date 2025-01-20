<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
<title>회원 정보 삭제</title>
	
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
	
	 String key = request.getParameter("id");
	
     String jsql = "select * from member where memId = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String id = rs.getString("memId");
	 String pwd =  rs.getString("memPwd");	
	 String name = rs.getString("memName");
	 String email =  rs.getString("memEmail");
	 String adr =  rs.getString("memAdr");
	 String phone =  rs.getString("memPhone");
	 String sex =  rs.getString("memSex");
%>
<br><br>
<div id="manager_title">회원 정보 삭제(탈퇴) 확인</div>

<div id="title5"> 다음의 회원정보를 삭제하시겠습니까?</div>
<br>
<table>
		<tr><td width=100>아이디</td><td><%=id%></td></tr>
		<tr><td>비밀번호</td><td><%=pwd%></td></tr>
		<tr><td>성명</td><td><%=name%></td></tr>
		<tr><td>이메일</td><td><%=email%></td></tr>
		<tr><td>주소</td><td><%=adr%></td></tr>
		<tr><td>휴대폰번호</td><td><%=phone%></td></tr>
		<tr><td>성별</td><td><%=sex%></td></tr>
</table><p>
<br><br>
<table id="deleteT">
	<tr><td><a href="deleteMemberResult.jsp?id=<%=id%>"><div id="btn5">삭제</div></a></td>
	<td><a href="selectAllMember.jsp"><div id="btn4">취소</div></a></td></tr>
</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>