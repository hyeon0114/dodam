<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>도담도담</title>
	<link rel="stylesheet" href="style.css">
</head>
<body><center>

<%
	request.setCharacterEncoding("euc-kr");

 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String name = request.getParameter("name");
	 String key = request.getParameter("email");

	 String jsql = "SELECT * FROM member WHERE memEmail = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();

	  if( rs.next() )
    {
        if (name.equals(rs.getString("memName")))
        {
			%>
			<center>

			<div id="check">아이디 확인</div>

			<div id="Temail">고객님의 아이디를 찾았습니다!</div>

			<div id="one"><font color=red><b><%=name%></b></font>님의 아이디는 <font color=red><b><%=rs.getString("memId")%></b></font> 입니다.</div>

			<a href="findPwd.jsp" ><input type="button" id="oneBtn" value="비밀번호 찾기"></a>
			
			<a href="login.jsp" ><input type="button" id="twoBtn" value="닫기"></a>
			</center>
			<%
		 } else { 
%>
		<center>
		<div id="check">아이디 찾기 실패</div>

				<div id="Idtitle">입력하신 회원 정보는 존재하지 않습니다. <br>다시 확인해 주세요!</div>
				<br><br>
				<a href="findId.jsp" ><input type="button" id="oneBtn" value="아이디 찾기"></a>
				
				<a href="javascript:window.close()"><input type="button" id="twoBtn" value="닫기"></a>
	   </center>
<%
        }  
    } else {
 %>
		<center>
		<div id="check">아이디 찾기 실패</div>

		<div id="Idtitle">입력하신 회원 정보는 존재하지 않습니다. <br>다시 확인해 주세요!</div><br><br>

		<a href="findId.jsp" ><input type="button" id="oneBtn" value="아이디 찾기"></a>

		<a href="javascript:window.close()"><input type="button" id="twoBtn" value="닫기"></a>
		</center>
<%
   }
%>
</body>
</html>
