<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>��ǰ ���� �Ϸ�</title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("prdNo");
	 
     String jsql = "DELETE FROM GOODS WHERE prdNo=?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	
 	 pstmt.executeUpdate();

	 String jsql2 = "DELETE FROM INGREDIENT WHERE prdNo=?";        
	 PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1, key);
	
 	 pstmt2.executeUpdate();

	 String jsql3 = "DELETE FROM allgoods WHERE prdNo=?";        
	 PreparedStatement  pstmt3 = con.prepareStatement(jsql3);
	 pstmt3.setString(1, key);
	
 	 pstmt3.executeUpdate();
%>
 <jsp:forward page="selectAllGoods.jsp"/>  
 		
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>