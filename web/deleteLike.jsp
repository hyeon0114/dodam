<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>���ϱ� ���� ���</title></head>
<body>
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

	String liNo = session.getId(); 
	String prdNo = request.getParameter("prdNo");

	String jsql = "delete from likecart where memId=? and prdNo = ?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);
	pstmt.setString(2, prdNo);
	
	pstmt.executeUpdate();
	response.sendRedirect("showLike.jsp");

    } catch (Exception e) {
      out.println(e);
}
%>
</body>
</html>