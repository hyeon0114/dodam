<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
<title>회원 정보 삭제</title>
<link rel="stylesheet" href="../style.css">
<script language="javascript" src="js_package.js"></script>
</head>
<body>
<center>

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

<div id="delete_box">
<div id="title5">탈퇴하기</div>

<div id="title5">정말 탈퇴하시겠습니까? 탈퇴 이후 정보는 되돌릴 수 없습니다.</div>
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
	<tr><td><a href="deleteMemberResult.jsp?id=<%=id%>"><div id="onebtn5">예</div></a></td>
	<td><a href="mypage.jsp"><div id="twoBtn5">아니요</div></a></td></tr>
</table>
</div>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>