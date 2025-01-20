<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>도담도담</title>

	<style>
	 	*{margin:  0 auto; font-family:맑은 고딕; padding: 0;}
		#title{font-size:27px; color:orange; margin-bottom:30px;}
	</style>
</head>

<body>
<center>
<% 
String id = (String)session.getAttribute("sid");
%>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();
	String caseNo = request.getParameter("case");

	String jsql = "delete from cart where memId=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);
	
    pstmt.executeUpdate();


%>
	<script>
		var errorMessage = "상품 주문이 완료되었습니다.\n주문하신 상품은 주문 완료 후 2일 이내에 배송될 예정입니다.";
        alert(errorMessage);
        window.location.href = "mypage.jsp";
	</script>
<%
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>