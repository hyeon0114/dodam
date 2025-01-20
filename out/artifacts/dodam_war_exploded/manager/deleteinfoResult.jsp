<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>도담도담</title>
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

	 String ordNo = request.getParameter("ordNo");

	String jsql = "delete from orderinfo where ordNo=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ordNo);
	
    pstmt.executeUpdate();

	response.sendRedirect("orderInfo.jsp");

   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>