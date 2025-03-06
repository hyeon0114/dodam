<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>���㵵��</title>
	<link rel="stylesheet" href="style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body>

<div class="best">
<div id="cont_b_2">

<%
try {
 	String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
    String DB_ID="root";
    String DB_PASSWORD="1234";
 	 
	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String jsql = "SELECT * FROM goods ORDER BY prdAccrue DESC"  ;
	PreparedStatement  pstmt = con.prepareStatement(jsql);

	int count = 1;

	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		String prdno =  rs.getString("prdNo");
		String prdname =  rs.getString("prdName");	
		String price =  rs.getString("prdPrice");	
		if (price.length() > 3) {
		String newPrice = price.substring(0, price.length() - 3)
			.concat(",")
			.concat(price.substring(price.length() - 3));
		price = newPrice;
		}
		String ex =  rs.getString("prdEx");

		String jsql2 = "SELECT * FROM allgoods where prdNo = ?"  ;
		PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, prdno);

		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()) {
			String all = rs2.getString("allergy");
			
			String jsql3 = "SELECT * FROM allergy where allergy = ?"  ;
			PreparedStatement  pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, all);

			ResultSet rs3 = pstmt3.executeQuery();
			while(rs3.next()) {
				String allName = rs3.getString("allName");
			}
		}
%>
	<div class="cont_b_2">
<table class="hover_all">
 <tr>      
	  <td colspan=2>
		<a href="viewDetailProduct.jsp?prdNo=<%=prdno%>">
	  	<div id="hover_all">
		�˷����� ���� ��ǰ<br><br>
	<%
		String jsql3 = "select * from allgoods where prdNo = ?";   
		PreparedStatement pstmt3  = con.prepareStatement(jsql3);
		pstmt3.setString(1, prdno);

		ResultSet rs3 = pstmt3.executeQuery();

		while(rs3.next()){
			String allNo = rs3.getString("allergy");
		
			String jsql4 = "select * from allergy where allergy = ?";   
			PreparedStatement pstmt4  = con.prepareStatement(jsql4);
			pstmt4.setString(1, allNo);

			ResultSet rs4 = pstmt4.executeQuery();
			rs4.next();

			String allName = rs4.getString("allName");
		%>
			<b>&nbsp;<%=allName%>&nbsp;</b>
		<%
			}
		%>
		</div>
	<img src="image/f_img/<%=prdno%>.png" width="100" height="100" border=0> </a>

	</td>
</tr>
	<tr><td colspan=2><%=ex%></td></tr>
	<tr><td><%=prdname%></td><td><%=price%> ��</td></tr>
</table>
</div>
<%
	count++;
	}
%>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div>
</div>


</body>
</html>